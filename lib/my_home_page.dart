import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = 'default';

  Future<String> textFunction1() {
    var value = Completer<String>();
    Future.delayed(const Duration(seconds: 2), () => value.complete('Hello 1'));
    return value.future;
  }

  Future<String> textFunction2() {
    return Future.delayed(const Duration(seconds: 2), () => 'Hello 2');
  }

  Future<String> exceptionFunction() {
    return Future.delayed(const Duration(seconds: 2), throw Exception("Error"));
  }

  onPressed() async {
    // -- C1:
    // text = await textFunction1();
    // setState(() {});

    // -- C2:
    textFunction1().then((value) {
      setState(() {
        text = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //     title: const Text('My Home Page'),
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Center(
    //           child: Text(
    //             text,
    //             style: const TextStyle(fontSize: 30),
    //           ),
    //         ),
    //         Center(
    //           child: ElevatedButton(
    //             onPressed: onPressed,
    //             child: const Text('Click'),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Home Page'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: textFunction2(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  var value = snapshot.data.toString();
                  return Text(value);
                }
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                }
                return const Text('');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
