import 'package:flutter/material.dart';
import 'package:issues/utils/shimmer/shimmer_scaffold_base.dart';

class ShimmerLoading extends StatefulWidget {
  final Widget child;

  const ShimmerLoading({
    super.key,
    required this.child,
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;
  void _onShimmerChange() => setState(() {});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = ShimmerScaffoldBase.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shimmer = ShimmerScaffoldBase.of(context)!;
    if (!shimmer.isSized) return const SizedBox();

    final offsetWithinShimmer = context.findRenderObject() == null
        ? const Offset(0.0, 0.0)
        : shimmer.getDescendantOffset(
            descendant: context.findRenderObject() as RenderBox,
          );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (_) {
        return shimmer.gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmer.size.width,
            shimmer.size.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}
