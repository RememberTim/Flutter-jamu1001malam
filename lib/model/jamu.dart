class Jamu {
  String? imageAssets;
  String? nama;
  String? deskripsi;
  String? bahan;
  double? rating;
  String? harga;

  Jamu(
      {required this.imageAssets,
      required this.nama,
      required this.rating,
      required this.deskripsi,
      required this.bahan,
      required this.harga
    });
}

var listJamu = [
  Jamu(
      imageAssets: 'assets/image_sinom.png',
      nama: 'Sinom',
      deskripsi: 'sinom adalah minuman tradisional khas jawa yang sudah ada sejak jaman kerajaan dulu. Minuman lezat ini dibuat dari campuran air, asam Jawa, daun asam muda alias sinom, gula asli dan juga kunyit.',
      bahan: 'asam jawa, sinom, kunyit, gula merah, gula pasir',
      rating: 3.5,
      harga: 'Rp. 10.000'),
  Jamu(
      imageAssets: 'assets/image_berasKencur.jpg',
      nama: 'Beras Kencur',
      deskripsi: 'Beras kencur adalah minuman penyegar khas Jawa. Minuman ini juga digolongkan sebagai jamu karena memiliki khasiat meningkatkan nafsu makan. Beras kencur sangat populer karena memiliki rasa yang manis dan segar.',
      bahan: 'beras, kencur, jahe, gula aren, gula pasir, garam, daun pandan',
      rating: 4,
      harga: 'Rp.5.000')
];
