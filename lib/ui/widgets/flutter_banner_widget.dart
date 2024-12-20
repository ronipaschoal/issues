import 'package:flutter/material.dart';

class FlutterBannerWidget extends StatelessWidget {
  final Widget child;

  const FlutterBannerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Banner(
        location: BannerLocation.topEnd,
        message: 'Flutter',
        color: const Color(0xFF1A73E8),
        child: Center(child: child),
      ),
    );
  }
}
