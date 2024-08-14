import 'package:flutter/material.dart';

class TaskCardCheckbox extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final VoidCallback onToggle;

  const TaskCardCheckbox({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 30, // Size of circle
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2), // Circle border color and thickness
              ),
              child: Center(
                child: Icon(
                  isDone ? Icons.check : Icons.check_box_outline_blank,
                  size: 15, // Size of tick inside circle
                  color: isDone ? Colors.black : Colors.transparent,
                ),
              ),
            ),
          ),
          title: Text(
            taskName,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : null, // Strikethrough text for completed tasks
            ),
          ),
        ),
      ),
    );
  }
}
