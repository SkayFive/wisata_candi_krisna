import 'package:flutter/material.dart';
import 'package:wisata_candi_krisna/data/candi_data.dart';
import 'package:wisata_candi_krisna/models/candi.dart';
import 'package:wisata_candi_krisna/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 1 : Buat appBar dengan judul Wisata Candi
      appBar: AppBar(title: Text('Wisata Candi')),

      //TODO 2 : Buat body dengan gridview builder
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: candiList.length,
        itemBuilder: (context, index) {
          Candi candi = candiList[index];
          //TODO 3 : Buat itemCard sebagai return value dari gridview builder
          return ItemCard(candi: candi);
        },
      ),
    );
  }
}
