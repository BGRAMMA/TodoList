import 'package:flutter/material.dart';
import 'package:flutter_todolist/widget/basic_dialog.dart';
import 'package:flutter_todolist/widget/column_dotted_divider_widget.dart';
import 'package:flutter_todolist/widget/task_row_widget.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  // task list
  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // task 추가
    void addTask() {
      if (_controller.text.isNotEmpty) {
        setState(() {
          _tasks.add(_controller.text);
          _controller.clear();
        });
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: '할 일을 입력하세요.',
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: addTask,
              ),
            ),
          ),
        ),
        Expanded(
          // _tasks가 0이 아니면 텍스트 1 이상이면 _tasks구현
          child: _tasks.isEmpty
              ? const Center(
                  child: Text(
                    '아무 일정도 없습니다.',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              // 리스트뷰 구분선
              : ListView.separated(
                  itemCount: _tasks.length,
                  // todo : overflow 해결해야함
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const ColumnDottedDivider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: TaskRowWidget(task: _tasks[index]),
                      onTap: () => basicShowDialog(context, _tasks[index]),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.delete),
                      //   onPressed: () => {
                      //     removeTask(index),
                      //   },
                      // ),
                    );
                  },
                ),
        )
      ],
    );
  }
}
