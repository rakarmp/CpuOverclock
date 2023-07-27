#!/system/bin/sh

# setcpu, mengatur CPU untuk Android yang udh pake custom ROM
# Penggunaan:    setcpu [MINFREQ MAXFREQ GOVERNOR]
#                setcpu -h, --help      #cetak pesan bantuan ini
#                setcpu -s, --status    #cetak status CPU
# Jika tidak ada parameter yang ditentukan, panduan setup interaktif akan dimulai.
# CATATAN: Skrip ini HARUS dijalankan sebagai root untuk melakukan perubahan konfigurasi!
# Tips: jalankan 'watch -n1 setcpu -s' untuk melihat status CPU, refresh setiap detik.
# CODE BY RAKARMP Zyarexx

if [ $# -eq 0 ]; then
    freqs=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies)
    echo "CATATAN: Skrip ini HARUS dijalankan sebagai root untuk melakukan perubahan konfigurasi!"
    echo -n "Frekuensi CPU min saat ini: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
    echo -n "Frekuensi CPU max saat ini: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo -n "Frekuensi CPU Cluster 2 min saat ini :"; cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
    echo -n "Frekuensi CPU Cluster 2 max saat ini :"; cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo -n "Governor CPU saat ini: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo -n "Frekuensi CPU saat ini: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
    echo "Frekuensi CPU yang tersedia: $freqs"
    echo -n "Masukkan frekuensi CPU min yang diinginkan: "
    read min
    if [ $min ]; then
        if [ $(echo $freqs | grep -q -E " $min |^$min | $min$"; echo $?) -eq 0 ]; then
            echo $min > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq && echo "Selesai"
            echo $min > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq && echo "Selesai"
        else
            echo "Harap masukkan nilai yang valid untuk frekuensi CPU min!" 1>&2
        fi
    fi
    unset min
    echo -n "Masukkan frekuensi CPU max yang diinginkan: "
    read max
    if [ $max ]; then
        if [ $(echo $freqs | grep -q -E " $max |^$max | $max$"; echo $?) -eq 0 ]; then
            echo $max > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq && echo "Selesai"
            echo $max > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq && echo "Selesai"
        else
            echo "Harap masukkan nilai yang valid untuk frekuensi CPU max!" 1>&2
        fi
    fi
    unset max
    unset freqs
    gvnrs=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
    echo "Governor CPU yang tersedia: $gvnrs"
    echo -n "Masukkan tipe governor CPU yang diinginkan: "
    read gvnr
    if [ $gvnr ]; then
        if [ $(echo $gvnrs | grep -q -E " $gvnr |^$gvnr | $gvnr$"; echo $?) -eq 0 ]; then
            echo $gvnr > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor && echo "Selesai"
        else
            echo "Harap masukkan tipe governor CPU yang valid!" 1>&2
        fi
    fi
    unset gvnr
    unset gvnrs
elif [[ "$1" = '-h' || "$1" = '--help' ]]; then
    echo "Penggunaan:    setcpu [MINFREQ MAXFREQ GOVERNOR]"
    echo "               setcpu -h, --help      #cetak pesan bantuan ini"
    echo "               setcpu -s, --status    #cetak status CPU"
    echo "Jika tidak ada parameter yang ditentukan, panduan setup interaktif akan dimulai."
    echo "CATATAN: Skrip ini HARUS dijalankan sebagai root untuk melakukan perubahan konfigurasi!"
    echo "Tips: jalankan 'watch -n1 setcpu -s' untuk melihat status CPU, refresh setiap detik."
    echo -n "Frekuensi CPU yang tersedia:"
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
    echo "Sepanas setrika !! overclocking! :)"
elif [[ "$1" = '-s' || "$1" = '--status' ]]; then
    echo -n "Frekuensi CPU yang tersedia:"; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
    echo -n "Frekuensi CPU min saat ini: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
    echo -n "Frekuensi CPU max saat ini: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo -n "Governor CPU saat ini: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo -n "Frekuensi CPU saat ini: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
else
    freqs=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies)
    if [ $1 ]; then
        if [ $(echo $freqs | grep -q -E " $1 |^$1 | $1$"; echo $?) -eq 0 ]; then
            echo $1 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        else
            echo "Harap gunakan nilai yang valid untuk frekuensi CPU min!" 1>&2
        fi
    fi
    if [ $2 ]; then
        if [ $(echo $freqs | grep -q -E " $2 |^$2 | $2$"; echo $?) -eq 0 ]; then
            echo $2 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        else
            echo "Harap gunakan nilai yang valid untuk frekuensi CPU max!" 1>&2
        fi
    fi
    unset freqs
    if [ $3 ]; then
        if [ $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors | grep -q -E " $3 |^$3 | $3$"; echo $?) -eq 0 ]; then
            echo $3 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        else
            echo "Harap gunakan tipe governor CPU yang valid!" 1>&2
        fi
    fi
fi
echo "low memory killer"
# Low Memory Killer
echo "0" > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
sleep 2
echo "Disable thermal throttling"
# Disable Thermal Throttling
echo "0" > /sys/module/msm_thermal/core_control/enabled
sleep 2
echo "Disable dynamic memory management"
# Disable Dynamic Memory Management
echo "0" > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
sleep 2 
echo "Disable dynamic scaling service"
# Disable Dynamic Scaling Service
stop dynamic_scaling_service
sleep 2
echo "set i/o scheduler"
# Set I/O Scheduler to noop
echo "noop" > /sys/block/mmcblk0/queue/scheduler
sleep 2
echo "screen animation off"
# Screen Animation Off
settings put global window_animation_scale 0
settings put global transition_animation_scale 0
settings put global animator_duration_scale 0
sleep 2
  echo "OpenGl Optimize"
# OpenGL Optimize
setprop debug.egl.hw 1
setprop debug.egl.profiler 0
setprop debug.egl.profiler_ms 0

# Jeda 1 detik
sleep 1
  echo "Customcpu Success, @Zyarexx (Rakarmp)"
