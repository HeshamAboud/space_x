import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x/core/di/dependency_injection.dart';
import 'package:space_x/core/helpers/constants.dart';
import 'package:space_x/core/widgets/bottom_nav_bar.dart';
import 'package:space_x/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:space_x/features/splash_screen/ui/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  final isOnboardingViewed = await checkOnboardingViewed();
  runApp(SpaceApp(isOnboardingViewed: isOnboardingViewed));
}

// View Onboarding screens only once when installed first time
Future<bool> checkOnboardingViewed() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isOnboardingViewed =
      preferences.getBool(Constants.onboardingKey) ?? false;
  return isOnboardingViewed;
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({
    super.key,
    required this.isOnboardingViewed,
  });

  final bool isOnboardingViewed;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 840),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // home: isOnboardingViewed
        //     ? const BottomNavBar()
        //     : const OnboardingScreen(),
      ),
    );
  }
}
