# Sahabat Sehat Ibu

MVP aplikasi pendamping kebiasaan sehat dengan antarmuka responsif untuk ponsel.

## Fitur yang tersedia pada source saat ini
- Beranda, Menu Makan, Aktivitas, Rencana Sehat 30 Hari, Buku & Panduan.
- Checklist belanja bahan makanan dan aktivitas harian tersimpan bersama catatan rencana berdasarkan tanggal.
- Ringkasan jumlah hari dengan aktivitas tercatat dalam 30 hari terakhir.
- Login passwordless menggunakan tautan Magic Link sekali pakai melalui email (tanpa memasukkan kode OTP).
- Permintaan OTP menggunakan `shouldCreateUser: false` (tidak membuka pendaftaran mandiri).
- Setelah OTP diverifikasi, aplikasi memeriksa entitlement aktif untuk produk `sahabat-sehat-ibu` berdasarkan `user_id`.
- Checklist dan catatan rencana 30 hari disimpan ke tabel Supabase `plan_progress`.
- Logout manual.

## Backend
- Supabase project ref: `ofsrnyrzyzvtgzuiphse`
- Tabel yang disiapkan: `profiles`, `access_entitlements`, `health_preferences`, `plan_progress`.
- Frontend menggunakan Supabase publishable key. Jangan pernah menaruh service-role key di browser.
- RLS aktif pada seluruh tabel publik. Kebijakan `plan_progress` dan `health_preferences` kini mensyaratkan entitlement aktif dan membatasi baris pada `auth.uid()` pengguna. Hak akses berbayar harus ditetapkan melalui proses admin/server tepercaya, bukan dari browser pengguna.

## Deploy Netlify
Hubungkan repository ini ke Netlify. Build command kosong; publish directory `.`. Setelah deploy, uji URL produksi melalui ponsel.

## Pekerjaan wajib sebelum peluncuran komersial
1. Pastikan template Magic Link Supabase mengirim tautan masuk yang benar, Site URL dan Redirect URLs sesuai domain produksi, serta masa berlaku dan rate limit sesuai kebutuhan.
2. Uji Magic Link untuk email terdaftar dan tidak terdaftar; uji expiry, penggunaan ulang, dan pembatasan permintaan.
3. Uji entitlement aktif, kedaluwarsa, dicabut, dan tidak ada entitlement.
4. Verifikasi RLS untuk seluruh tabel, termasuk akses lintas pengguna. RLS untuk `plan_progress` dan `health_preferences` sudah diperketat agar hanya akun dengan entitlement aktif yang dapat membaca/menulis datanya; SQL tercatat di `supabase/migrations/20261103000000_require_active_entitlement_for_user_data.sql`.
5. Buat alur admin/server untuk mengaktifkan entitlement setelah pembayaran terverifikasi. Jangan percaya status pembayaran dari frontend.
6. Tinjau konten kesehatan oleh tenaga kesehatan dan lengkapi referensi resmi.
7. Lengkapi kebijakan privasi, syarat penggunaan, dukungan pengguna, backup, monitoring, dan pengujian keamanan.

## Batasan yang diketahui
- Source code sudah tersimpan di GitHub, tetapi deployment publik belum diverifikasi.
- Integrasi pembayaran/Orderhero belum tersedia.
- Belum ada alur admin untuk mengaktifkan entitlement otomatis.
- Menu kesehatan dan workbook masih berupa kerangka MVP; bukan nasihat medis atau alat diagnosis.
- Checklist memerlukan sesi login dan hak akses, lalu tersimpan di Supabase.

## Jalankan lokal
Buka `index.html` melalui server statis. Contoh: `npx serve .`.
