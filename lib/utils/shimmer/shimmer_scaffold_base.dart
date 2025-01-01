import 'package:flutter/material.dart';

const _linearGradient = LinearGradient(
  begin: Alignment(-1.6, -0.1),
  end: Alignment(1.6, 0.1),
  colors: [
    Color(0x44434343),
    Color(0xB3C6C6C6),
    Color(0xB3C6C6C6),
    Color(0x44434343),
  ],
  stops: [0.0, 0.4, 0.6, 1.0],
);

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class ShimmerScaffoldBase extends StatefulWidget {
  final LinearGradient linearGradient;
  final Widget child;

  const ShimmerScaffoldBase({
    super.key,
    this.linearGradient = _linearGradient,
    required this.child,
  });

  static ShimmerScaffoldBaseState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerScaffoldBaseState>();
  }

  @override
  ShimmerScaffoldBaseState createState() => ShimmerScaffoldBaseState();
}

class ShimmerScaffoldBaseState extends State<ShimmerScaffoldBase>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform: _SlidingGradientTransform(
          slidePercent: _shimmerController.value,
        ),
      );

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({required RenderBox descendant}) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(Offset.zero, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(seconds: 2),
      );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
