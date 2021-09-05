import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_animation_design_i/screens/screens.dart';
import '/constants/constants.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: CustomColors.scaffoldBackground,
      ),
      home: NavScreen(),
    );
  }
}

/// Library Screen
class NavScreen extends StatefulWidget {
  NavScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with TickerProviderStateMixin {
  late PageController pageController;
  late AnimationController controller;
  int currentPage = 0;
  double offset = 0.0;
  double page = 0.0;

  @override
  void initState() {
    pageController = PageController()
      ..addListener(() {
        page = pageController.page ?? 0.0;
        offset = pageController.offset;
        setState(() {});
      });
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _buildTopSide(size),
          _buildBottomSide(size),
          Positioned(
            top: 300.0,
            left: 0.0,
            right: 0.0,
            bottom: 100.0,
            child: PageView(
              controller: pageController,
              onPageChanged: (page) {
                currentPage = page;
                setState(() {});
              },
              children: [
                Transform.translate(
                  offset: Offset(offset, 0.0),
                  child: Opacity(opacity: 1 - page, child: LoginScreen()),
                ),
                Transform.translate(
                  offset: Offset(
                      -MediaQuery.of(context).size.width * (1 - page), 0.0),
                  child: Opacity(opacity: page, child: RegisterScreen()),
                ),
              ],
            ),
          ),
          _buildButton(size),
        ],
      ),
    );
  }

  Positioned _buildTopSide(Size size) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        width: size.width,
        height: size.height * .4,
        decoration: BoxDecoration(color: Colors.transparent),
        child: CustomPaint(
          painter: TopPaint(controller.view, context),
        ),
      ),
    );
  }

  Positioned _buildBottomSide(Size size) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Transform.rotate(
        angle: pi,
        child: Container(
          width: size.width,
          height: size.height * .4,
          decoration: BoxDecoration(color: Colors.transparent),
          child: CustomPaint(
            painter: TopPaint(controller.view, context),
          ),
        ),
      ),
    );
  }

  Positioned _buildButton(Size size) {
    return Positioned(
      bottom: size.height * .15,
      left: 0.0,
      child: GestureDetector(
        onTap: () async {
          if (currentPage == 0) {
            pageController.animateToPage(
              1,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
            await controller.forward();
            await controller.reverse();
          } else if (currentPage == 1) {
            pageController.animateToPage(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
            await controller.forward();
            await controller.reverse();
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(60.0),
              bottomRight: Radius.circular(60.0),
            ),
          ),
          child: Center(
            child: Text(
              currentPage == 0 ? 'Register' : 'Login Screen',
              style: TextStyle(
                color: Color(0xffa5499c),
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopPaint extends CustomPainter {
  TopPaint(this.animation, BuildContext context)
      : topPaint = Paint()
          ..color = CustomColors.secondColor
          ..style = PaintingStyle.fill,
        super(repaint: animation);
  final Animation animation;
  final Paint topPaint;
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Path path = new Path();
    path.moveTo(0.0, height);
    path.lineTo(0.0, 0.0);
    path.lineTo(width, 0.0);
    path.quadraticBezierTo(
      width + 10,
      height * .1 + 2 * height * animation.value,
      width * .9 + 2 * width * animation.value,
      height * .1 + 2 * height * animation.value,
    );
    path.quadraticBezierTo(
      width / 2 + 2 * width * animation.value,
      height * .05 + 2 * height * animation.value,
      width / 3 + 2 * width * animation.value,
      height * .5 + 2 * height * animation.value,
    );
    path.quadraticBezierTo(
      width / 5 + 2 * width * animation.value,
      height + 2 * height * animation.value,
      -20.0,
      height + 2 * height * animation.value,
    );
    canvas.drawPath(path, topPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
