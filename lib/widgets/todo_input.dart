import 'package:flutter/material.dart';
import 'package:hive_todo_web/services/hive_service.dart';

class TodoInput extends StatefulWidget {
  const TodoInput({super.key});

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    HiveService.addTodo(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Add Task'),
            content: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter task...'),
            ),
            actions: [
              TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
              ElevatedButton(onPressed: () { _addTask(); Navigator.of(context).pop(); }, child: const Text('Add')),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
