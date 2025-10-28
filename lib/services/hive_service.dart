import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String todoBoxName = 'todo_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(todoBoxName);
  }

  static Box getBox() => Hive.box(todoBoxName);

  static List getTodos() => getBox().values.toList();

  static void addTodo(String task) {
    if (task.trim().isNotEmpty) {
      getBox().add(task);
    }
  }

  static void deleteTodo(int index) => getBox().deleteAt(index);
}
