import 'package:flutter/material.dart';
import 'package:wisata_candi_krisna/models/candi.dart';

class ItemCard extends StatelessWidget {
  //TODO: 1.Deklarasikan variabel yang di butuhkan dan pasang pada konstarktor
  final Candi candi;

  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    //TODO: 6.Implementasi routingke DetailScreen
    return Card(
      //TODO: 2. Tetapkan parameter shape, margin, dan elevation dari Cari
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO: 3. Buat Image sebagai anak dari column
          Expanded(
            //TODO: 7.Implementasi Hero animation
            child: ClipRRect(
              child: Image.asset(
                candi.imageAsset,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //TODO: 4. Buat Text sebagai anak dari column
          Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Text(
              candi.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          //TODO:5. Buat Text sebagai anak dari column
          Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Text(candi.type, style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
