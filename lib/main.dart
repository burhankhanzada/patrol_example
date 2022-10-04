import 'package:flutter/material.dart';

typedef K = Keys;

class Keys {
  const Keys();

  static const card0 = Key('Card0');
  static const card1 = Key('Card1');
  static const card2 = Key('Card2');
  static const card3 = Key('Card3');

  static const keyList = [card0, card1, card2, card3];
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: List.generate(
          4,
          (index) => AnimatedCard(
            key: K.keyList[index],
            index: index,
          ),
        ),
      ),
    );
  }
}

class AnimatedCard extends StatelessWidget {
  const AnimatedCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: -100, end: 0),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value, 0),
            child: child,
          );
        },
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Card $index'),
              ),
            );
          },
          child: const Card(
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text('Card'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
