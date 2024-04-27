import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ImageNet extends StatelessWidget {
  final String src;
  final double height, width;

  const ImageNet({
    super.key,
    required this.src,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: height,
      width: width,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (frame != null) return child;
        return SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: width,
            height: height,
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Placeholder();
      },
    );
  }
}
