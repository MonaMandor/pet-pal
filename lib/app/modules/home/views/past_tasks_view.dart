import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/global_widgets/bottom_sheet.dart';
import '../../../core/global_widgets/expandable_container.dart';
import '../controllers/home_controller.dart';
import '../../../theme/text_theme.dart';

class PastTasksView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).scaffoldBackgroundColor,
    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Text(
                'Past Tasks',
                style: kSubHeadTextStyle.copyWith(
                    color: Theme.of(context).primaryColorDark),
              ),
            ),
            SizedBox(height: Get.height * 0.012),
            GetBuilder<HomeController>(
              id: 1,
              builder: (controller) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final task = controller.pastTasks[index]!;
                      return Slidable(
                        
                        child: ExpandedContainer(
                          icon: task.taskImage,
                          title: task.taskTitle,
                          time: task.startTime,
                          desc: task.taskDesc,
                          ifDate: true,
                          date: DateFormat.yMMMd().format(task.taskDate!),
                        ),
                        
                        startActionPane: ActionPane(
                          motion: BehindMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                
                                Slidable.of(context)?.close();
                                controller.preUpdateTask(task);
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return BottomSheetContent(
                                      buttonText: 'Update Task',
                                      onSubmit: () {
                                        controller.updateTask(task);
                                      },
                                    );
                                  },
                                );
                              },
                              icon: Icons.edit,
                              label: "Update",
                            ),
                          ],
                        ),
                       
                      );
                    },
                    itemCount: controller.pastTasks.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
