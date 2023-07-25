import 'package:flutter/cupertino.dart';

class MyAnimatedWidget extends StatelessWidget {
   MyAnimatedWidget({required this.child,required this.animation});
  Animation animation;
   Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animation,

      builder: (context, child) => Container(
        child: Opacity(opacity: animation.value, child: child),
      ),
    child: this.child,) ;
  }
}
