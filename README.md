# 🌱 Green Energy Control

Aplikasi mobile interaktif berbasis Flutter untuk simulasi kontrol energi terbarukan dengan gesture sentuhan. Aplikasi ini mengangkat tema **SDG 7: Energi Bersih dan Terjangkau**.

## ✨ Fitur Utama

- **Dashboard Energi:** Menampilkan simulasi energi surya dan penggunaan listrik.
- **Tap:** Mengubah status lampu dan panel surya (ON/OFF).
- **Long Press:** Menampilkan dialog informasi energi.
- **Drag/Pan:** Memindahkan panel surya secara real-time.
- **Interactive UI:** Menggunakan `Card`, `Row`, `Column`, dan `Stack`.

## 🛠️ Teknologi

- Flutter
- Dart
- Material Design 3
- `StatefulWidget` dan `setState()`
- `GestureDetector`

## 🏗️ Struktur Widget

```text
GreenEnergyApp
└── EnergyDashboard
    └── Scaffold
        ├── AppBar
        └── SingleChildScrollView
            └── Column
                ├── Row (Ringkasan Energi)
                ├── Card (Kontrol Lampu)
                ├── Stack (Simulasi Panel Surya)
                │   └── GestureDetector
                └── Card (Informasi SDG 7)
```

## 🚀 Cara Menjalankan

1. Clone repository:

   ```bash
   git clone https://github.com/bengbenn/green-energy-control_kel1.git
   ```

2. Masuk ke folder proyek:

   ```bash
   cd green-energy-control_kel1
   ```

3. Instal dependensi:

   ```bash
   flutter pub get
   ```

4. Jalankan aplikasi:

   ```bash
   flutter run
   ```

## 📸 Screenshot

Tambahkan screenshot aplikasi pada folder `screenshots/`, meliputi:
- Dashboard awal
- Hasil Tap
- Hasil Long Press
- Hasil Drag/Pan

## 👥 Identitas Kelompok

| Nama Anggota | NIM |
|---|---|
| [Benedict Samuel Ardy] | [202431149] |
| [Maya Dwi Apriyani] | [202431159] |
| [Virginia Kadiwaru] | [202331258] |

**Kelas:** [Pemograman Mobule F]

**Repository:** [Link GitHub]

## 🌍 SDG 7

Aplikasi ini merupakan simulasi pembelajaran yang memperkenalkan konsep energi terbarukan dan penggunaan energi secara efisien. Data energi yang ditampilkan bersifat simulasi, bukan hasil pengukuran perangkat nyata.
