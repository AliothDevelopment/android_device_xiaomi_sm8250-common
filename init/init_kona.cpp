/*
   Copyright (c) 2016, The CyanogenMod Project
   Copyright (c) 2019, The LineageOS Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdlib>
#include <fstream>
#include <string.h>
#include <sys/sysinfo.h>
#include <unistd.h>
#include <android-base/logging.h>
#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"

using android::base::GetProperty;
int property_set(const char *key, const char *value) {
    return __system_property_set(key, value);
}

char const *heapstartsize;
char const *heapgrowthlimit;
char const *heapsize;
char const *heapminfree;
char const *heapmaxfree;
char const *heaptargetutilization;
bool changed = false;
char const *ro_build_fingerprint = "google/redfin/redfin:11/RQ2A.210405.005/7181113:user/release-keys"; 
char const *ro_build_description = "redfin-user 11 RQ2A.210405.005 7181113 release-keys"; 

void check_device()
{
    struct sysinfo sys;

    sysinfo(&sys);

    if (sys.totalram < 6144ull * 1024 * 1024) {
        // from - phone-xhdpi-6144-dalvik-heap.mk
        heapstartsize = "16m";
        heapgrowthlimit = "256m";
        heapsize = "512m";
        heapmaxfree = "32m";
    } else {
        // 8GB & 12GB RAM
        heapstartsize = "32m";
        heapgrowthlimit = "512m";
        heapsize = "768m";
        heapmaxfree = "64m";
    }
        heaptargetutilization = "0.5";
        heapminfree = "8m";
}

void property_override(char const prop[], char const value[], bool add = true)
{
    prop_info *pi;
    pi = (prop_info *) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else if (add)
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void load_fprops() {
    property_override("ro.product.name", "redfin");
    property_override("ro.build.description", ro_build_description);
    property_override("ro.build.fingerprint", ro_build_fingerprint);
    property_override("ro.bootimage.build.fingerprint", ro_build_fingerprint);
    property_override("ro.system.build.fingerprint", ro_build_fingerprint);
    property_override("ro.vendor.build.fingerprint", ro_build_fingerprint);
    property_override("ro.product.build.fingerprint", ro_build_fingerprint);
    property_override("ro.odm.build.fingerprint", ro_build_fingerprint);
    property_override("ro.system_ext.build.fingerprint", ro_build_fingerprint);
}

void load_umi() {
    property_override("ro.product.model", "Mi 10");
    property_override("ro.product.device", "umi");
}

void load_cmi() {
    property_override("ro.product.model", "Mi 10 Pro");
    property_override("ro.product.device", "cmi");
}

void load_poco() {
    property_override("ro.product.model", "POCO F2 Pro");
    property_override("ro.product.device", "lmi");
}

void load_redmi() {
    property_override("ro.product.model", "Redmi K30 Pro");
    property_override("ro.product.device", "lmi");
}

	/* From Magisk@jni/magiskhide/hide_utils.c */
static const char *snet_prop_key[] = {
    "ro.boot.vbmeta.device_state",
    "ro.boot.flash.locked",
    "ro.boot.selinux",
    "ro.boot.veritymode",
    "ro.boot.verifiedbootstate",
    "ro.boot.warranty_bit",
    "ro.warranty_bit",
    "ro.debuggable",
    "ro.secure",
    "ro.build.type",
    "ro.build.tags",
    "ro.build.selinux",
    NULL
};

 static const char *snet_prop_value[] = {
    "locked",
    "1",
    "enforcing",
    "enforcing",
    "0",
    "0",
    "0",
    "1",
    "user",
    "release-keys",
    "1",
    NULL
};



 static void workaround_snet_properties() {
    if(!changed){
        vendor_load_properties();
        changed=true;
    }    
     // Hide all sensitive props
    for (int i = 0; snet_prop_key[i]; ++i) {
        property_override(snet_prop_key[i], snet_prop_value[i]);
    }

     chmod("/sys/fs/selinux/enforce", 0640);
    chmod("/sys/fs/selinux/policy", 0440);
    
}

void vendor_load_properties()
{
    check_device();

    property_override("dalvik.vm.heapstartsize", heapstartsize);
    property_override("dalvik.vm.heapgrowthlimit", heapgrowthlimit);
    property_override("dalvik.vm.heapsize", heapsize);
    property_override("dalvik.vm.heaptargetutilization", heaptargetutilization);
    property_override("dalvik.vm.heapminfree", heapminfree);
    property_override("dalvik.vm.heapmaxfree", heapmaxfree);
    
    std::string model = android::base::GetProperty("ro.product.vendor.device", "");
    std::string region = android::base::GetProperty("ro.product.vendor.model", "");
    
    load_fprops();
    
    if (model.find("umi") != std::string::npos) {
        load_umi();
    } else if (model.find("cmi") != std::string::npos) {
        load_cmi();
    } else if (model.find("lmi") && region.find("POCO F2 Pro") != std::string::npos) {
        load_poco();
    } else if (model.find("lmi") && region.find("Redmi K30 Pro") != std::string::npos) {
        load_redmi();
    } else {
        LOG(ERROR) << __func__ << ": unexcepted device!";
    }
}
