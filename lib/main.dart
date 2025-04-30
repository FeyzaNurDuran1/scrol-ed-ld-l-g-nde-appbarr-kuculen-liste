import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tavuk Yemekleri',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const TavukYemekleriPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TavukYemekleriPage extends StatelessWidget {
  const TavukYemekleriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BURAYA KENDİ YEMEKLERİNİ YAZABİLİRSİN
    List<String> yemekler = [
      'Tavuk Şiş',
      'Sebzeli Tavuk Sote',
      'Fırında Tavuk',
      'Kremalı Tavuk',
      'Tavuk Döner',
      'Acılı Tavuk Kanat',
      'Tavuklu Salata',
      'Teriyaki Tavuk',
      'Dağ Kekikli Tavuk Izgara',
      'Sweet Chili Soslu Tavuk',
      'Chicken Mexico',
      'Barbekü Soslu Tavuk',
      'Chicken Fajita',
      'Chicken Mushroom',
      'Schinitzel',
      'Tavuk Cökertme',
      'Chicken Curry',
      // İstediğin kadar ekleyebilirsin
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Tavuk Yemekleri'),
              background: Image.network(
                'https://www.karaca.com/blog/wp-content/uploads/2023/01/tavuk-sotee-1.webp', // Tavuk fotoğrafı
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    yemekler[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.restaurant_menu), // Başına yemek ikonu koyduk
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16), // Sağa ok işareti
                  onTap: () {
                    // Tıklanınca basit snackbar mesajı gösterelim
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${yemekler[index]} seçildi!')),
                    );
                  },
                );
              },
              childCount: yemekler.length,
            ),
          ),
        ],
      ),
    );
  }
}

