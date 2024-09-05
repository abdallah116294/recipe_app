import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/Features/login/cubit/login_cubit.dart';
import 'package:recipe_app/config/routes/app_routes.dart';
import 'package:recipe_app/core/cach/cach_helper.dart';
import 'package:recipe_app/core/extensions/context_extensions.dart';
import 'package:recipe_app/core/widgets/custom_elevated.dart';
import 'package:recipe_app/core/widgets/custom_text.dart';
import 'package:recipe_app/core/widgets/custom_textfield.dart';
import 'package:recipe_app/core/widgets/show_messgae.dart';
import 'package:recipe_app/injection_container.dart' as di;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginUserSuccess) {
            CacheHelper.saveData(key: 'login_view', value: true).then((value) {
              showMessage(message: 'Login Success', isError: false);
            });
            context.pushName(AppRoutes.recipeScreen);
          } else if (state is LoginUserError) {
            showMessage(message: 'Login Error', isError: true);
            //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Success')));
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: 'Welcome\nback',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      maxLines: 2,
                    )),
                SizedBox(height: 30.h),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hint: "User Name",
                          controller: emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter User Name';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                        ),
                        SizedBox(height: 30.h),
                        CustomTextFormField(
                          hint: "Password",
                          controller: passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Password';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                        ),
                      ],
                    )),
                SizedBox(height: 30.h),
                CustomElevated(
                  text: 'Login',
                  press: () {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<LoginCubit>()
                          .createUser(
                              username: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        context.read<LoginCubit>().loginUser(
                            username: emailController.text,
                            password: passwordController.text);
                      });
                    }
                  },
                  btnColor: const Color(0xff129575),
                  textColor: Colors.white,
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
