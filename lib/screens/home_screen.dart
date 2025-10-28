import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo_web/services/hive_service.dart';
import 'package:hive_todo_web/widgets/todo_input.dart';
import 'package:hive_todo_web/widgets/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = HiveService.getBox();

    return Scaffold(
      appBar: AppBar(title: const Text('Hive To-Do')),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box box, _) {
          final todos = box.values.toList();
          if (todos.isEmpty) {
            return const Center(child: Text('No tasks yet!'));
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return TodoTile(
                task: todos[index],
                onDelete: () => HiveService.deleteTodo(index),
              );
            },
          );
        },
      ),
      floatingActionButton: const TodoInput(),
    );
  }
}
