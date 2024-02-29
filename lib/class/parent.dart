import 'package:bloc_app/class/hair_color.dart';
import 'package:flutter/material.dart';

// Cách cách quăng data từ cha xuống con:
// - C1: Passing state down (Truyền qua constructer): truyền từ cha -> con -> con của con
// - C2: InheritedWidget

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FamilyProvider(child: ChildWidget()),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final familyProvider =
    //     context.dependOnInheritedWidgetOfExactType<FamilyProvider>();
    final familyProvider = FamilyProvider.of(context);

    final String? colorOfHair = familyProvider.colorOfHair;

    return colorOfHair == null
        ? const CircularProgressIndicator()
        : Text(colorOfHair);
  }
}
