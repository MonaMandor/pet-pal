import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_pal/app/core/constansts/context_extensions.dart';
import '../../../core/global_widgets/decorated_Container.dart';
import '../../../core/global_widgets/user_avatar.dart';
import '../controllers/home_controller.dart';
import 'all_tasks_view.dart';
import '../../profile/views/profile_view.dart';
import '../../../theme/text_theme.dart';

class DashboardView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.065),
      height: size.height,
      width: size.width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          GetBuilder<HomeController>(
              id: 7,
              builder: (_) {
                return Container(
                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                height: size.height * 0.18,
                width: size.width * 0.90,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [kDefaultShadow],
        ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcom Back, ${controller.userName}',
                        style: kSubHeadTextStyle.copyWith(
                          fontSize: 18,
                            color: Theme.of(context).primaryColorDark),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => ProfileView()),
                        child: UserAvatar(
                          ismale: controller.isMale,
                          radius: size.width * 0.062,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          SizedBox(height: size.height * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Current Task',
                style: kSub2HeadTextStyle.copyWith(
                    color: Theme.of(context).primaryColorDark),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AllTasksView());
                },
                child: Text(
                  'View all tasks',
                  style: kSub2HeadTextStyle.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.038),
          GetBuilder<HomeController>(
              id: 3,
              builder: (_) {
                return controller.isCurrentTaskPresent
                    ? DecoratedContainer(
                        margin: EdgeInsets.only(bottom: 20),
                        color: Theme.of(context).primaryColor.withOpacity(0.85),
                        svgAsset: controller.currentTask!.taskImage,
                        title: controller.currentTask!.taskTitle,
                        time: controller.currentTask!.startTime,
                      )
                    : Center(
                        child: Lottie.asset(
                height: context.propHeight(70),
                width: context.propWidth(70),
                fit: BoxFit.fill,
                'assets/lottie/noData.json',
               
                frameRate: FrameRate(100),
                repeat: true,
               
              ),
                      );
              }),
          SizedBox(height: size.height * 0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Upcoming Task',
                style: kSub2HeadTextStyle.copyWith(
                    color: Theme.of(context).primaryColorDark),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AllTasksView());
                },
                child: Text(
                  'View all tasks',
                  style: kSub2HeadTextStyle.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.038),
          GetBuilder<HomeController>(
              id: 3,
              builder: (_) {
                return controller.isUpcommingTaskPresent
                    ? DecoratedContainer(
                        margin: EdgeInsets.only(bottom: 20),
                        color: Theme.of(context).primaryColor.withOpacity(0.85),
                        svgAsset: controller.upcomingTask!.taskImage,
                        title: controller.upcomingTask!.taskTitle,
                        time: controller.upcomingTask!.startTime,
                      )
                    : Center( //noData
                        child:  Lottie.asset(
                height: context.propHeight(70),
                width: context.propWidth(70),
                fit: BoxFit.fill,
                'assets/lottie/noData.json',
               
                frameRate: FrameRate(100),
                repeat: true,
               
              ),
                      );
              }),
        ],
      ),
    );
  }
}
