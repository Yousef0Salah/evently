import 'package:evently/core/app_images.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/modules/auth/screens/login_screen.dart';
import 'package:evently/modules/onboarding/model/onbord_model.dart';
import 'package:evently/modules/onboarding/widgets/custom_app_bar.dart';
import 'package:evently/modules/onboarding/widgets/custome_large_button.dart';
import 'package:evently/modules/onboarding/widgets/onboard_widget.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const String id = 'onboarding';
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final List<OnboardModel> onboardList = [
      OnboardModel(
        image: AppImages.onboard1,
        title: localizations!.findEvents,
        subTitle: localizations.findEventsDescription,
      ),
      OnboardModel(
        image: AppImages.onboard2,
        title: localizations.effortlessPlanning,
        subTitle: localizations.effortlessPlanningDescription,
      ),
      OnboardModel(
        image: AppImages.onboard3,
        title: localizations.connectFriends,
        subTitle: localizations.connectFriendsDescription,
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar(controller: controller, currentPage: currentPage),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // const SizedBox(height: 24),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: onboardList.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardWidget(
                      onboard: onboardList[index],
                      currentPageIndex: index,
                      length: onboardList.length,
                    );
                  },
                ),
              ),
              CustomeLargeButton(
                title: currentPage == onboardList.length - 1
                    ? localizations.getStarted
                    : localizations.next,
                onPressed: currentPage == onboardList.length - 1
                    ? () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.id,
                          (route) => false,
                        );
                      }
                    : () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
