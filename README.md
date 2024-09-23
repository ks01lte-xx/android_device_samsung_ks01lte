Device Tree for Samsung ks01lte aka Galaxy S4 LTE-A

> Work In Progress.
>
> Force-pushing is likely to happen!

# Copyright

	Copyright 2012-2016 - The CyanogenMod Project
	Copyright 2017-2022 - The LineageOS Project 


## Disclaimer
	/*
	 * Your warranty will be VOID after installing a custom ROM.
	 *
	 * Get notified yourself that I am not responsible for bricked devices, dead SD cards,
	 * thermonuclear war, or you getting fired because the alarm app failed.
	 * Please do some research if you have any concerns about features included in this ROM
	 * before flashing it!
	 * YOU are choosing to make these modifications,
	 * and if you point the finger at me for messing up your device,
	 * I will laugh at you.
	 */

### `.repo/local_manifests/roomservice.xml` 
```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <project name="ks01lte-xx/android_device_samsung_ks01lte" path="device/samsung/ks01lte" remote="github" />
    <project name="ks01lte-xx/android_vendor_samsung_ks01lte" path="vendor/samsung/ks01lte" remote="github" />
    <project name="ks01lte-xx/kernel_samsung_ks01lte" path="kernel/samsung/ks01lte" remote="github" />
    <project name="ks01lte-xx/arm-cortex_a15-linux-gnueabihf-linaro_4.9" path="arm-cortex_a15" remote="github" />
</manifest>
```
## bugs.
	 * neverallow?

