# FreelanceHub (UTS Mobile)

FreelanceHub adalah aplikasi seluler berbasis Flutter yang dirancang untuk membantu freelancer mencari dan mengambil project freelance dengan antarmuka yang modern, dinamis, dan user-friendly. Proyek ini merupakan tugas Ujian Tengah Semester (UTS) untuk mata kuliah Praktikum Pemrograman Mobile.

## 🚀 Fitur Utama

- **Login Interaktif & Validasi Ketat**: 
  - Validasi formulir secara spesifik: Nama wajib diisi, Password minimal 8 karakter, Experience Level wajib berupa angka, dan Skill wajib berupa alfabet.
- **Navigasi Bawah (Bottom Navigation Bar)**: 
  - Navigasi mulus yang membagi aplikasi ke dalam 3 tab utama: **Home**, **My Jobs**, dan **Profile**.
- **Modern Dashboard (Home)**: 
  - **Header Profil**: Menampilkan sapaan dinamis, informasi level, dan ikon *skill* yang otomatis menyesuaikan dengan keahlian yang diinputkan.
  - **Progress Bar**: Memantau progres pekerjaan yang sudah diambil dari total job yang tersedia.
  - **Pencarian dan Filter Cerdas**: Mencari project menggunakan *Search Bar* atau *Chip Filter* (Frontend, Backend, UI/UX, Mobile).
  - **Pagination (Load More)**: Mendukung pemuatan data secara bertahap untuk menjaga performa aplikasi.
- **List Job Interaktif & Cerdas**: 
  - Menampilkan 50 data dummy project yang sangat bervariasi dengan nama klien, bayaran (dilengkapi ikon monetisasi), serta tingkat kesulitan.
  - **Sistem Rekomendasi Level**: Setiap *card* menampilkan *Requirement Level* (contoh: Lvl 2+) dan pesan rekomendasi cerdas (Apakah project tersebut cocok untuk level user atau terlalu sulit).
  - **Sinkronisasi Favorite**: Ikon hati (Love) akan tersinkronisasi dan muncul di *card* depan jika project ditandai sebagai favorit dari halaman detail.
- **Halaman Detail & Take Project**:
  - Menggunakan **Hero Animation** untuk transisi gambar yang sangat halus.
  - Terdapat tombol **"Take Project"** dengan animasi *scale* yang responsif.
  - Jika project sudah diambil, halamannya tetap bisa diakses dengan indikator visual *overlay* "Taken" yang jelas.
- **My Jobs**: Tab khusus untuk memantau project aktif yang telah berhasil diambil, dilengkapi dengan sistem *pagination*.
- **Halaman Profile**:
  - **Account Settings**: Pengguna dapat mengubah Nama, Level, dan Skill melalui *pop-up form*, dan perubahannya akan langsung memengaruhi *Header* secara *real-time*.
  - **Payment Methods**: Menu *Bottom Sheet* untuk memantau metode pembayaran.
  - **Help & Support**: Panduan tata cara menggunakan aplikasi.
  - **Logout**: Tombol *Log Out* untuk keluar dan kembali ke halaman Login.

## 💻 Teknologi yang Digunakan

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Komponen UI**: Material Design 3, Hero Animations, Animations Controller, BottomNavigationBar, BottomSheet.
- **State Management**: Stateful & Stateless Widgets standar bawaan Flutter (Penggunaan ekstensif `setState` untuk re-render dan *routing args*).

## 🛠️ Cara Menjalankan Proyek

1. **Prasyarat**: Pastikan Anda telah menginstal [Flutter SDK](https://docs.flutter.dev/get-started/install) pada sistem operasi Anda.
2. **Clone repositori**:
   ```bash
   git clone https://github.com/alamahul/2306163_uts-mobile.git
   ```
3. Masuk ke direktori proyek:
   ```bash
   cd 2306163_uts-mobile
   ```
4. Unduh semua dependency:
   ```bash
   flutter pub get
   ```
5. Jalankan aplikasi pada perangkat yang terhubung atau emulator:
   ```bash
   flutter run
   ```

## 👨‍💻 Kontributor

- **NPM**: 2306163
- **Nama**: Alamahul Bayan
- **Mata Kuliah**: Praktikum Pemrograman Mobile (Semester 6)
