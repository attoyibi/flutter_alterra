import 'package:flutter/material.dart';
import 'package:debugging_demo/screen_arguments.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: ListView(
        children: [
          Hero(
            tag: 'imageHero',
            child: Image.asset(
              args.imagePath,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              args.title,
              style: const TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Vegan salad bowl adalah makanan untuk kamu seorang vegetarian, dilengkapi dengan berbagai jenis varian buah dan sayuran untuk memenuhi nutrisi harian kamu',
            ),
          ),
          // const SizedBox(
          //   height: 100,
          //   child: Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Cart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
