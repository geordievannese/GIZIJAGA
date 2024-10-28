// artikel.dart
import 'package:flutter/material.dart';

class ArtikelPage extends StatelessWidget {
  const ArtikelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> articles = [
      {
        'title': 'Penurunan Prevalensi Stunting di Indonesia: Target 14% pada 2024',
        'date': '1 Januari 2023',
        'content': 'Pada tahun 2023, Indonesia berhasil menurunkan angka prevalensi stunting dari 24,4% pada 2021 menjadi 21,6% pada 2022, menurut Survei Status Gizi Indonesia (SSGI). Meskipun penurunan ini cukup signifikan, pemerintah, yang dipimpin oleh Presiden Joko Widodo, menargetkan agar angka stunting dapat ditekan hingga mencapai 14% pada tahun 2024. Hal ini bertujuan untuk memperbaiki kualitas hidup anak-anak Indonesia serta mencegah dampak jangka panjang seperti rendahnya kemampuan belajar dan peningkatan risiko penyakit kronis.\n\nProgram penurunan stunting ini mencakup peningkatan akses sanitasi, penyediaan air bersih, serta distribusi makanan yang bernutrisi, khususnya di daerah-daerah dengan angka stunting tinggi. Menteri Kesehatan Budi Gunadi Sadikin menegaskan bahwa keberhasilan program ini membutuhkan kerja sama semua pihak, baik di tingkat pusat maupun daerah, agar prevalensi stunting dapat diturunkan sesuai target. Dengan komitmen bersama ini, diharapkan Indonesia dapat menghasilkan generasi masa depan yang sehat dan produktif.\n\nSelain program-program di atas, pemerintah juga mengadakan edukasi mengenai pentingnya menjaga pola makan seimbang. Edukasi ini melibatkan banyak pihak, termasuk lembaga kesehatan internasional yang turut memberikan dukungan teknis dan finansial untuk membantu Indonesia mencapai target stunting pada 2024. Berbagai kampanye kesehatan ini terus diperluas agar masyarakat di seluruh Indonesia memiliki kesadaran yang lebih tinggi tentang pentingnya gizi pada anak-anak mereka.',
      },
      {
        'title': '1000 Hari Pertama Kehidupan: Kunci Pencegahan Stunting di Indonesia',
        'date': '15 Februari 2023',
        'content': 'Salah satu strategi utama pemerintah dalam mengatasi masalah stunting di Indonesia adalah dengan fokus pada "1000 Hari Pertama Kehidupan" (HPK), yaitu periode sejak kehamilan hingga anak berusia dua tahun. Berdasarkan penelitian, 1000 HPK merupakan periode krusial dalam pembentukan kesehatan fisik dan mental anak. Oleh karena itu, pemerintah menggalakkan intervensi gizi pada masa ini untuk mengurangi risiko stunting.\n\nProgram ini mencakup pemberian suplemen dan makanan tambahan kepada ibu hamil, serta edukasi mengenai pentingnya pemberian ASI eksklusif hingga bayi berusia enam bulan. Setelah itu, pada usia enam bulan ke atas, bayi diperkenalkan pada Makanan Pendamping ASI (MP-ASI) dengan gizi seimbang yang sesuai. Menurut data Kementerian Kesehatan, banyak kasus stunting terjadi karena keterlambatan atau kekurangan nutrisi pada masa MP-ASI ini.\n\nDengan dukungan dari Badan Kependudukan dan Keluarga Berencana Nasional (BKKBN), program ini bertujuan untuk mengurangi prevalensi stunting secara signifikan. Pemerintah berharap bahwa melalui intervensi sejak masa kehamilan, risiko stunting pada anak dapat ditekan, dan generasi mendatang akan tumbuh menjadi individu yang sehat dan berdaya saing tinggi di masa depan.',
      },
      {
        'title': 'Hari Gizi Nasional 2024: Pentingnya Pola Makan Seimbang untuk Cegah Stunting',
        'date': '25 Januari 2024',
        'content': 'Hari Gizi Nasional yang diperingati pada Januari 2024 mengangkat tema pentingnya gizi seimbang bagi seluruh masyarakat Indonesia, khususnya bagi ibu hamil dan anak-anak. Dalam peringatan ini, Kementerian Kesehatan mengajak seluruh lapisan masyarakat untuk meningkatkan kesadaran akan pentingnya gizi dalam mencegah stunting sejak dini. Data terbaru menunjukkan bahwa 18,5% bayi di Indonesia dilahirkan dengan panjang badan kurang dari standar, yang menunjukkan pentingnya pemenuhan gizi selama masa kehamilan.\n\nSelain memperhatikan gizi pada ibu hamil, Hari Gizi Nasional juga menekankan pemberian Makanan Pendamping ASI (MP-ASI) yang tepat dan sesuai bagi bayi usia enam bulan ke atas. Kurangnya gizi pada masa ini dapat menyebabkan anak mengalami kekurangan nutrisi yang berdampak pada pertumbuhan fisik dan mental. Oleh karena itu, pemerintah menyarankan MP-ASI yang sesuai dengan standar dan diikuti dengan pola makan seimbang pada anak-anak usia dini.\n\nProgram ini melibatkan edukasi ke berbagai wilayah yang memiliki prevalensi stunting tinggi. Kampanye kesehatan ini bertujuan agar masyarakat lebih memahami pentingnya pola makan seimbang dan memenuhi asupan gizi sejak awal. Selain itu, pemerintah juga bekerja sama dengan lembaga-lembaga internasional untuk meningkatkan pemahaman masyarakat mengenai pentingnya gizi dalam pembangunan generasi sehat di masa depan.',
      },
      {
        'title': 'BKKBN Fokus pada Intervensi Gizi untuk Mencegah Stunting di Daerah Rentan',
        'date': '10 Maret 2023',
        'content': 'Badan Kependudukan dan Keluarga Berencana Nasional (BKKBN) mengambil langkah khusus untuk mencegah stunting di daerah-daerah yang rentan dengan prevalensi tinggi. Sebagai bagian dari Rencana Pembangunan Jangka Menengah Nasional (RPJMN), BKKBN bekerja sama dengan berbagai kementerian untuk menyediakan fasilitas kesehatan yang dibutuhkan, termasuk penyediaan alat pemantauan gizi dan kesehatan seperti USG untuk ibu hamil di daerah terpencil.\n\nProgram ini menitikberatkan pada pemeriksaan kesehatan dan gizi bagi calon pengantin dan ibu hamil, karena kekurangan nutrisi pada fase ini seringkali menyebabkan risiko stunting yang lebih tinggi pada bayi yang dilahirkan. Edukasi mengenai kesehatan reproduksi dan gizi diberikan kepada pasangan muda untuk memastikan mereka memahami pentingnya menjaga pola makan yang sehat selama kehamilan.\n\nDengan adanya program ini, pemerintah berharap bisa menekan angka stunting di daerah-daerah yang sulit dijangkau dan memiliki tingkat kemiskinan yang tinggi. Keberhasilan program ini juga diukur dari meningkatnya kesadaran masyarakat akan pentingnya kesehatan gizi pada fase awal kehidupan anak-anak.',
      },
      {
        'title': 'Dampak Jangka Panjang Stunting terhadap Perkembangan Anak dan Solusi Pencegahannya',
        'date': '20 April 2023',
        'content': 'Stunting pada anak-anak di Indonesia tidak hanya berdampak pada tinggi badan, tetapi juga memiliki konsekuensi jangka panjang pada perkembangan kognitif dan kesehatan mental anak. Menurut berbagai penelitian, anak yang mengalami stunting berisiko mengalami penurunan kemampuan belajar, rendahnya daya saing di dunia kerja, dan peningkatan risiko penyakit degeneratif di masa dewasa.\n\nPemerintah melalui Kementerian Kesehatan terus mengupayakan berbagai solusi untuk menekan angka stunting, salah satunya adalah memperbaiki akses masyarakat terhadap makanan bergizi dan air bersih. Edukasi mengenai pentingnya gizi yang seimbang juga dilakukan secara intensif, terutama di daerah-daerah yang memiliki angka stunting tinggi. Program pemberian suplemen gizi bagi ibu hamil dan balita pun terus ditingkatkan, dengan harapan dapat membantu mengatasi masalah kekurangan gizi pada anak-anak.\n\nSelain itu, pemerintah bekerja sama dengan berbagai organisasi internasional untuk mendapatkan bantuan teknis dan pendanaan guna mendukung program pengentasan stunting. Dengan adanya dukungan dari berbagai pihak, Indonesia bertekad untuk menciptakan generasi masa depan yang bebas dari stunting dan memiliki kualitas hidup yang lebih baik.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel Kesehatan'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                articles[index]['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(articles[index]['date']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailArtikelPage(
                      title: articles[index]['title']!,
                      date: articles[index]['date']!,
                      content: articles[index]['content']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailArtikelPage extends StatelessWidget {
  final String title;
  final String date;
  final String content;

  const DetailArtikelPage({
    Key? key,
    required this.title,
    required this.date,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}