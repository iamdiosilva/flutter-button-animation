import 'package:flutter/material.dart';

class NeuphormismAnimationButton extends StatefulWidget {
  const NeuphormismAnimationButton({Key? key}) : super(key: key);

  @override
  State<NeuphormismAnimationButton> createState() =>
      _NeuphormismAnimationButtonState();
}

class _NeuphormismAnimationButtonState extends State<NeuphormismAnimationButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  double turns = 0;
  bool isClicked = false;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      curve: Curves.easeInOutExpo,
      turns: turns,
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: () {
          if (isClicked) {
            setState(() {
              turns -= 1 / 4;
              _controller.reverse();
            });
          } else {
            setState(() {
              turns += 1 / 4;
              _controller.forward();
            });
          }
          isClicked = !isClicked;
        },
        child: AnimatedContainer(
          curve: Curves.easeInOutExpo,
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 30,
                offset:
                    (isClicked) ? const Offset(20, -20) : const Offset(20, 20),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 30,
                offset: (isClicked)
                    ? const Offset(-20, 20)
                    : const Offset(-20, -20),
              ),
            ],
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _controller,
                color: Colors.grey[600],
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
