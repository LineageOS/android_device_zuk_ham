/*
 * Copyright (C) 2017 The LineageOS Project
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

/* Video encode hint optimisations */
#define VID_ENC_TIMER_RATE 30000
#define VID_ENC_IO_IS_BUSY 0

enum {
    PROFILE_POWER_SAVE = 0,
    PROFILE_BALANCED,
    PROFILE_HIGH_PERFORMANCE,
    PROFILE_BIAS_POWER_SAVE,
    PROFILE_BIAS_PERFORMANCE,
    PROFILE_MAX
};

typedef struct governor_settings {
    int boost;
    /* interactive */
    int boostpulse_duration;
    int go_hispeed_load;
    int go_hispeed_load_off;
    int hispeed_freq;
    int hispeed_freq_off;
    int timer_rate;
    int timer_rate_off;
    char *above_hispeed_delay;
    int io_is_busy;
    int min_sample_time;
    int sampling_down_factor;
    char *target_loads;
    char *target_loads_off;
    /* cpufreq */
    int scaling_max_freq;
    int scaling_min_freq;
    int scaling_min_freq_off;
    /* cpuboost */
    int input_boost_freq;
    int input_boost_ms;
    /* kgsl */
    int max_gpuclk;
} power_profile;

static power_profile profiles[PROFILE_MAX] = {
    [PROFILE_POWER_SAVE] = {
        .boost =                  0,
        /* interactive */
        .boostpulse_duration =    40000,
        .go_hispeed_load =        90,
        .go_hispeed_load_off =    110,
        .hispeed_freq =           729600,
        .hispeed_freq_off =       300000,
        .timer_rate =             20000,
        .timer_rate_off =         50000,
        .above_hispeed_delay =    "20000 1400000:40000 1700000:20000",
        .io_is_busy =             1,
        .min_sample_time =        60000,
        .sampling_down_factor =   100000,
        .target_loads =           "85 1497600:90",
        .target_loads_off =       "95 1512000:99",
        /* cpufreq */
        .scaling_max_freq =       1113600,
        .scaling_min_freq =       300000,
        .scaling_min_freq_off =   300000,
        /* cpuboost */
        .input_boost_freq =       0,
        .input_boost_ms =         0,
        /* kgsl */
        .max_gpuclk =             462400000,
    },
    [PROFILE_BALANCED] = {
        .boost =                  1,
        /* interactive */
        .boostpulse_duration =    40000,
        .go_hispeed_load =        90,
        .go_hispeed_load_off =    110,
        .hispeed_freq =           1574400,
        .hispeed_freq_off =       300000,
        .timer_rate =             20000,
        .timer_rate_off =         50000,
        .above_hispeed_delay =    "20000 1400000:40000 1700000:20000",
        .io_is_busy =             1,
        .min_sample_time =        40000,
        .sampling_down_factor =   100000,
        .target_loads =           "85 1497600:90",
        .target_loads_off =       "90 1574400:99",
        /* cpufreq */
        .scaling_max_freq =       1958400,
        .scaling_min_freq =       300000,
        .scaling_min_freq_off =   300000,
        /* cpuboost */
        .input_boost_freq =       1267200,
        .input_boost_ms =         40,
        /* kgsl */
        .max_gpuclk =             578000000,
    },
    [PROFILE_HIGH_PERFORMANCE] = {
        .boost =                  1,
        /* interactive */
        .boostpulse_duration =    40000,
        .go_hispeed_load =        90,
        .go_hispeed_load_off =    110,
        .hispeed_freq =           2265600,
        .hispeed_freq_off =       729600,
        .timer_rate =             20000,
        .timer_rate_off =         50000,
        .above_hispeed_delay =    "20000 1400000:40000 1700000:20000",
        .io_is_busy =             1,
        .min_sample_time =        40000,
        .sampling_down_factor =   100000,
        .target_loads =           "85 1497600:90",
        .target_loads_off =       "90 1574400:99",
        /* cpufreq */
        .scaling_max_freq =       2457600,
        .scaling_min_freq =       1497600,
        .scaling_min_freq_off =   300000,
        /* cpuboost */
        .input_boost_freq =       1728000,
        .input_boost_ms =         60,
        /* kgsl */
        .max_gpuclk =             578000000,
    },
    [PROFILE_BIAS_POWER_SAVE] = {
        .boost =                  1,
        /* interactive */
        .boostpulse_duration =    40000,
        .go_hispeed_load =        90,
        .go_hispeed_load_off =    110,
        .hispeed_freq =           960000,
        .hispeed_freq_off =       300000,
        .timer_rate =             20000,
        .timer_rate_off =         50000,
        .above_hispeed_delay =    "20000 1400000:40000 1700000:20000",
        .io_is_busy =             1,
        .min_sample_time =        40000,
        .sampling_down_factor =   100000,
        .target_loads =           "85 1497600:90",
        .target_loads_off =       "90 1574400:99",
        /* cpufreq */
        .scaling_max_freq =       1267200,
        .scaling_min_freq =       300000,
        .scaling_min_freq_off =   300000,
        /* cpuboost */
        .input_boost_freq =       729600,
        .input_boost_ms =         40,
        /* kgsl */
        .max_gpuclk =             578000000,
    },
    [PROFILE_BIAS_PERFORMANCE] = {
        .boost =                  1,
        /* interactive */
        .boostpulse_duration =    40000,
        .go_hispeed_load =        90,
        .go_hispeed_load_off =    110,
        .hispeed_freq =           1728000,
        .hispeed_freq_off =       576000,
        .timer_rate =             20000,
        .timer_rate_off =         50000,
        .above_hispeed_delay =    "20000 1400000:40000 1700000:20000",
        .io_is_busy =             1,
        .min_sample_time =        40000,
        .sampling_down_factor =   100000,
        .target_loads =           "85 1497600:90",
        .target_loads_off =       "90 1574400:99",
        /* cpufreq */
        .scaling_max_freq =       2112000,
        .scaling_min_freq =       300000,
        .scaling_min_freq_off =   300000,
        /* cpuboost */
        .input_boost_freq =       1574400,
        .input_boost_ms =         60,
        /* kgsl */
        .max_gpuclk =             578000000,
    },
};
