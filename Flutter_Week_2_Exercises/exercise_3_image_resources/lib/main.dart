import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Carousel()
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/images/avatar1.PNG',
    'assets/images/avatar2.PNG',
    'assets/images/avatar3.png',
    'assets/images/avatar4.PNG',
    'assets/images/avatar5.PNG',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(_images[_currentIndex]),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(onPressed: () {
              setState(() {
                _currentIndex = (_currentIndex - 1) % _images.length;
                if (_currentIndex < 0) {
                  _currentIndex = _images.length - 1;
                }
              });
            }, icon: Icon(Icons.arrow_back), label: Text('Previous')),
            const SizedBox(width: 20),
            ElevatedButton.icon(onPressed: () {
              setState(() {
                _currentIndex = (_currentIndex + 1) % _images.length;
              });
            }, icon: Icon(Icons.arrow_forward), label: Text('Next')),
          ]
        ),
      ],
    );
  }
}