import 'package:flutter/material.dart';
import 'package:issues/ui/core/theme/ui_theme.dart';
import 'package:issues/utils/shimmer/shimmer_box.dart';
import 'package:issues/utils/shimmer/shimmer_scaffold_base.dart';

/// ![]() TODO image
///
/// This component is an animation library that lets you create custom
/// animations for mobile apps. It is used to create loading animations,
/// screen transitions and other visual effects in mobile apps.
/// The library is easy to use and can be easily integrated into existing projects.
///
/// {@tool snippet}
/// ```
/// ShimmmerScaffold(
///   child: ListView.separated(
///     itemCount: 8,
///     separatorBuilder: (_, __) => const SizedBox(height: 12.0),
///     itemBuilder: (_, __) => Shimmmer.box(height: 80.0),
///   ),
/// );
/// ```
/// {@end-tool}
///
/// See also:
///
/// * [ShimmmerScaffold]
/// * [Shimmmer]
/// * [Shimmmer.box]
///
class ShimmmerScaffold extends ShimmerScaffoldBase {
  /// ![]() TODO image
  ///
  /// This component is an animation library that lets you create custom
  /// animations for mobile apps. It is used to create loading animations,
  /// screen transitions and other visual effects in mobile apps.
  /// The library is easy to use and can be easily integrated into existing projects.
  ///
  /// {@tool snippet}
  /// ```
  /// ShimmmerScaffold(
  ///   child: ListView.separated(
  ///     itemCount: 8,
  ///     separatorBuilder: (_, __) => const SizedBox(height: 12.0),
  ///     itemBuilder: (_, __) => Shimmmer.box(height: 80.0),
  ///   ),
  /// );
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  /// * [ShimmmerScaffold]
  /// * [Shimmmer]
  /// * [Shimmmer.box]
  ///
  const ShimmmerScaffold({
    super.key,
    super.linearGradient,
    required super.child,
  });
}

/// ![]() TODO image
///
/// This component is an animation library that lets you create custom
/// animations for mobile apps. It is used to create loading animations,
/// screen transitions and other visual effects in mobile apps.
/// The library is easy to use and can be easily integrated into existing projects.
///
/// {@tool snippet}
/// ```
/// ShimmmerScaffold(
///   child: ListView.separated(
///     itemCount: 8,
///     separatorBuilder: (_, __) => const SizedBox(height: 12.0),
///     itemBuilder: (_, __) => Shimmmer.box(height: 80.0),
///   ),
/// );
/// ```
/// {@end-tool}
///
/// See also:
///
/// * [ShimmmerScaffold]
/// * [Shimmmer]
/// * [Shimmmer.box]
///
sealed class Shimmmer {
  /// ![]() TODO image
  ///
  /// This component is an animation library that lets you create custom
  /// animations for mobile apps. It is used to create loading animations,
  /// screen transitions and other visual effects in mobile apps.
  /// The library is easy to use and can be easily integrated into existing projects.
  ///
  /// {@tool snippet}
  /// ```
  /// ShimmmerScaffold(
  ///   child: ListView.separated(
  ///     itemCount: 8,
  ///     separatorBuilder: (_, __) => const SizedBox(height: 12.0),
  ///     itemBuilder: (_, __) => Shimmmer.box(height: 80.0),
  ///   ),
  /// );
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  /// * [ShimmmerScaffold]
  /// * [Shimmmer]
  /// * [Shimmmer.box]
  ///
  static Widget box({
    Key? key,
    required double height,
    double width = double.infinity,
    BorderRadiusGeometry borderRadius = UiTheme.borderRadiusMd,
  }) {
    return ShimmerBox(
      key: key,
      height: height,
      width: width,
      borderRadius: borderRadius,
    );
  }
}
