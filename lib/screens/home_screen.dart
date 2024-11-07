import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///
  final List<GlobalKey<_ColorChangingContainerState>> containerKeys = <GlobalKey<_ColorChangingContainerState>>[
    GlobalKey<_ColorChangingContainerState>(),
    GlobalKey<_ColorChangingContainerState>(),
    GlobalKey<_ColorChangingContainerState>(),
    GlobalKey<_ColorChangingContainerState>(),
    GlobalKey<_ColorChangingContainerState>(),
  ];

  ///
  void changeContainerColor(int index) {
    containerKeys[index].currentState?.changeColor();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Container Color with Key')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: containerKeys.length,
              itemBuilder: (BuildContext context, int index) {
                return ColorChangingContainer(key: containerKeys[index]);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 例えば、インデックス1のContainerの色を変更
              changeContainerColor(1);
            },
            child: const Text('Change Color of Container 1'),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////

class ColorChangingContainer extends StatefulWidget {
  const ColorChangingContainer({super.key});

  @override
  State<ColorChangingContainer> createState() => _ColorChangingContainerState();
}

class _ColorChangingContainerState extends State<ColorChangingContainer> {
  Color _color = Colors.grey;

  ///
  void changeColor() {
    setState(() {
      _color = (_color == Colors.grey) ? Colors.blue : Colors.grey;
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: _color,
      child: const Center(
        child: Text('Container', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
