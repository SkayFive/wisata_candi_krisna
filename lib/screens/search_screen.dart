import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:wisata_candi_krisna/data/candi_data.dart';
import 'package:wisata_candi_krisna/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //TODO 1 :Deklarasikan Variabel yang di butuhkan
  List<Candi> _filteredCandis = candiList;
  String _Searchquery = '';
  final TextEditingController _searchController = TextEditingController();

  //Logic Fitur Pencarian
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _Searchquery = _searchController.text.toLowerCase();
      _filteredCandis = candiList
          .where(
            (candi) =>
                candi.name.toLowerCase().contains(_Searchquery) ||
                candi.location.toLowerCase().contains(_Searchquery),
          )
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 2 : Buat appBar dengan judul pencarian data
      appBar: AppBar(title: Text('Pencarian Candi')),

      //TODO 3 :Buat  body berupa column
      body: Column(
        children: [
          //TODO 4 : Buat TextField  Pencarian sebagai anak dari column
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromRGBO(237, 231, 246, 1),
              ),
              child: TextField(
                // decoration: InputDecoration(
                //   hintText: 'Cari Candi...',
                //   prefixIcon: Icon(Icons.search),
                //   border: InputBorder.none,
                //   focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.deepPurple),
                //   ),
                //   contentPadding: EdgeInsets.symmetric(
                //     horizontal: 16,
                //     vertical: 12,
                //   ),
                // ),
                autofocus: false,

                //TODO 6 :Implementasi fitur pencarian
                controller: _searchController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.deepPurple)
                  ),
                  hintText: 'Cari Candi..',
                  prefixIcon: Icon(Icons.search,),

                  //TODO 7 : Implementasikan pengosongan Input
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          //TODO 5 : Buat listView hasil pencarian sebagai anak dari column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];

                //.TODO 8 : Implementasi GesturDetector dan hera Animation

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 100,
                        height: 100,

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            candi.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(candi.name, style: TextStyle(fontSize: 16)),
                            SizedBox(height: 4),
                            Text(
                              candi.location,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
