import 'package:flutter/material.dart';

// Mengimport HomePage karena setelah login berhasil,
// halaman akan berpindah ke HomePage.
import 'package:latihankuis/pages/home_page.dart';


// =====================================================
// LOGIN PAGE
// =====================================================

// LoginPage menggunakan StatefulWidget karena di dalam
// halaman ini ada data yang bisa berubah, yaitu:
// 1. Password bisa ditampilkan/disembunyikan
// 2. Input username dan password berubah
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


// =====================================================
// STATE DARI LOGIN PAGE
// =====================================================

class _LoginPageState extends State<LoginPage> {

  // TextEditingController digunakan untuk mengambil
  // teks yang diketik user pada TextField username.
  final TextEditingController _usernameController =
      TextEditingController();

  // Controller untuk mengambil password yang diketik user.
  final TextEditingController _passwordController =
      TextEditingController();

  // Menentukan apakah password disembunyikan atau tidak.
  //
  // true  = password disembunyikan
  // false = password ditampilkan
  bool _obscurePassword = true;


  // =====================================================
  // WARNA
  // =====================================================

  // Warna utama halaman login.
  static const Color pastelPrimary = Color(0xFF6B9080);

  // Warna teks gelap.
  static const Color pastelDark = Color(0xFF2C3E30);

  // Warna background halaman.
  static const Color pastelBackground = Color(0xFFF3F7F4);


  // =====================================================
  // DISPOSE
  // =====================================================

  @override
  void dispose() {

    // Menghapus controller username ketika halaman
    // sudah tidak digunakan lagi.
    _usernameController.dispose();

    // Menghapus controller password.
    _passwordController.dispose();

    // Memanggil dispose milik parent.
    super.dispose();
  }


  // =====================================================
  // FUNGSI LOGIN
  // =====================================================

  void _login() {

    // Mengambil isi TextField username.
    //
    // .text = mengambil teks yang diketik user.
    //
    // .trim() = menghapus spasi yang tidak sengaja
    // ada di awal atau akhir teks.
    String username = _usernameController.text.trim();

    // Mengambil isi TextField password.
    String password = _passwordController.text.trim();


    // =================================================
    // CEK USERNAME DAN PASSWORD
    // =================================================

    // Username hanya dianggap benar jika:
    // username = "124240197"
    bool isUsernameValid = username == "124240197";

    // Password hanya dianggap benar jika:
    // password = "SistemInformasi"
    bool isPasswordValid = password == "SistemInformasi";


    // =================================================
    // JIKA LOGIN BERHASIL
    // =================================================

    if (isUsernameValid && isPasswordValid) {

      // Navigator.pushReplacement digunakan untuk
      // berpindah dari LoginPage ke HomePage.
      //
      // "Replacement" artinya LoginPage digantikan
      // oleh HomePage sehingga user tidak kembali
      // ke halaman login dengan tombol Back.
      Navigator.pushReplacement(
        context,

        // Membuat route menuju HomePage.
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );


    } else {

      // =================================================
      // JIKA LOGIN GAGAL
      // =================================================

      // ScaffoldMessenger digunakan untuk menampilkan
      // SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(

        // SnackBar adalah pesan sementara yang muncul
        // di bagian bawah layar.
        SnackBar(

          // Isi SnackBar berupa Row agar icon dan teks
          // bisa ditampilkan berdampingan.
          content: const Row(
            children: [

              // Icon tanda error.
              Icon(
                Icons.error_outline_rounded,
                color: Colors.white,
                size: 20,
              ),

              // Jarak antara icon dan teks.
              SizedBox(width: 10),

              // Expanded membuat Text menggunakan
              // ruang yang tersedia.
              Expanded(
                child: Text(
                  'Login gagal! Username atau Password salah.',

                  // Mengatur tampilan teks.
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          // Warna merah SnackBar.
          backgroundColor: const Color(0xFFD9534F),

          // SnackBar dibuat mengambang.
          behavior: SnackBarBehavior.floating,

          // Membuat sudut SnackBar membulat.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          // Memberikan jarak SnackBar dari tepi layar.
          margin: const EdgeInsets.all(16),

          // SnackBar tampil selama 3 detik.
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }


  // =====================================================
  // DIALOG BANTUAN LOGIN
  // =====================================================

  void _showForgotPasswordHint() {

    // showDialog digunakan untuk menampilkan
    // kotak dialog di atas halaman.
    showDialog(

      // context halaman saat ini.
      context: context,

      // builder membuat isi dialog.
      builder: (context) => AlertDialog(

        // Background dialog berwarna putih.
        backgroundColor: Colors.white,

        // Membuat sudut dialog membulat.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        // Judul dialog.
        title: const Row(
          children: [

            // Icon informasi.
            Icon(
              Icons.info_outline_rounded,
              color: pastelPrimary,
              size: 22,
            ),

            // Jarak antara icon dan teks.
            SizedBox(width: 8),

            // Judul.
            Text(
              'Bantuan Login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: pastelDark,
              ),
            ),
          ],
        ),

        // Isi dialog.
        content: const Column(
          // Ukuran Column menyesuaikan isi.
          mainAxisSize: MainAxisSize.min,

          // Isi teks rata kiri.
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              'Gunakan akun sesuai ketentuan:',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),

            // Jarak.
            SizedBox(height: 10),

            // Informasi username.
            Text(
              '• Username : 124240197',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),

            SizedBox(height: 4),

            // Informasi password.
            Text(
              '• Password : SistemInformasi',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),

        // Tombol pada bagian bawah dialog.
        actions: [

          TextButton(

            // Ketika tombol OK ditekan,
            // dialog ditutup menggunakan Navigator.pop().
            onPressed: () => Navigator.pop(context),

            child: const Text(
              'OK',
              style: TextStyle(
                color: pastelPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }


  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {

    // Mengambil ukuran layar perangkat.
    //
    // screenSize.width  = lebar layar
    // screenSize.height = tinggi layar
    final screenSize = MediaQuery.of(context).size;


    return Scaffold(

      // Background halaman.
      backgroundColor: pastelBackground,

      // Stack digunakan karena beberapa widget
      // ingin ditumpuk di atas widget lainnya.
      body: Stack(
        children: [

          // =================================================
          // 1. BACKGROUND HIJAU DI BAGIAN ATAS
          // =================================================

          Positioned(

            // Posisi bagian atas.
            top: -screenSize.width * 0.35,

            // Posisi kiri.
            left: -screenSize.width * 0.2,

            // Posisi kanan.
            right: -screenSize.width * 0.2,

            // Tinggi background.
            height: screenSize.height * 0.50,

            child: Container(

              // Mengatur bentuk background.
              decoration: const BoxDecoration(

                // Warna hijau pastel.
                color: pastelPrimary,

                // Membuat bagian bawah berbentuk lengkungan.
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(500, 260),
                ),
              ),
            ),
          ),


          // =================================================
          // 2. FORM LOGIN
          // =================================================

          // SafeArea menjaga konten agar tidak tertutup
          // oleh notch/status bar.
          SafeArea(
            child: Center(

              // SingleChildScrollView membuat halaman
              // bisa di-scroll jika layar terlalu kecil.
              child: SingleChildScrollView(

                // Jarak kiri-kanan dan atas-bawah.
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),

                child: Column(

                  // Isi Column diletakkan di tengah.
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    // Jarak dari bagian atas.
                    const SizedBox(height: 40),


                    // =================================================
                    // CARD LOGIN
                    // =================================================

                    // Stack digunakan agar tombol Login
                    // bisa dibuat overlap dengan Card.
                    Stack(

                      // Widget yang keluar dari batas Stack
                      // tetap boleh terlihat.
                      clipBehavior: Clip.none,

                      // Posisi child berdasarkan bagian bawah tengah.
                      alignment: Alignment.bottomCenter,

                      children: [

                        // =================================================
                        // CARD PUTIH
                        // =================================================

                        Container(

                          // Card memenuhi lebar yang tersedia.
                          width: double.infinity,

                          // Lebar maksimal card = 390 pixel.
                          constraints: const BoxConstraints(
                            maxWidth: 390,
                          ),

                          // Padding bagian dalam card.
                          padding: const EdgeInsets.fromLTRB(
                            26,
                            32,
                            26,
                            42,
                          ),

                          // Dekorasi card.
                          decoration: BoxDecoration(

                            // Warna card putih.
                            color: Colors.white,

                            // Sudut card membulat.
                            borderRadius: BorderRadius.circular(26),

                            // Bayangan card.
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 28,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),


                          // Isi Card.
                          child: Column(

                            // Isi diratakan ke kiri.
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            // Tinggi Column mengikuti isi.
                            mainAxisSize: MainAxisSize.min,

                            children: [


                              // =================================================
                              // USERNAME
                              // =================================================

                              // Row digunakan agar icon dan
                              // TextField berada satu baris.
                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,

                                children: [

                                  // Icon user.
                                  const Icon(
                                    Icons.person_outline_rounded,
                                    color: Color(0xFF64748B),
                                    size: 26,
                                  ),

                                  // Jarak antara icon dan TextField.
                                  const SizedBox(width: 16),

                                  // Expanded membuat TextField
                                  // mengambil sisa ruang.
                                  Expanded(
                                    child: TextField(

                                      // Menghubungkan TextField
                                      // dengan controller username.
                                      controller: _usernameController,

                                      // Style tulisan yang diketik.
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF1E293B),
                                        fontWeight: FontWeight.w500,
                                      ),

                                      // Pengaturan tampilan TextField.
                                      decoration: const InputDecoration(

                                        // Teks petunjuk.
                                        hintText: 'Username',

                                        hintStyle: TextStyle(
                                          color: Color(0xFF94A3B8),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),

                                        // Tidak menggunakan border bawaan.
                                        border: InputBorder.none,

                                        // Membuat TextField lebih padat.
                                        isDense: true,

                                        // Jarak atas-bawah isi.
                                        contentPadding:
                                            EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              // =================================================
                              // GARIS PEMBATAS
                              // =================================================

                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),

                                child: Divider(
                                  color: Color(0xFFE2E8F0),
                                  thickness: 1,
                                  height: 20,
                                ),
                              ),


                              // =================================================
                              // PASSWORD
                              // =================================================

                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,

                                children: [

                                  // Icon kunci.
                                  const Icon(
                                    Icons.vpn_key_outlined,
                                    color: Color(0xFF64748B),
                                    size: 24,
                                  ),

                                  const SizedBox(width: 16),

                                  // TextField mengambil sisa ruang.
                                  Expanded(
                                    child: TextField(

                                      // Controller password.
                                      controller: _passwordController,

                                      // true = password disembunyikan.
                                      obscureText: _obscurePassword,

                                      // Style password.
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF1E293B),
                                        fontWeight: FontWeight.w500,
                                      ),

                                      decoration: InputDecoration(

                                        // Teks petunjuk password.
                                        hintText: '∗ ∗ ∗ ∗ ∗ ∗ ∗ ∗ ∗ ∗',

                                        hintStyle: const TextStyle(
                                          color: Color(0xFF94A3B8),
                                          fontSize: 15,
                                          letterSpacing: 2,
                                        ),

                                        border: InputBorder.none,
                                        isDense: true,

                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),

                                        // Tombol untuk melihat/
                                        // menyembunyikan password.
                                        suffixIcon: IconButton(

                                          padding: EdgeInsets.zero,

                                          constraints:
                                              const BoxConstraints(),

                                          // Icon berubah sesuai kondisi.
                                          icon: Icon(
                                            _obscurePassword
                                                ? Icons
                                                    .visibility_off_outlined
                                                : Icons
                                                    .visibility_outlined,

                                            size: 20,
                                            color:
                                                const Color(0xFF94A3B8),
                                          ),

                                          // Ketika icon ditekan,
                                          // nilai _obscurePassword dibalik.
                                          onPressed: () {
                                            setState(() {

                                              // true menjadi false,
                                              // false menjadi true.
                                              _obscurePassword =
                                                  !_obscurePassword;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              // =================================================
                              // GARIS PEMBATAS KEDUA
                              // =================================================

                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),

                                child: Divider(
                                  color: Color(0xFFE2E8F0),
                                  thickness: 1,
                                  height: 20,
                                ),
                              ),


                              // =================================================
                              // FORGOT PASSWORD / BANTUAN
                              // =================================================

                              // InkWell membuat widget bisa ditekan.
                              InkWell(

                                // Ketika ditekan, tampilkan dialog bantuan.
                                onTap: _showForgotPasswordHint,

                                // Membuat area klik sedikit membulat.
                                borderRadius: BorderRadius.circular(6),

                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 2,
                                  ),
                                ),
                              ),

                              // Jarak sebelum akhir card.
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),


                        // =================================================
                        // TOMBOL LOGIN
                        // =================================================

                        // Positioned digunakan untuk menempatkan
                        // tombol pada posisi tertentu dalam Stack.
                        Positioned(

                          // Nilai negatif membuat tombol
                          // keluar sedikit dari card.
                          bottom: -22,

                          child: ElevatedButton(

                            // Ketika tombol ditekan,
                            // jalankan fungsi _login().
                            onPressed: _login,

                            // Mengatur tampilan tombol.
                            style: ElevatedButton.styleFrom(

                              // Warna tombol.
                              backgroundColor: pastelPrimary,

                              // Warna tulisan.
                              foregroundColor: Colors.white,

                              // Bayangan tombol.
                              elevation: 4,

                              // Warna bayangan.
                              shadowColor:
                                  pastelPrimary.withValues(alpha: 0.45),

                              // Ukuran padding tombol.
                              padding: const EdgeInsets.symmetric(
                                horizontal: 52,
                                vertical: 13,
                              ),

                              // Membuat tombol berbentuk kapsul.
                              shape: const StadiumBorder(),
                            ),

                            child: const Text(
                              'Login',

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Jarak setelah card.
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}