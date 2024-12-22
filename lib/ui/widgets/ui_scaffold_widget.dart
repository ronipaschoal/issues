import 'package:flutter/material.dart';
import 'package:issues/ui/widgets/flutter_banner_widget.dart';

class UiScaffoldWidget extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottomNavigationBar;

  const UiScaffoldWidget({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterBannerWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(40),
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
          title: Text(
            title,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.start,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.1,
                0.5,
                0.95,
                1.0,
              ],
              colors: [
                Theme.of(context).colorScheme.primary.withAlpha(40),
                Theme.of(context).colorScheme.surface.withAlpha(30),
                Theme.of(context).colorScheme.surface.withAlpha(30),
                Theme.of(context).colorScheme.primary.withAlpha(20),
              ],
            ),
          ),
          child: SafeArea(child: body),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
