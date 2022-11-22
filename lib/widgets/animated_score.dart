import 'package:flutter/material.dart';

class DisplayScore extends StatefulWidget {
  final int displayScore;
  const DisplayScore(this.displayScore, {Key? key}) : super(key: key);

  @override
  State<DisplayScore> createState() => _DisplayScoreState();
}

class _DisplayScoreState extends State<DisplayScore>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = IntTween(begin: 0, end: widget.displayScore).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Text(
          animation.value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontFamily: 'ConcertOne',
          ),
        );
      },
    );
  }
}
