import 'package:flutter/material.dart';
import 'package:flutter_todolist/widget/custom_checkbox_widget.dart';

class TaskRowWidget extends StatelessWidget {
  final String task;
  // final String date;

  const TaskRowWidget({
    super.key,
    required this.task,
    // required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CustomCheckBox(),
                Text(
                  task,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Text(
            //   date,
            //   style: const TextStyle(
            //     color: Color(0xff65a4a4),
            //   ),
            // ),
          ],
        ),
        // const ColumnDottedDivider(),
      ],
    );
  }
}
