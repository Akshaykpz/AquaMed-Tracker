import 'package:flutter/material.dart';

import '../../models/category/data_base.dart';

import 'goal_picker.dart';

class ShowGoalEdit extends StatelessWidget {
  const ShowGoalEdit({super.key});

  Future<void> showEditDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                    ),
                    onPressed: () async {
                      WaterGoal.getdata();

                      Navigator.pop(context);
                    },
                    child: const Text('Done')),
              ),
            ],
            content: const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SizedBox(
                  width: 350, height: 200, child: Center(child: GoalPicker())),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.edit,
        color: Color.fromARGB(255, 71, 10, 151),
      ),
      title: const Text('Edit your goals'),
      onTap: () {
        showEditDialog(context);
      },
    );
  }
}
