import 'package:flutter/material.dart';
import 'package:latihankuis/model/animal.dart';

// Class ini digunakan untuk membuat halaman detail hewan.
// StatelessWidget digunakan karena halaman ini hanya menampilkan
// data hewan yang sudah diterima dari halaman sebelumnya.
class AnimalDetailPage extends StatelessWidget {

  // Menyimpan data hewan yang akan ditampilkan.
  // Data ini berasal dari object Animal.
  final Animal animal;

  // Constructor dari AnimalDetailPage.
  // required berarti data animal wajib diberikan ketika
  // AnimalDetailPage dipanggil.
  const AnimalDetailPage({
    super.key,
    required this.animal,
  });

  // ============================================================
  // PALET WARNA
  // ============================================================

  // Warna utama yang digunakan pada halaman.
  static const Color pastelPrimary = Color(0xFF6B9080);

  // Warna gelap untuk teks.
  static const Color pastelDark = Color(0xFF2C3E30);

  // Warna background halaman.
  static const Color pastelBackground = Color(0xFFF3F7F4);

  // Warna border pada beberapa card.
  static const Color pastelBorder = Color(0xFFDCE8DF);


  // ============================================================
  // FUNGSI MENENTUKAN WARNA BERDASARKAN TIPE HEWAN
  // ============================================================

  // Fungsi ini menerima type berupa String.
  // Kemudian mengembalikan warna yang sesuai dengan tipe hewan.
  Color _getTypeColor(String type) {

    // toLowerCase() digunakan agar huruf besar/kecil tidak
    // mempengaruhi pengecekan.
    //
    // Contoh:
    // "Mammal" → "mammal"
    // "MAMMAL" → "mammal"
    switch (type.toLowerCase()) {

      // Jika tipe hewan adalah mammal.
      case 'mammal':
        return const Color(0xFFB5704D);

      // Jika tipe hewan adalah reptile.
      case 'reptile':
        return const Color(0xFF5B8A72);

      // Jika tipe hewan adalah bird.
      case 'bird':
        return const Color(0xFF52796F);

      // Jika tipe hewan adalah dog.
      case 'dog':
        return const Color(0xFF8A6B8A);

      // Jika tidak ada tipe yang cocok dengan case di atas,
      // gunakan warna default.
      default:
        return const Color(0xFF6B9080);
    }
  }


  // ============================================================
  // FUNGSI MENENTUKAN ICON BERDASARKAN TIPE HEWAN
  // ============================================================

  // Fungsi ini menerima type berupa String.
  // Hasilnya berupa IconData yang sesuai dengan tipe hewan.
  IconData _getTypeIcon(String type) {

    // Mengubah type menjadi huruf kecil sebelum diperiksa.
    switch (type.toLowerCase()) {

      // Icon untuk mammal.
      case 'mammal':
        return Icons.pets_rounded;

      // Icon untuk reptile.
      case 'reptile':
        return Icons.park_rounded;

      // Icon untuk bird.
      case 'bird':
        return Icons.flutter_dash_rounded;

      // Icon untuk dog.
      case 'dog':
        return Icons.pets_rounded;

      // Icon default jika tipe tidak sesuai.
      default:
        return Icons.eco_rounded;
    }
  }


  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {

    // Memanggil fungsi _getTypeColor() untuk mendapatkan
    // warna berdasarkan tipe hewan.
    //
    // Contoh:
    // animal.type = "Mammal"
    // maka typeColor berisi warna untuk mammal.
    final typeColor = _getTypeColor(animal.type);

    // Memanggil fungsi _getTypeIcon() untuk mendapatkan
    // icon berdasarkan tipe hewan.
    final typeIcon = _getTypeIcon(animal.type);


    // Scaffold adalah kerangka utama halaman Flutter.
    return Scaffold(

      // Mengatur warna background seluruh halaman.
      backgroundColor: pastelBackground,


      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(

        // Warna background AppBar.
        backgroundColor: Colors.white,

        // Menghilangkan elevation agar tampilan lebih flat.
        elevation: 0,

        // Elevation ketika halaman di-scroll.
        scrolledUnderElevation: 1,

        // Mengatur warna shadow.
        shadowColor: Colors.black.withValues(alpha: 0.05),


        // Tombol kembali di sebelah kiri AppBar.
        leading: IconButton(

          // Icon panah kembali.
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
          ),

          // Warna icon.
          color: pastelDark,

          // Tooltip muncul ketika tombol ditekan/di-hover.
          tooltip: 'Kembali',

          // Navigator.pop() digunakan untuk kembali
          // ke halaman sebelumnya.
          onPressed: () => Navigator.pop(context),
        ),


        // ======================================================
        // JUDUL APP BAR
        // ======================================================

        title: Text(

          // Nama hewan ditampilkan sebagai judul.
          animal.name,

          // Styling untuk teks nama hewan.
          style: const TextStyle(
            color: pastelDark,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),

        // Judul tidak diletakkan di tengah.
        centerTitle: false,


        // ======================================================
        // BAGIAN KANAN APP BAR
        // ======================================================

        actions: [

          // Badge tipe hewan di pojok kanan AppBar.
          Container(

            // Jarak bagian kanan.
            margin: const EdgeInsets.only(right: 16),

            // Padding bagian dalam badge.
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),

            // Mengatur tampilan badge.
            decoration: BoxDecoration(

              // Background badge menggunakan typeColor
              // dengan transparansi.
              color: typeColor.withValues(alpha: 0.12),

              // Membuat sudut badge melengkung.
              borderRadius: BorderRadius.circular(10),

              // Memberikan border pada badge.
              border: Border.all(
                color: typeColor.withValues(alpha: 0.25),
                width: 1,
              ),
            ),


            // Row digunakan agar icon dan teks tipe
            // berada secara horizontal.
            child: Row(

              // Ukuran Row mengikuti isi di dalamnya.
              mainAxisSize: MainAxisSize.min,

              children: [

                // Icon berdasarkan tipe hewan.
                Icon(
                  typeIcon,
                  size: 13,
                  color: typeColor,
                ),

                // Jarak antara icon dan teks.
                const SizedBox(width: 5),

                // Menampilkan tipe hewan.
                Text(
                  // toUpperCase() membuat teks menjadi huruf kapital.
                  //
                  // Contoh:
                  // mammal → MAMMAL
                  animal.type.toUpperCase(),

                  // Styling teks tipe.
                  style: TextStyle(
                    color: typeColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),


      // ========================================================
      // BODY
      // ========================================================

      // SingleChildScrollView digunakan supaya isi halaman
      // dapat di-scroll ketika kontennya lebih panjang
      // dari ukuran layar.
      body: SingleChildScrollView(

        // Memberikan jarak di sekeliling isi halaman.
        padding: const EdgeInsets.fromLTRB(
          16,
          16,
          16,
          32,
        ),

        child: Column(

          // Membuat child memenuhi lebar yang tersedia.
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [


            // ==================================================
            // 1. GAMBAR HEWAN
            // ==================================================

            // Hero digunakan untuk membuat animasi transisi
            // ketika gambar berpindah dari halaman sebelumnya
            // ke halaman detail.
            Hero(

              // tag harus menjadi identitas yang sama antara
              // Hero di halaman sebelumnya dan halaman ini.
              tag: 'animal-${animal.name}',

              child: Container(

                // Tinggi container gambar.
                height: 260,

                // Lebar mengikuti seluruh ruang yang tersedia.
                width: double.infinity,

                // Mengatur tampilan container.
                decoration: BoxDecoration(

                  // Sudut container dibuat melengkung.
                  borderRadius: BorderRadius.circular(20),

                  // Warna background putih.
                  color: Colors.white,

                  // Border di sekitar gambar.
                  border: Border.all(
                    color: pastelBorder,
                    width: 1,
                  ),

                  // Shadow container.
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3B5249)
                          .withValues(alpha: 0.06),

                      // Tingkat blur shadow.
                      blurRadius: 16,

                      // Posisi shadow.
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),


                // ClipRRect digunakan agar gambar mengikuti
                // bentuk sudut container yang melengkung.
                child: ClipRRect(

                  // Radius gambar dibuat sama dengan container.
                  borderRadius: BorderRadius.circular(20),

                  // Image.network digunakan untuk menampilkan
                  // gambar dari URL internet.
                  child: Image.network(

                    // URL gambar berasal dari data animal.
                    animal.image,

                    // Lebar gambar memenuhi container.
                    width: double.infinity,

                    // BoxFit.contain membuat gambar tetap proporsional
                    // dan tidak terpotong.
                    fit: BoxFit.contain,


                    // ==================================================
                    // LOADING GAMBAR
                    // ==================================================

                    // loadingBuilder digunakan ketika gambar
                    // masih dalam proses dimuat.
                    loadingBuilder: (
                      context,
                      child,
                      loadingProgress,
                    ) {

                      // Jika loadingProgress null berarti gambar
                      // sudah selesai dimuat.
                      if (loadingProgress == null) {
                        return child;
                      }

                      // Jika masih loading, tampilkan indikator.
                      return Container(

                        // Background ketika loading.
                        color: const Color(0xFFF1F5F2),

                        child: const Center(

                          // CircularProgressIndicator adalah
                          // indikator proses loading.
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: pastelPrimary,
                          ),
                        ),
                      );
                    },


                    // ==================================================
                    // JIKA GAMBAR ERROR
                    // ==================================================

                    // errorBuilder dijalankan jika gambar gagal
                    // dimuat dari URL.
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {

                      // Jika gagal, tampilkan container pengganti.
                      return Container(
                        color: const Color(0xFFEAEFEA),

                        child: const Center(

                          // Icon menunjukkan bahwa gambar
                          // tidak tersedia.
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),


            // Jarak antara gambar dan card informasi.
            const SizedBox(height: 18),


            // ==================================================
            // 2. INFO CARD
            // ==================================================

            // Card yang berisi nama dan habitat singkat.
            Container(

              // Jarak isi card dengan batas card.
              padding: const EdgeInsets.all(18),

              // Tampilan card.
              decoration: BoxDecoration(

                // Background putih.
                color: Colors.white,

                // Sudut card melengkung.
                borderRadius: BorderRadius.circular(16),

                // Border card.
                border: Border.all(
                  color: pastelBorder,
                  width: 1,
                ),

                // Shadow card.
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B5249)
                        .withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),


              child: Column(

                // Isi card dimulai dari kiri.
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // Menampilkan nama hewan.
                  Text(
                    animal.name,

                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: pastelDark,
                    ),
                  ),


                  // Jarak antara nama dan habitat.
                  const SizedBox(height: 6),


                  // Row digunakan untuk icon dan habitat.
                  Row(
                    children: [

                      // Icon yang menunjukkan habitat.
                      const Icon(
                        Icons.landscape_outlined,
                        size: 15,
                        color: Color(0xFF869B8E),
                      ),

                      // Jarak icon dengan teks.
                      const SizedBox(width: 6),


                      // Expanded membuat teks habitat
                      // menggunakan ruang yang tersedia.
                      Expanded(
                        child: Text(

                          // habitat merupakan List<String>.
                          //
                          // join(', ') digunakan untuk menggabungkan
                          // semua isi list menjadi satu String.
                          //
                          // Contoh:
                          // ["Forest", "Grassland"]
                          //
                          // menjadi:
                          // "Forest, Grassland"
                          animal.habitat.join(', '),

                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF758A7D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            // Jarak antar section.
            const SizedBox(height: 14),


            // ==================================================
            // 3. STATISTIK FISIK
            // ==================================================

            // Row membuat dua card berada berdampingan.
            Row(
              children: [

                // Expanded membuat card pertama mengambil
                // ruang yang tersedia secara proporsional.
                Expanded(
                  child: _DetailStatCard(

                    // Icon untuk berat badan.
                    icon: Icons.scale_rounded,

                    // Label card.
                    label: 'Berat Badan',

                    // Nilai berat dari data animal.
                    //
                    // String interpolation digunakan untuk
                    // menggabungkan nilai dengan "kg".
                    value: '${animal.weight} kg',

                    // Warna card.
                    color: const Color(0xFF5B8A72),
                  ),
                ),


                // Jarak antara dua card.
                const SizedBox(width: 12),


                // Card kedua untuk tinggi.
                Expanded(
                  child: _DetailStatCard(

                    // Icon untuk tinggi.
                    icon: Icons.height_rounded,

                    // Label card.
                    label: 'Tinggi',

                    // Nilai tinggi dari data animal.
                    value: '${animal.height} cm',

                    // Warna card.
                    color: const Color(0xFFB5704D),
                  ),
                ),
              ],
            ),


            // Jarak setelah statistik fisik.
            const SizedBox(height: 18),


            // ==================================================
            // 4. HABITAT ALAMI
            // ==================================================

            Container(

              // Padding bagian dalam.
              padding: const EdgeInsets.all(18),

              // Tampilan card.
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

                // Border card.
                border: Border.all(
                  color: pastelBorder,
                  width: 1,
                ),

                // Shadow card.
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B5249)
                        .withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),


              child: Column(

                // Isi card dimulai dari kiri.
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // Row untuk icon dan judul section.
                  const Row(
                    children: [

                      // Icon habitat.
                      Icon(
                        Icons.park_outlined,
                        size: 18,
                        color: pastelPrimary,
                      ),

                      // Jarak icon dan teks.
                      SizedBox(width: 8),

                      // Judul section.
                      Text(
                        'Habitat Alami',

                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: pastelDark,
                        ),
                      ),
                    ],
                  ),


                  // Jarak antara judul dan daftar habitat.
                  const SizedBox(height: 12),


                  // Wrap digunakan agar item habitat bisa
                  // berpindah baris jika ruang tidak cukup.
                  Wrap(

                    // Jarak horizontal antar item.
                    spacing: 8,

                    // Jarak vertikal antar baris.
                    runSpacing: 8,


                    // map() digunakan untuk membuat widget
                    // dari setiap data habitat.
                    children: animal.habitat.map((h) {

                      // Setiap habitat dibuat menjadi Container.
                      return Container(

                        // Padding bagian dalam item habitat.
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),

                        // Tampilan item habitat.
                        decoration: BoxDecoration(

                          // Background.
                          color: pastelBackground,

                          // Sudut melengkung.
                          borderRadius: BorderRadius.circular(10),

                          // Border.
                          border: Border.all(
                            color: pastelBorder,
                          ),
                        ),


                        // Row digunakan untuk icon dan nama habitat.
                        child: Row(

                          // Row hanya menggunakan ruang
                          // sesuai isi.
                          mainAxisSize: MainAxisSize.min,

                          children: [

                            // Icon untuk habitat.
                            const Icon(
                              Icons.eco_outlined,
                              size: 14,
                              color: pastelPrimary,
                            ),

                            // Jarak icon dengan nama habitat.
                            const SizedBox(width: 6),

                            // Menampilkan nama habitat.
                            Text(
                              h,

                              style: const TextStyle(
                                color: pastelDark,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );

                    // toList() mengubah hasil map menjadi List Widget.
                    }).toList(),
                  ),
                ],
              ),
            ),


            // Jarak setelah section habitat.
            const SizedBox(height: 18),


            // ==================================================
            // 5. AKTIVITAS SEHARI-HARI
            // ==================================================

            Container(

              // Padding isi card.
              padding: const EdgeInsets.all(18),

              // Tampilan card.
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

                // Border.
                border: Border.all(
                  color: pastelBorder,
                  width: 1,
                ),

                // Shadow.
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B5249)
                        .withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),


              child: Column(

                // Isi card dimulai dari kiri.
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // Row untuk icon dan judul.
                  const Row(
                    children: [

                      // Icon aktivitas.
                      Icon(
                        Icons.directions_run_rounded,
                        size: 18,
                        color: pastelPrimary,
                      ),

                      // Jarak icon dan teks.
                      SizedBox(width: 8),

                      // Judul section.
                      Text(
                        'Aktivitas Sehari-hari',

                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: pastelDark,
                        ),
                      ),
                    ],
                  ),


                  // Jarak antara judul dan daftar aktivitas.
                  const SizedBox(height: 12),


                  // asMap().entries digunakan untuk mendapatkan
                  // index sekaligus isi dari setiap aktivitas.
                  //
                  // Contoh:
                  // index = 0, activity = "Hunting"
                  // index = 1, activity = "Roaming"
                  // index = 2, activity = "Sleeping"
                  ...animal.activities.asMap().entries.map((entry) {

                    // Mengambil nomor/index aktivitas.
                    final index = entry.key;

                    // Mengambil isi aktivitas.
                    final activity = entry.value;


                    // Padding digunakan untuk memberi jarak
                    // di bawah setiap item aktivitas.
                    return Padding(

                      padding: const EdgeInsets.only(bottom: 8),

                      child: Container(

                        // Padding bagian dalam item.
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),

                        // Tampilan item aktivitas.
                        decoration: BoxDecoration(
                          color: pastelBackground,
                          borderRadius: BorderRadius.circular(12),

                          // Border item.
                          border: Border.all(
                            color: pastelBorder,
                          ),
                        ),


                        child: Row(
                          children: [

                            // ==================================================
                            // NOMOR AKTIVITAS
                            // ==================================================

                            Container(

                              // Lebar nomor.
                              width: 24,

                              // Tinggi nomor.
                              height: 24,

                              // Tampilan kotak nomor.
                              decoration: BoxDecoration(

                                // Background transparan dari
                                // warna utama.
                                color: pastelPrimary
                                    .withValues(alpha: 0.15),

                                // Sudut kotak nomor.
                                borderRadius: BorderRadius.circular(6),
                              ),


                              // Center membuat nomor berada
                              // di tengah kotak.
                              child: Center(
                                child: Text(

                                  // index dimulai dari 0.
                                  // +1 membuat nomor dimulai dari 1.
                                  //
                                  // 0 + 1 = 1
                                  // 1 + 1 = 2
                                  // 2 + 1 = 3
                                  '${index + 1}',

                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: pastelPrimary,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),


                            // Jarak antara nomor dan nama aktivitas.
                            const SizedBox(width: 12),


                            // Expanded membuat teks aktivitas
                            // menggunakan sisa ruang yang tersedia.
                            Expanded(
                              child: Text(

                                // Menampilkan aktivitas.
                                activity,

                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4A5C50),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ================================================================
// WIDGET _DetailStatCard
// ================================================================

// Widget ini digunakan untuk membuat card statistik,
// yaitu card Berat Badan dan Tinggi.
//
// Widget dibuat terpisah supaya kode card tidak perlu
// ditulis berulang kali.
class _DetailStatCard extends StatelessWidget {

  // Icon yang akan ditampilkan.
  final IconData icon;

  // Label seperti "Berat Badan" atau "Tinggi".
  final String label;

  // Nilai yang ditampilkan seperti "220.5 kg" atau "110 cm".
  final String value;

  // Warna icon dan value.
  final Color color;


  // Constructor _DetailStatCard.
  //
  // Semua data wajib diberikan karena menggunakan required.
  const _DetailStatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });


  @override
  Widget build(BuildContext context) {

    // Container digunakan sebagai bentuk card statistik.
    return Container(

      // Jarak isi card dari tepi.
      padding: const EdgeInsets.all(14),

      // Mengatur tampilan card.
      decoration: BoxDecoration(

        // Background putih.
        color: Colors.white,

        // Sudut card melengkung.
        borderRadius: BorderRadius.circular(14),

        // Border card.
        border: Border.all(
          color: const Color(0xFFDCE8DF),
        ),

        // Shadow card.
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B5249)
                .withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),


      // Isi card menggunakan Column.
      child: Column(

        // Isi dimulai dari kiri.
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          // Row digunakan untuk menempatkan
          // icon dan label secara horizontal.
          Row(
            children: [

              // Icon dikirim melalui parameter icon.
              Icon(
                icon,
                size: 16,
                color: color,
              ),

              // Jarak antara icon dan label.
              const SizedBox(width: 6),

              // Menampilkan label.
              Text(
                label,

                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF758A7C),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),


          // Jarak antara label dan nilai.
          const SizedBox(height: 8),


          // Menampilkan nilai statistik.
          //
          // Contoh:
          // 220.5 kg
          // 110 cm
          Text(
            value,

            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,

              // Warna value mengikuti parameter color.
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}