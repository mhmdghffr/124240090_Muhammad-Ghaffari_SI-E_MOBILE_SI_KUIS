import 'package:flutter/material.dart';
import 'stationery_item.dart';

class DetailPage extends StatefulWidget {
  final StationeryItem item;

  const DetailPage({
    super.key,
    required this.item,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late TextEditingController deskripsiController;
  late TextEditingController stokController;
  late TextEditingController hargaController;

  @override
  void initState() {
    super.initState();

    deskripsiController = TextEditingController(
      text: widget.item.description,
    );

    stokController = TextEditingController(
      text: widget.item.stock.toString(),
    );

    hargaController = TextEditingController(
      text: widget.item.price.toString(),
    );
  }

  @override
  void dispose() {
    deskripsiController.dispose();
    stokController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  void simpanData() {
    setState(() {
      widget.item.description = deskripsiController.text;
      widget.item.stock = int.parse(stokController.text);
      widget.item.price = int.parse(hargaController.text);
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Barang'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Image.network(
              widget.item.imageUrl,
              height: 180,
            ),

            const SizedBox(height: 15),

            Text(
              widget.item.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: deskripsiController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 15),

            TextField(
              controller: stokController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Stok',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Harga',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: simpanData,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}