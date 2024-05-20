import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Tarik Todo App"),
        backgroundColor: Colors.red,
      ),
      body: TarikTodoApp(),
    ),
  ));
}

class TarikTodoApp extends StatefulWidget {
  const TarikTodoApp({super.key});

  @override
  State<TarikTodoApp> createState() => _TarikTodoAppState();
}

class _TarikTodoAppState extends State<TarikTodoApp> {
  final List<String> _list = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter your todo here",
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    _list.add(_controller.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Todo added")),
                    );
                    _controller.clear();
                  });
                }
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_list[index]),
                trailing: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${_list[index]} deleted")),
                    );
                    setState(() {
                      _list.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
