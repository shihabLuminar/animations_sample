import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool checkValue = false;
  late AnimationController animationController;

  late Animation<double> opacity;
  late Animation<Size> size;
  late Animation<Color?> colorTween;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    opacity = Tween<double>(begin: 0, end: 1).animate(animationController);
    size = Tween<Size>(begin: Size(100, 200), end: Size(200, 100))
        .animate(animationController);
    colorTween = ColorTween(begin: Colors.red, end: Colors.yellow)
        .animate(animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            animationController.repeat();
          },
        ),
        body: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => Center(
            child: Container(
              color: colorTween.value,
              height: size.value.height,
              width: size.value.width,
            ),
          ),
        ));
  }
}
