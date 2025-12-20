import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String imagePath;
  final Widget child;
  final BoxFit fit;
  final Color? overlayColor;

  const BackgroundImage({
    super.key,
    required this.imagePath,
    required this.child,
    this.fit = BoxFit.cover,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: fit,
          colorFilter: overlayColor != null
              ? ColorFilter.mode(
                  overlayColor!,
                  BlendMode.darken,
                )
              : null,
        ),
      ),
      child: child,
    );
  }
}
