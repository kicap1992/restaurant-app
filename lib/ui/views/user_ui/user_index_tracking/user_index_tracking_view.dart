import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../app/app.router.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import 'user_index_tracking_view_model.dart';

class UserIndexTrackingView extends StatelessWidget {
  const UserIndexTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserIndexTrackingViewModel>.reactive(
      viewModelBuilder: () => UserIndexTrackingViewModel(),
      onViewModelReady: (UserIndexTrackingViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        UserIndexTrackingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: backgroundColor,
          extendBody: false,
          body: ExtendedNavigator(
            navigatorKey: StackedService.nestedNavigationKey(3),
            router: UserIndexTrackingViewRouter(),
            observers: [
              StackedService.routeObserver,
            ],
          ),
          bottomNavigationBar: StylishBottomBar(
            items: [
              for (var item in model.bottomNavBarList)
                BottomBarItem(
                  icon: Icon(item['icon'],
                      color: model.currentIndex ==
                              model.bottomNavBarList.indexOf(item)
                          ? sixthGrey
                          : backgroundColor),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['name'],
                      style: regularTextStyle.copyWith(
                        color: model.currentIndex ==
                                model.bottomNavBarList.indexOf(item)
                            ? sixthGrey
                            : Colors.grey,
                      ),
                    ),
                  ),
                  backgroundColor:
                      model.currentIndex == model.bottomNavBarList.indexOf(item)
                          ? Colors.white
                          : Colors.grey,
                ),
            ],
            currentIndex: model.currentIndex,
            hasNotch: true,
            backgroundColor: mainColor,
            onTap: (value) {
              model.handleNavigation(value);
            },
            option: BubbleBarOptions(
                barStyle: BubbleBarStyle.horizotnal,
                bubbleFillStyle: BubbleFillStyle.fill,
                opacity: 0.3),
          ),
        );
      },
    );
  }
}
