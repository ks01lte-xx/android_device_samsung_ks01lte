/*
 * Copyright (C) 2016 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#pragma once

#include <hardware/sensors.h>

static const char* MULTI_HAL_CONFIG_FILE_PATH = "/vendor/etc/sensors/_hals.conf";

// Depracated because system partition HAL config file does not satisfy treble requirements.
static const char* DEPRECATED_MULTI_HAL_CONFIG_FILE_PATH = "/system/etc/sensors/_hals.conf";

struct sensors_module_t* get_multi_hal_module_info(void);
