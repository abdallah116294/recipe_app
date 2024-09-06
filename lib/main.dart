import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/Features/nav/screen/nav_bar_screen.dart';
import 'package:recipe_app/Features/splash/screens/splash_screen.dart';
import 'package:recipe_app/config/routes/app_routes.dart';
import 'package:recipe_app/core/cach/cach_helper.dart';
import 'package:recipe_app/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await CacheHelper.init();
  bool splashView = CacheHelper.getData(key: 'Splash_view') ?? false;
  bool loginView = CacheHelper.getData(key: 'login_view') ?? false;
  String startWidget(){
    if(splashView==true&&loginView==true){
      return AppRoutes.navbarScreen;
    }else if(loginView==true){
      return AppRoutes.navbarScreen;
    }else{
      return AppRoutes.splashScreen;
    }
  }
  runApp( MyApp(
    startWidget:startWidget(),
  ));
}

class MyApp extends StatelessWidget {
  final String startWidget;
  const MyApp({super.key, required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: startWidget,
          debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
        //  home: const SplashScreen(),
        );
      },
    );
  }
}
