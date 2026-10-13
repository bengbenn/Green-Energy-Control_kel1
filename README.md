# Green Energy Control

## Deskripsi Aplikasi
Green Energy Control adalah aplikasi Flutter interaktif untuk simulasi pemantauan energi terbarukan. Aplikasi ini memungkinkan pengguna mengontrol lampu dan memindahkan panel surya virtual melalui interaksi mouse di Chrome.

## Tujuan
- Menerapkan layout kompleks pada Flutter.
- Menggunakan GestureDetector untuk menangani interaksi pengguna.
- Mengelola perubahan tampilan menggunakan setState().
- Mengenalkan energi bersih yang mendukung SDG 7.

## Fitur Aplikasi
1. Dashboard ringkasan energi surya dan penggunaan listrik.
2. Tap untuk mengubah status lampu dan panel surya.
3. Long Press untuk menampilkan dialog detail energi.
4. Drag/Pan untuk memindahkan panel surya secara real-time.
5. Informasi tentang SDG 7: Energi Bersih dan Terjangkau.

## Teknologi
- Flutter
- Dart
- Material Design
- GestureDetector
- StatefulWidget dan setState()

## Cara Menjalankan
Pastikan Flutter sudah terpasang dan Chrome tersedia.

Jalankan perintah berikut pada terminal:

```bash
flutter pub get
flutter run -d chrome
```

## Hasil Pengujian Gesture

| Gesture | Hasil | Keterangan |
|---|---|---|
| Tap | Berhasil | Status dan warna perangkat berubah |
| Long Press | Berhasil | Dialog detail energi muncul |
| Drag/Pan | Berhasil | Panel surya berpindah mengikuti mouse |

Pengujian dilakukan pada Chrome. Data energi yang tampil merupakan data simulasi, bukan pembacaan sensor fisik.

## Anggota Kelompok
- Anggota 1: [Benedict Samuel Ardy] | NIM: [202431149]
- Anggota 2: [Maya Dwi Apriyani] | NIM: [202431159]
- Anggota 3: [Virginia Kadiwaru] NIM: [202331258]

## Repository
[Green Energy Control di GitHub](https://github.com/bengbenn/Green-Energy-Control_kel1)
