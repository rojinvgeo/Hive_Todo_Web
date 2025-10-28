import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String task;
  final VoidCallback onDelete;

  const TodoTile({super.key, required this.task, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(task, style: const TextStyle(fontSize: 18)),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
