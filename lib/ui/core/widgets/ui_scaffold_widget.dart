import 'package:flutter/material.dart';
import 'package:issues/domain/models/theme_model.dart';
import 'package:issues/ui/core/widgets/flutter_banner_widget.dart';

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
    final theme = Theme.of(context);

    return FlutterBannerWidget(
      child: Scaffold(
        appBar: title.isEmpty
            ? null
            : AppBar(
                backgroundColor: theme.colorScheme.primary.withAlpha(30),
                surfaceTintColor: Colors.transparent,
                centerTitle: false,
                title: Text(
                  title,
                  style: theme.textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
                systemOverlayStyle: ThemeEnum.values.firstWhere((locale) {
                  return theme.brightness == locale.brightness;
                }).systemUiOverlayStyle,
              ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              stops: const [
                0.1,
                0.2,
                0.7,
              ],
              colors: [
                Theme.of(context).colorScheme.primary.withAlpha(30),
                Theme.of(context).colorScheme.primary.withAlpha(30),
                Theme.of(context).colorScheme.surface.withAlpha(30),
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
