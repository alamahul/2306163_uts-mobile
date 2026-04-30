# FreelanceHub (UTS Mobile)

FreelanceHub adalah aplikasi seluler berbasis Flutter yang dirancang untuk membantu freelancer mencari dan mengambil project freelance dengan antarmuka yang modern, dinamis, dan user-friendly. Proyek ini merupakan tugas Ujian Tengah Semester (UTS) untuk mata kuliah Praktikum Pemrograman Mobile.

## 🚀 Fitur Utama

- **Login Interaktif**: Pengguna dapat masuk dengan memasukkan Nama, Password, Experience Level, dan Skill Freelancer.
- **Modern Dashboard**: 
  - **Header Profil**: Menampilkan sapaan dinamis beserta informasi level dan skill.
  - **Progress Bar**: Memantau progres pekerjaan yang sudah diambil dari total job yang tersedia.
- **Pencarian dan Filter Cerdas**:
  - **Search Bar**: Mencari project freelance spesifik berdasarkan judul (title).
  - **Skill Filter**: Chip filter horizontal untuk menyeleksi project berdasarkan keahlian (Frontend, Backend, UI/UX, Mobile, dll).
- **List Job Interaktif**: Menampilkan daftar project yang dilengkapi ikon status, nama klien, bayaran, serta badge tingkat kesulitan (Easy, Medium, Hard).
- **Halaman Detail & Take Project**:
  - Menampilkan deskripsi detail, klien, dan bayaran dari sebuah project.
  - Terdapat tombol **"Take Project"** yang dilengkapi dengan animasi ketika ditekan.
  - Fitur **Favorite Toggle** untuk menandai project idaman.
  - Menggunakan **Hero Animation** untuk transisi gambar yang halus dari daftar project ke halaman detail.
- **Logout System**: Fitur logout untuk menghapus sesi dan kembali ke halaman utama.

## 💻 Teknologi yang Digunakan

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Komponen UI**: Material Design 3, Hero Animations, Animations Controller.
- **State Management**: Stateful & Stateless Widgets standar bawaan Flutter.

## 📱 Cuplikan Layar (Screenshots)

*(Tangkapan layar dapat ditambahkan di sini nantinya untuk menunjukkan UI aplikasi seperti Halaman Login, Dashboard, dan Halaman Detail).*

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
