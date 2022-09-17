import 'package:flutter/material.dart';

import '../../common/common_widget/neuphormism_animation_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            NeuphormismAnimationButton(),
          ],
        ),
      ),
    );
  }
}
