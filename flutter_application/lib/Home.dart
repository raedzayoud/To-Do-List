import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'utiles/Todolist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Learn Flutter', false],
    ['Drink Coffee', false],
  ];
  void AddToDo() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void DeleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Simple Todo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Todolist(
                  taskName: toDoList[index][0],
                  completed: toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(index),
                  deleteFunction: (context)=>DeleteTask(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    //  maxLength: 30,
                    decoration: InputDecoration(
                      hintText: "Add New Task",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    AddToDo();
                  },
                  child: const Icon(Icons.add),
                  backgroundColor: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
