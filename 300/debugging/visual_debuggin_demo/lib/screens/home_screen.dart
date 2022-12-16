import 'package:flutter/material.dart';
import 'package:debugging_demo/screen_arguments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String imagePath = 'assets/food.jpg';
    const String title = 'Salad';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Hero(
                  tag: 'imageHero',
                  child: Image.asset(
                    imagePath,
                    cacheHeight: 262,
                    cacheWidth: 393,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Vegan salad bowl')
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/detail-screen',
                      arguments: ScreenArguments(
                        title,
                        imagePath,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.chevron_right_rounded,
                    size: 50,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
