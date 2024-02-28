import 'package:bloc_app/logic.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Logic logic = Logic();

  // onPressed() {
  //   logic.increase();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    logic.countController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Home Page'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) => logic.addValue(value),
            ),
            Center(
              child: StreamBuilder(
                stream: logic.stream,
                builder: ((context, snapshot) => snapshot.hasData
                    ? Text(snapshot.data.toString())
                    : const CircularProgressIndicator()),
              ),
            ),
            // Center(
            //     child: ElevatedButton(
            //         onPressed: onPressed, child: const Text('Click')))
          ],
        ),
      ),
    );
  }
}
