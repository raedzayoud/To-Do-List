import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  final String taskName;
  final bool completed;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const Todolist({
    Key? key,
    required this.taskName,
    required this.completed,
    required this.onChanged,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                if (deleteFunction != null) {
                  deleteFunction!(context);
                }
              },
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              Checkbox(
                value: completed,
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
