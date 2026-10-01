import 'package:flutter/material.dart';
import 'stationery_item.dart';
import 'detail_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int halaman = 0;

  @override
  Widget build(BuildContext context) {
    if (halaman == 1) {
      return const ProfilePage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Alat Tulis'),
      ),

      body: ListView.builder(
        itemCount: StationeryItem.sampleData.length,
        itemBuilder: (context, index) {
          StationeryItem item = StationeryItem.sampleData[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                item.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),

              title: Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                '${item.description}\n'
                'Stok: ${item.stock}\n'
                'Harga: Rp ${item.formattedPrice}',
              ),

              isThreeLine: true,

              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailPage(item: item);
                    },
                  ),
                );

                setState(() {});
              },
            ),
          );
        },
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: halaman,

        onDestinationSelected: (index) {
          setState(() {
            halaman = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),

          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}