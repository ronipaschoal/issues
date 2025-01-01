import 'package:flutter/material.dart';
import 'package:issues/utils/shimmer/shimmer_loading.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;

  const ShimmerBox({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withAlpha(80),
          borderRadius: borderRadius,
          border: Border.all(
            width: 2.0,
            color: Theme.of(context).colorScheme.primary.withAlpha(20),
          ),
        ),
      ),
    );
  }
}
