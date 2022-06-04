import 'package:flutter/material.dart';

const kAnimationDurationFavourite = Duration(milliseconds: 1000);

class ExplicitAnimationFavouriteIconButton extends StatefulWidget {
  const ExplicitAnimationFavouriteIconButton({Key? key}) : super(key: key);

  @override
  _ExplicitAnimationFavouriteIconButtonState createState() =>
      _ExplicitAnimationFavouriteIconButtonState();
}

class _ExplicitAnimationFavouriteIconButtonState
    extends State<ExplicitAnimationFavouriteIconButton>
    with TickerProviderStateMixin {
  // State
  bool isAnimationComplete = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: kAnimationDurationFavourite,
    );

    _colorAnimation = ColorTween(begin: Colors.grey[500], end: Colors.red)
        .animate(_controller.view);

    _sizeAnimation =
        Tween<double>(begin: 32, end: 56).animate(_controller.view);

    _controller.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, _) => IconButton(
        onPressed: () {
          // if (isAnimationComplete) {
          //   _controller.reverse();
          // } else {
          //   _controller.forward();
          // }
          _controller.repeat(reverse: true);
        },
        icon: Icon(
          Icons.favorite,
          size: _sizeAnimation.value,
          color: _colorAnimation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
