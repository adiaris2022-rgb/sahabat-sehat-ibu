# Sahabat Sehat Ibu

MVP frontend responsif untuk pendamping kebiasaan sehat.

## Isi saat ini
- Beranda
- Inspirasi menu makan dan daftar belanja sederhana
- Aktivitas fisik ringan dengan catatan keselamatan
- Checklist dan catatan harian 30 hari (localStorage browser)
- Buku & Panduan (kerangka awal)

## Jalankan lokal
Buka `index.html` di browser atau jalankan server statis:
`npx serve .`

## Deploy Netlify
Hubungkan repository GitHub ini ke Netlify. Build command kosong; publish directory `.`.

## Batasan penting
Ini prototipe frontend. Belum ada autentikasi OTP, entitlement/pembayaran, sinkronisasi Supabase, atau proteksi konten berbayar. Checklist saat ini tersimpan hanya di browser/perangkat. Materi kesehatan harus ditinjau tenaga kesehatan dan dilengkapi referensi tepercaya sebelum dipasarkan.

Jangan menaruh Supabase service-role key atau rahasia lain di frontend.
