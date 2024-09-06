import 'package:flutter/material.dart';
import 'package:recipe_app/config/routes/app_routes.dart';
import 'package:recipe_app/core/cach/cach_helper.dart';
import 'package:recipe_app/core/utils/app_assets.dart';
import 'package:recipe_app/core/widgets/custom_elevated.dart';
import 'package:recipe_app/core/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(AppAssets.splashImage)),
          Positioned(
              top: 85, left: 140, child: Image.asset(AppAssets.capImage)),
          const Positioned(
              top: 200,
              left: 90,
              child: CustomText(
                text: '100K+ Premium Recipe ',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              )),
                const Positioned(
              top: 400,
              left: 90,
              child: CustomText(
                text: 'Get',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 50,
              )),
          const Positioned(
              top: 440,
              left: 90,
              child: CustomText(
                text: 'Cooking',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 50,
              )),
                 const Positioned(
              top: 520,
              right: 30,
              left: 30,
              child: CustomText(
                text: 'Simple way to find Tasty Recipe',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              )),
               Positioned(
              top: 600,
              right: 30,
              left: 30,
              child:CustomElevated(text: 'Start Cooking ', press: (){
                CacheHelper.saveData(key: 'Splash_view', value: true).then((value){
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                });
              }, btnColor: const Color(0xff129575),textColor: Colors.white,)),

        ],
      ),
    );
  }
}
