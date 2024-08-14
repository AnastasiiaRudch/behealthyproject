import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final VoidCallback onToggle;

  const TaskCard({
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
          leading: Transform.scale(
            scale: 1.5, // Increasing checkbox size
            child: Checkbox(
              shape: const CircleBorder(), // Circle checkbox
              value: isDone,
              onChanged: (bool? value) {
                onToggle();
              },
              checkColor: Colors.grey.shade200,
              activeColor: Colors.indigo.shade400, //Checkbox background color when selected
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
