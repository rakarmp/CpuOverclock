#!/system/bin/sh

# Enable Thermal Throttling
su -c start thermal-engine
sleep 2

# Enable Dynamic Memory Management
echo "1" > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
sleep 2

# Enable Dynamic Scaling Service
start dynamic_scaling_service
sleep 2

# Set I/O Scheduler to default
echo "cfq" > /sys/block/mmcblk0/queue/scheduler
sleep 2

# Screen Animation On
settings put global window_animation_scale 1
settings put global transition_animation_scale 1
settings put global animator_duration_scale 1
sleep 2

# Disable OpenGL Optimize
setprop debug.egl.hw 0
setprop debug.egl.profiler 0
setprop debug.egl.profiler_ms 0

# Restore governor to schedutil
echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
  
# Restore CPU Speed to Default
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
  echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
  
sleep 2
echo "Uninstall success, reboot agar fresh !!"
  sleep 1
