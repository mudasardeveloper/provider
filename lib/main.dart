import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ValueNotifier<int>>(
      create: (context) => ValueNotifier<int>(0),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<ValueNotifier>(context, listen: false);
    return Scaffold(
      body: Consumer<ValueNotifier<int>>(builder: (context, value, child) {
        return Text(value.toString());
      }),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              value.value++;
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              value.value--;
            },
            child: const Icon(Icons.minor_crash_outlined),
          ),
        ],
      ),
    );
  }
}
