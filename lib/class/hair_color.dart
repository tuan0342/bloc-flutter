import 'package:flutter/material.dart';

class FamilyProvider extends InheritedWidget {
  final String? colorOfHair;
  const FamilyProvider({super.key, required Widget child, this.colorOfHair})
      : super(child: child);

  static FamilyProvider? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FamilyProvider>();

  static FamilyProvider of(BuildContext context) {
    final FamilyProvider? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FamilyProvider oldWidget) {
    // Dữ liệu mới khác dữ liệu cũ thì mới render lại các widget liên quan
    return colorOfHair != oldWidget.colorOfHair;
  }
}
