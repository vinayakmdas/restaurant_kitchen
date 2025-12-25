import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String imagePath;
  final Widget child;
  final BoxFit fit;
  final Gradient? gradient;

  const BackgroundImage({
    super.key,
    required this.imagePath,
    required this.child,
    this.fit = BoxFit.cover,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand( 
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: fit,
            width: double.infinity,
            height: double.infinity,
          ),

         
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: gradient ??
                  const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                  ),
            ),
          ),

          // 3️⃣ Screen Content
          child,
        ],
      ),
    );
  }
}
