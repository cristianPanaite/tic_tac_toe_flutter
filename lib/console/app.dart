import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tic_tac_toe/utils/utils.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> elements = List<int>.generate(9, (int index) => 0);
  int lastMove = 2;
  bool _done = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.amberAccent,
          ),
          child: Column(
            children: <Widget>[
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
                itemCount: elements.length,
                itemBuilder: (BuildContext context, int index) {
                  return Item(
                    index: index,
                    value: elements[index],
                    onTap: (int move) {
                      if (move == 0 && _done == false) {
                        if (lastMove == 1) {
                          setState(() {
                            elements[index] = 2;
                            lastMove = 2;
                          });
                        } else {
                          setState(() {
                            elements[index] = 1;
                            lastMove = 1;
                          });
                        }
                      }
                      if (isDone(elements) == true) {
                        setState(() {
                          _done = true;
                        });
                      }
                    },
                  );
                },
              ),
              if (_done == true)
                ElevatedButton(
                  onPressed: () {
                    _done = false;
                    setState(() {
                      elements = List<int>.generate(9, (int index) => 0);
                    });
                  },
                  child: const Text('Again!'),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key? key, required this.index, required this.value, required this.onTap}) : super(key: key);

  final int index;
  final int value;
  final void Function(int move) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(color: value == 0 ? Colors.white60 : (value == 1 ? Colors.green : Colors.red)),
      ),
    );
  }
}
