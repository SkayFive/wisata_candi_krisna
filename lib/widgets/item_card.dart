import 'package:flutter/material.dart';
import 'package:wisata_candi_krisna/models/candi.dart';
import 'package:wisata_candi_krisna/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  //TODO: 1.Deklarasikan variabel yang di butuhkan dan pasang pada konstarktor
  final Candi candi;

  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    //TODO: 6.Implementasi routingke DetailScreen
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(candi: candi)),
        );
      },
      child: Card(
        //TODO: 2 Tetapkan parmeter shape, margin, dan Elevation dari cari
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: 3.Buat Image sebagai anak dari column
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4),

            //TODO: 4.Buat text sebagai anak dari culumn
            Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: Text(
                candi.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 4),

            //TODO: 5.Buat Text sebagai anak dari column
            Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: Text(candi.type, style: TextStyle(fontSize: 12)),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
