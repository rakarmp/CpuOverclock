
Berikut adalah deskripsi dan cara pemakaian kode dalam format Markdown:

## Deskripsi
Kode ini adalah sebuah skrip shell yang digunakan untuk mengatur pengaturan CPU pada perangkat Android yang menggunakan ROM kustom. Skrip ini memungkinkan pengguna untuk mengatur frekuensi minimum (MINFREQ) dan maksimum (MAXFREQ) CPU, serta tipe governor yang digunakan. Skrip ini juga menyediakan opsi untuk melihat status CPU saat ini.

## Cara Pemakaian
1. Pastikan perangkat Android Anda telah di-root.
2. Salin kode skrip ke dalam file dengan ekstensi `.sh`, misalnya `setcpu.sh`.
3. Buka terminal atau aplikasi yang mendukung shell di perangkat Android Anda.
4. Jalankan skrip dengan perintah berikut:
   ```
   sh customcpu.sh [MINFREQ MAXFREQ GOVERNOR]
   ```
   - Ganti `[MINFREQ MAXFREQ GOVERNOR]` dengan nilai-nilai yang diinginkan untuk frekuensi minimum, frekuensi maksimum, dan tipe governor. Jika tidak ada parameter yang ditentukan, skrip akan memulai panduan setup interaktif.
   - Contoh penggunaan: `sh setcpu.sh 1000000 2000000 interactive`
5. Jika skrip dijalankan tanpa parameter, Anda akan melalui panduan setup interaktif. Ikuti instruksi yang ditampilkan di terminal untuk mengatur frekuensi CPU dan tipe governor.
6. Jika Anda ingin melihat status CPU saat ini, jalankan perintah berikut:
   ```
   sh customcpu.sh -s
   ```
   - Ini akan mencetak informasi tentang frekuensi CPU yang tersedia, frekuensi minimum dan maksimum saat ini, tipe governor saat ini, dan frekuensi CPU saat ini.
7. Untuk melihat pesan bantuan, jalankan perintah berikut:
   ```
   sh customcpu.sh -h
   ```
   - Ini akan mencetak pesan bantuan yang menjelaskan penggunaan skrip dan opsi yang tersedia.

Harap dicatat bahwa skrip ini harus dijalankan sebagai root agar dapat melakukan perubahan konfigurasi pada perangkat. Pastikan Anda memahami konsekuensi dari mengubah pengaturan CPU sebelum
