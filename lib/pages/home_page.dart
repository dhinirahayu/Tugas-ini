import 'package:flutter/material.dart';

// Mengambil data dummy hewan dari file animals_data.dart.
import 'package:latihankuis/data/animals_data.dart';

// Mengambil class/model Animal.
import 'package:latihankuis/model/animal.dart';

// Mengambil halaman detail hewan.
import 'package:latihankuis/pages/animal_detail_page.dart';

// Mengambil halaman login.
// Digunakan ketika user melakukan logout.
import 'package:latihankuis/pages/login_page.dart';


// ================================================================
// HOMEPAGE
// ================================================================

// HomePage menggunakan StatefulWidget karena terdapat state
// _currentIndex yang dapat berubah ketika BottomNavigationBar
// digunakan.
class HomePage extends StatefulWidget {

  // Constructor HomePage.
  const HomePage({super.key});

  @override

  // Membuat State dari HomePage.
  State<HomePage> createState() => _HomePageState();
}


// ================================================================
// STATE HOMEPAGE
// ================================================================

class _HomePageState extends State<HomePage> {

  // Menyimpan index menu yang sedang dipilih.
  //
  // 0 = Home
  // 1 = Logout
  int _currentIndex = 0;


  // ==============================================================
  // PALET WARNA
  // ==============================================================

  // Warna utama aplikasi.
  static const Color pastelPrimary = Color(0xFF6B9080);

  // Warna gelap untuk teks.
  static const Color pastelDark = Color(0xFF3B5249);

  // Warna background halaman.
  static const Color pastelBackground = Color(0xFFF3F7F4);

  // Warna border.
  static const Color pastelBorder = Color(0xFFDCE8DF);


  // ==============================================================
  // FUNGSI MENENTUKAN ICON BERDASARKAN TIPE HEWAN
  // ==============================================================

  // Fungsi menerima type berupa String.
  // Kemudian mengembalikan IconData sesuai tipe hewan.
  IconData _getTypeIcon(String type) {

    // toLowerCase() membuat perbandingan tidak terpengaruh
    // oleh huruf besar atau kecil.
    switch (type.toLowerCase()) {

      // Jika type = mammal.
      case 'mammal':
        return Icons.pets_rounded;

      // Jika type = reptile.
      case 'reptile':
        return Icons.park_rounded;

      // Jika type = bird.
      case 'bird':
        return Icons.flutter_dash_rounded;

      // Jika type = dog.
      case 'dog':
        return Icons.pets_rounded;

      // Jika type tidak sesuai semua case,
      // gunakan icon default.
      default:
        return Icons.eco_rounded;
    }
  }


  // ==============================================================
  // FUNGSI MENENTUKAN WARNA BERDASARKAN TIPE HEWAN
  // ==============================================================

  // Fungsi menerima type berupa String.
  // Hasilnya berupa Color.
  Color _getTypeColor(String type) {

    // Mengecek tipe hewan.
    switch (type.toLowerCase()) {

      // Warna untuk mammal.
      case 'mammal':
        return const Color(0xFFB5704D);

      // Warna untuk reptile.
      case 'reptile':
        return const Color(0xFF5B8A72);

      // Warna untuk bird.
      case 'bird':
        return const Color(0xFF52796F);

      // Warna untuk dog.
      case 'dog':
        return const Color(0xFF8A6B8A);

      // Warna default.
      default:
        return const Color(0xFF6B9080);
    }
  }


  // ==============================================================
  // FUNGSI LOGOUT
  // ==============================================================

  // Fungsi ini menampilkan dialog konfirmasi sebelum logout.
  //
  // BuildContext context digunakan untuk mengetahui posisi
  // widget ketika menampilkan dialog dan melakukan navigasi.
  void _showLogoutDialog(BuildContext context) {

    // showDialog() digunakan untuk menampilkan dialog.
    showDialog(

      // Context dari halaman saat ini.
      context: context,

      // builder digunakan untuk membuat isi dialog.
      builder: (BuildContext dialogContext) {

        // AlertDialog adalah kotak dialog.
        return AlertDialog(

          // Background dialog berwarna putih.
          backgroundColor: Colors.white,

          // Membuat sudut dialog melengkung.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),


          // ========================================================
          // JUDUL DIALOG
          // ========================================================

          title: const Row(
            children: [

              // Icon logout.
              Icon(
                Icons.logout_rounded,
                color: Color(0xFFD9534F),
                size: 22,
              ),

              // Jarak antara icon dan teks.
              SizedBox(width: 10),

              // Judul dialog.
              Text(
                'Konfirmasi Logout',

                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: pastelDark,
                ),
              ),
            ],
          ),


          // ========================================================
          // ISI DIALOG
          // ========================================================

          content: const Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?',

            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF5E6E63),
            ),
          ),


          // ========================================================
          // BUTTON DIALOG
          // ========================================================

          actions: [

            // ------------------------------------------------------
            // BUTTON BATAL
            // ------------------------------------------------------

            TextButton(

              // Ketika tombol Batal ditekan.
              onPressed: () {

                // Menutup dialog.
                Navigator.pop(dialogContext);

                // Mengembalikan index ke Home.
                setState(() {
                  _currentIndex = 0;
                });
              },


              // Teks tombol Batal.
              child: const Text(
                'Batal',

                style: TextStyle(
                  color: Color(0xFF7A8D80),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),


            // ------------------------------------------------------
            // BUTTON KELUAR
            // ------------------------------------------------------

            ElevatedButton(

              // Ketika tombol Keluar ditekan.
              onPressed: () {

                // Menutup dialog terlebih dahulu.
                Navigator.pop(dialogContext);

                // pushReplacement digunakan untuk mengganti
                // halaman Home dengan halaman Login.
                //
                // Karena halaman diganti, user tidak kembali
                // ke Home menggunakan tombol back.
                Navigator.pushReplacement(
                  context,

                  // Membuat route menuju LoginPage.
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },


              // Mengatur tampilan tombol.
              style: ElevatedButton.styleFrom(

                // Background tombol merah.
                backgroundColor: const Color(0xFFD9534F),

                // Warna teks putih.
                foregroundColor: Colors.white,

                // Tidak menggunakan elevation.
                elevation: 0,

                // Membuat sudut tombol melengkung.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                // Padding tombol.
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),


              // Teks tombol.
              child: const Text('Keluar'),
            ),
          ],
        );
      },


    // then() dijalankan setelah dialog ditutup.
    ).then((_) {

      // mounted mengecek apakah widget masih berada
      // di dalam widget tree.
      //
      // Ini membantu menghindari setState ketika widget
      // sudah tidak aktif.
      if (mounted) {

        // Mengembalikan index ke Home.
        setState(() {
          _currentIndex = 0;
        });
      }
    });
  }


  // ==============================================================
  // BUILD HOMEPAGE
  // ==============================================================

  @override
  Widget build(BuildContext context) {

    // Scaffold adalah kerangka utama halaman.
    return Scaffold(

      // Background halaman.
      backgroundColor: pastelBackground,


      // ============================================================
      // APP BAR
      // ============================================================

      appBar: AppBar(

        // Background AppBar.
        backgroundColor: Colors.white,

        // Menghilangkan elevation.
        elevation: 0,

        // Elevation ketika halaman di-scroll.
        scrolledUnderElevation: 1,

        // Warna shadow.
        shadowColor: Colors.black.withValues(alpha: 0.05),

        // Jarak antara sisi kiri dan title.
        titleSpacing: 20,


        // Isi title AppBar.
        title: Row(
          children: [

            // Judul halaman.
            const Text(
              'Animals List',

              style: TextStyle(
                color: pastelDark,
                fontWeight: FontWeight.w800,
                fontSize: 19,
                letterSpacing: 0.3,
              ),
            ),


            // Jarak antara judul dan jumlah spesies.
            const SizedBox(width: 10),


            // Badge jumlah spesies.
            Container(

              // Padding badge.
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 4,
              ),

              // Tampilan badge.
              decoration: BoxDecoration(

                // Background badge.
                color: const Color(0xFFE8F2EA),

                // Sudut badge melengkung.
                borderRadius: BorderRadius.circular(10),
              ),


              child: Text(

                // dummyAnimals.length mengambil jumlah
                // data yang ada di dalam list dummyAnimals.
                //
                // Jika ada 6 data:
                // "6 Spesies"
                '${dummyAnimals.length} Spesies',

                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: pastelPrimary,
                ),
              ),
            ),
          ],
        ),
      ),


      // ============================================================
      // BODY
      // ============================================================

      // GridView.builder digunakan untuk membuat tampilan grid
      // hewan secara dinamis sesuai ketentuan soal kuis.
      body: GridView.builder(

        // Jarak padding di sekeliling Grid:
        // horizontal 14, atas 14, dan bawah 24.
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 24),

        // Mengatur jumlah dan ukuran kolom grid.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

          // 2 kolom dalam satu baris.
          crossAxisCount: 2,

          // Jarak vertikal antar item.
          mainAxisSpacing: 12,

          // Jarak horizontal antar item.
          crossAxisSpacing: 12,

          // Perbandingan lebar dan tinggi item.
          childAspectRatio: 0.72,
        ),

        // Jumlah item mengikuti total data hewan pada dummyAnimals.
        itemCount: dummyAnimals.length,

        // Builder untuk membangun card setiap hewan secara dinamis.
        itemBuilder: (context, index) {

          // Mengambil data Animal berdasarkan index.
          //
          // Contoh:
          // index 0 → dummyAnimals[0]
          // index 1 → dummyAnimals[1]
          final Animal animal = dummyAnimals[index];

          // Membuat card hewan.
          return _AnimalGridCard(

            // Mengirim object Animal ke card.
            animal: animal,

            // Mengirim icon berdasarkan type.
            typeIcon: _getTypeIcon(animal.type),

            // Mengirim warna berdasarkan type.
            typeColor: _getTypeColor(animal.type),

            // Fungsi yang dijalankan ketika card diklik.
            onTap: () {

              // Navigator.push digunakan untuk membuka
              // halaman baru.
              //
              // Halaman Home tetap berada di bawah stack,
              // sehingga bisa kembali menggunakan pop().
              Navigator.push(
                context,

                // Route menuju AnimalDetailPage.
                MaterialPageRoute(

                  // Mengirim object animal ke halaman detail.
                  builder: (context) => AnimalDetailPage(
                    animal: animal,
                  ),
                ),
              );
            },
          );
        },
      ),


      // ============================================================
      // BOTTOM NAVIGATION BAR
      // ============================================================

      // Container digunakan sebagai pembungkus BottomNavigationBar.
      bottomNavigationBar: Container(

        // Tampilan bagian bawah.
        decoration: const BoxDecoration(

          // Background putih.
          color: Colors.white,

          // Border di bagian atas.
          border: Border(
            top: BorderSide(
              color: pastelBorder,
              width: 1,
            ),
          ),
        ),


        child: BottomNavigationBar(

          // Menentukan item yang sedang dipilih.
          currentIndex: _currentIndex,

          // Menghilangkan elevation.
          elevation: 0,

          // Background navigation bar.
          backgroundColor: Colors.white,

          // Warna item yang sedang aktif.
          selectedItemColor: pastelPrimary,

          // Warna item yang tidak aktif.
          unselectedItemColor: const Color(0xFF8AA091),


          // Style label ketika aktif.
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),


          // Style label ketika tidak aktif.
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),


          // fixed berarti semua item mendapatkan ruang
          // yang tetap.
          type: BottomNavigationBarType.fixed,


          // Dipanggil ketika user menekan salah satu item.
          onTap: (index) {

            // Jika user memilih Home.
            if (index == 0) {

              // Mengubah state agar index menjadi 0.
              setState(() {
                _currentIndex = 0;
              });


            // Jika user memilih Logout.
            } else if (index == 1) {

              // Mengubah index menjadi 1.
              setState(() {
                _currentIndex = 1;
              });


              // Menampilkan dialog konfirmasi logout.
              _showLogoutDialog(context);
            }
          },


          // ========================================================
          // ITEM BOTTOM NAVIGATION
          // ========================================================

          items: const [

            // Item Home.
            BottomNavigationBarItem(

              // Icon Home.
              icon: Icon(Icons.home_rounded),

              // Label.
              label: 'Home',
            ),


            // Item Logout.
            BottomNavigationBarItem(

              // Icon Logout.
              icon: Icon(Icons.logout_rounded),

              // Label.
              label: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}


// ==================================================================
// WIDGET _AnimalGridCard
// ==================================================================

// Widget ini merupakan card untuk menampilkan satu hewan.
//
// Dibuat menjadi StatelessWidget karena card hanya menampilkan
// data yang diberikan melalui parameter.
class _AnimalGridCard extends StatelessWidget {

  // Object Animal yang akan ditampilkan.
  final Animal animal;

  // Icon berdasarkan tipe hewan.
  final IconData typeIcon;

  // Warna berdasarkan tipe hewan.
  final Color typeColor;

  // Callback yang dijalankan ketika card ditekan.
  final VoidCallback onTap;


  // Constructor.
  //
  // Semua parameter wajib diberikan karena menggunakan required.
  const _AnimalGridCard({
    required this.animal,
    required this.typeIcon,
    required this.typeColor,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {

    // Material digunakan agar InkWell dapat memberikan
    // efek interaksi/tap.
    return Material(

      // Radius Material.
      borderRadius: BorderRadius.circular(16),

      // Warna card.
      color: Colors.white,

      // Tidak menggunakan elevation.
      elevation: 0,


      child: InkWell(

        // Radius efek tap sama dengan card.
        borderRadius: BorderRadius.circular(16),

        // Ketika card ditekan, jalankan onTap.
        onTap: onTap,


        child: Container(

          // Tampilan card.
          decoration: BoxDecoration(

            // Sudut card melengkung.
            borderRadius: BorderRadius.circular(16),

            // Border card.
            border: Border.all(
              color: const Color(0xFFDFE9E1),
              width: 1,
            ),


            // Shadow card.
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B5249)
                    .withValues(alpha: 0.03),

                // Blur shadow.
                blurRadius: 10,

                // Posisi shadow.
                offset: const Offset(0, 4),
              ),
            ],
          ),


          // ========================================================
          // ISI CARD
          // ========================================================

          child: Column(

            // Semua isi card dimulai dari kiri.
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [


              // ====================================================
              // GAMBAR HEWAN
              // ====================================================

              // Expanded digunakan agar bagian gambar
              // mendapatkan ruang sesuai flex.
              Expanded(

                // flex 11 berarti bagian gambar memiliki
                // proporsi 11.
                flex: 11,

                child: Hero(

                  // Tag Hero harus sama dengan Hero di halaman detail.
                  //
                  // Digunakan untuk membuat animasi gambar
                  // ketika berpindah ke halaman detail.
                  tag: 'animal-${animal.name}',


                  child: ClipRRect(

                    // Hanya sudut atas gambar yang dibuat melengkung.
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),


                    // Stack digunakan agar badge tipe bisa
                    // ditempatkan di atas gambar.
                    child: Stack(

                      // Child Stack memenuhi seluruh area.
                      fit: StackFit.expand,

                      children: [

                        // ==================================================
                        // IMAGE NETWORK
                        // ==================================================

                        // Menampilkan gambar dari URL.
                        Image.network(

                          // URL gambar berasal dari Animal.
                          animal.image,

                          // Lebar mengikuti card.
                          width: double.infinity,

                          // Gambar memenuhi area.
                          fit: BoxFit.cover,


                          // ==================================================
                          // LOADING IMAGE
                          // ==================================================

                          // Menampilkan indikator ketika gambar
                          // sedang dimuat.
                          loadingBuilder: (
                            context,
                            child,
                            loadingProgress,
                          ) {

                            // Jika null berarti gambar sudah selesai.
                            if (loadingProgress == null) {
                              return child;
                            }


                            // Jika belum selesai,
                            // tampilkan loading indicator.
                            return Container(
                              color: const Color(0xFFF1F5F2),

                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFF6B9080),
                                ),
                              ),
                            );
                          },


                          // ==================================================
                          // ERROR IMAGE
                          // ==================================================

                          // Jika gambar gagal dimuat.
                          errorBuilder: (
                            context,
                            error,
                            stackTrace,
                          ) {

                            // Tampilkan container pengganti.
                            return Container(
                              color: const Color(0xFFEAEFEA),

                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Colors.grey,
                                  size: 26,
                                ),
                              ),
                            );
                          },
                        ),


                        // ==================================================
                        // BADGE TIPE HEWAN
                        // ==================================================

                        // Positioned digunakan untuk meletakkan
                        // badge di posisi tertentu di atas gambar.
                        Positioned(

                          // Jarak dari atas.
                          top: 8,

                          // Jarak dari kiri.
                          left: 8,


                          child: Container(

                            // Padding badge.
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 3,
                            ),


                            decoration: BoxDecoration(

                              // Background putih transparan.
                              color: Colors.white.withValues(
                                alpha: 0.92,
                              ),

                              // Sudut badge.
                              borderRadius: BorderRadius.circular(8),


                              // Shadow badge.
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                    alpha: 0.06,
                                  ),
                                  blurRadius: 4,
                                ),
                              ],
                            ),


                            // Row untuk icon dan nama tipe.
                            child: Row(

                              // Ukuran mengikuti isi.
                              mainAxisSize: MainAxisSize.min,

                              children: [

                                // Icon tipe hewan.
                                Icon(
                                  typeIcon,
                                  size: 12,
                                  color: typeColor,
                                ),

                                // Jarak icon dan teks.
                                const SizedBox(width: 4),

                                // Nama tipe hewan.
                                Text(
                                  animal.type,

                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: typeColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              // ====================================================
              // INFORMASI HEWAN
              // ====================================================

              // Bagian informasi hewan.
              Expanded(

                // Proporsi informasi.
                flex: 8,

                child: Padding(

                  // Padding isi informasi.
                  padding: const EdgeInsets.fromLTRB(
                    10,
                    8,
                    10,
                    10,
                  ),


                  child: Column(

                    // Isi dimulai dari kiri.
                    crossAxisAlignment: CrossAxisAlignment.start,

                    // Memberikan jarak antar bagian
                    // menggunakan ruang yang tersedia.
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [


                      // ==================================================
                      // NAMA HEWAN
                      // ==================================================

                      Text(
                        animal.name,

                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E30),
                        ),


                        // Nama maksimal satu baris.
                        maxLines: 1,

                        // Jika terlalu panjang, gunakan ...
                        overflow: TextOverflow.ellipsis,
                      ),


                      // ==================================================
                      // HABITAT
                      // ==================================================

                      Row(
                        children: [

                          // Icon habitat.
                          const Icon(
                            Icons.landscape_outlined,
                            size: 13,
                            color: Color(0xFF869B8E),
                          ),

                          // Jarak icon dengan teks.
                          const SizedBox(width: 4),


                          // Expanded membuat teks habitat
                          // menggunakan ruang yang tersedia.
                          Expanded(
                            child: Text(

                              // Menggabungkan habitat.
                              //
                              // Contoh:
                              // ["Forest", "Grassland"]
                              //
                              // menjadi:
                              // "Forest, Grassland"
                              animal.habitat.join(', '),

                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF758A7D),
                              ),


                              // Habitat maksimal satu baris.
                              maxLines: 1,

                              // Jika terlalu panjang,
                              // tampilkan ...
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),


                      // ==================================================
                      // FOOTER BERAT DAN TINGGI
                      // ==================================================

                      // Container kecil untuk menampilkan
                      // berat dan tinggi hewan.
                      Container(

                        // Padding footer.
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),


                        decoration: BoxDecoration(

                          // Background footer.
                          color: const Color(0xFFF3F7F4),

                          // Sudut footer.
                          borderRadius: BorderRadius.circular(6),
                        ),


                        child: Text(

                          // Menampilkan berat dan tinggi.
                          //
                          // Contoh:
                          // 220.5 kg • 110 cm
                          '${animal.weight} kg • ${animal.height} cm',

                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6B8072),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}