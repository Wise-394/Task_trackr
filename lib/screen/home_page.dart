import 'package:flutter/material.dart';
import 'package:task_trackr/util/to_do_tile.dart';
import 'package:task_trackr/util/task_dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_trackr/database/dbcode.dart';
import 'package:task_trackr/database/task_entity.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Text controller
  final _controller = TextEditingController();

  bool isEditing = false;
  int editedTaskIndex = -1;
  String searchQuery = '';

  void editTask() {
    setState(() {
      isEditing = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogToDo(
          controller: _controller,
          onSave: updateTask,
          onCancel: () {
            setState(() {
              isEditing = false;
            });
            Navigator.of(context).pop();
          },
          initialText: db.toDoList[editedTaskIndex].taskName,
        );
      },
    );
  }

  void updateTask() {
    setState(() {
      db.toDoList[editedTaskIndex].taskName = _controller.text;
      isEditing = false;
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateDB();
  }

  // Init db
  final _myBox = Hive.box('mybox');
  ToDoDB db = ToDoDB();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.initDB();
    } else {
      db.loadDB();
    }
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void checkBoxChanged(bool? value, int index, int tabIndex) {
    setState(() {
      if (tabIndex == 0) {
        db.toDoList[index].checkMark = !db.toDoList[index].checkMark;
      } else if (tabIndex == 1) {
        final uncompletedTasks = db.getUncompletedTasks();
        uncompletedTasks[index].checkMark = !uncompletedTasks[index].checkMark;
      } else if (tabIndex == 2) {
        final completedTasks = db.getCompletedTasks();
        completedTasks[index].checkMark = !completedTasks[index].checkMark;
      }
    });
    db.updateDB();
  }

  void createNewTask() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return DialogToDo(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.toDoList
            .add(TaskEntity(taskName: _controller.text, checkMark: false));
      }
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateDB();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDB();
  }

  void onReorder(int oldIndex, int newIndex, int tabIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      if (tabIndex == 0) {
        final task = db.toDoList.removeAt(oldIndex);
        db.toDoList.insert(newIndex, task);
      } else if (tabIndex == 1) {
        final uncompletedTasks = db.getUncompletedTasks();
        final task = uncompletedTasks.removeAt(oldIndex);
        uncompletedTasks.insert(newIndex, task);
      } else if (tabIndex == 2) {
        final completedTasks = db.getCompletedTasks();
        final task = completedTasks.removeAt(oldIndex);
        completedTasks.insert(newIndex, task);
      }
    });
    db.updateDB();
  }

  void viewTask() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return DialogToDo(
          controller: _controller,
          onSave: updateTask,
          onCancel: () => Navigator.of(context).pop(),
          initialText: db.toDoList[editedTaskIndex].taskName,
        );
      },
    );
  }

  List<TaskEntity> getFilteredTasks() {
    if (searchQuery.isEmpty) {
      return db.toDoList;
    } else {
      return db.toDoList
          .where((task) =>
              task.taskName.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    int uncompletedCount = db.getUncompleteTask();
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Welcome!",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        uncompletedCount != 0
                            ? "You have $uncompletedCount incomplete tasks today"
                            : "You currently have no tasks to complete!",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              labelColor: Theme.of(context).colorScheme.secondary,
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(text: 'Incomplete'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Scaffold(
                    body: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Search task',
                              prefixIcon: Icon(Icons.search),
                            ),
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: ReorderableListView.builder(
                            onReorder: (oldIndex, newIndex) =>
                                onReorder(oldIndex, newIndex, 0),
                            itemCount: getFilteredTasks().length,
                            itemBuilder: (context, index) {
                              final task = getFilteredTasks()[index];
                              return ToDoTile(
                                key: Key('$index'),
                                taskName: task.taskName,
                                onChanged: (value) =>
                                    checkBoxChanged(value, index, 0),
                                taskCompleted: task.checkMark,
                                deleteFunction: () => deleteTask(index),
                                editTask: () {
                                  setState(() {
                                    editedTaskIndex = index;
                                  });
                                  viewTask();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Incomplete Tab
                  Scaffold(
                    body: ReorderableListView.builder(
                      onReorder: (oldIndex, newIndex) =>
                          onReorder(oldIndex, newIndex, 1),
                      itemCount: db.getUncompletedTasks().length,
                      itemBuilder: (context, index) {
                        final task = db.getUncompletedTasks()[index];
                        return ToDoTile(
                          key: Key('$index'),
                          taskName: task.taskName,
                          onChanged: (value) =>
                              checkBoxChanged(value, index, 1),
                          taskCompleted: task.checkMark,
                          deleteFunction: () => deleteTask(index),
                          editTask: () {
                            setState(() {
                              editedTaskIndex = index;
                            });
                            viewTask();
                          },
                        );
                      },
                    ),
                  ),
                  // Completed Tab
                  Scaffold(
                    body: ReorderableListView.builder(
                      onReorder: (oldIndex, newIndex) =>
                          onReorder(oldIndex, newIndex, 2),
                      itemCount: db.getCompletedTasks().length,
                      itemBuilder: (context, index) {
                        final task = db.getCompletedTasks()[index];
                        return ToDoTile(
                          key: Key('$index'),
                          taskName: task.taskName,
                          onChanged: (value) =>
                              checkBoxChanged(value, index, 2),
                          taskCompleted: task.checkMark,
                          deleteFunction: () => deleteTask(index),
                          editTask: () {
                            setState(() {
                              editedTaskIndex = index;
                            });
                            viewTask();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: createNewTask,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
