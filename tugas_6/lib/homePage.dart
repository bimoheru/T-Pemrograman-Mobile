import 'package:flutter/material.dart';
import 'package:tugas_6/detailPage.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> travelData;

  const HomePage({super.key, required this.travelData});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('KatalogWisata'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.view_agenda),
                text: 'List View',
              ),
              Tab(
                icon: Icon(Icons.grid_view_rounded),
                text: 'Grid View',
              )
            ]
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(),
            builderGridView()
          ]
          ),
      ),
    );
  }
  Widget buildListView(){
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: travelData.length,
      itemBuilder: (context, index) {
        final item = travelData[index];
        return Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10)
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: ClipRRect(
              child: Image.network(
                item['gambar']!,
                fit: .cover,
                width: 80,
                height: 80,
              ),
            ),
            title: Text(item['nama']!),
            subtitle: Text(item['lokasi']!),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    nama: item['nama']!, 
                    gambar: item['gambar']!,
                    lokasi: item['lokasi']!
                  ),
                )
              );
            },
          ),

        );
      },
    );
  }
  Widget builderGridView(){
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: travelData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1
      ),
      itemBuilder: (context, index){
        final item = travelData[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: .circular(10)
          ),
          clipBehavior: .antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    nama: item['nama']!,
                    gambar: item['gambar']!,
                    lokasi: item['lokasi']!,
                  ),
                ),
              );
            },
            child: Stack(
              fit: .expand,
              children: [
                Image.network(
                  item['gambar']!,
                  fit: .cover,
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Text(
                    item['nama']!,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}