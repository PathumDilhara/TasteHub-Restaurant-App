import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tastehub/core/router/router_paths.dart';
import 'package:tastehub/core/utils/colors.dart';
import 'package:tastehub/core/utils/constants.dart';
import 'package:tastehub/core/widgets/custom_button.dart';
import 'package:tastehub/features/auth/widgets/text_input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _onLogin() {
    // print("on login");

    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      emailController.clear();
      passwordController.clear();

      GoRouter.of(context).push("/${RouterPaths.explore}");
      // print("Email : $email , Password : $password");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primMain,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // top bar
          Expanded(flex: 2, child: _buildAppInfoSection()),

          // login card
          Expanded(flex: 4, child: _buildLoginCard()),
        ],
      ),
    );
  }

  // =============================== WIDGETS ===================================

  Widget _buildAppInfoSection() {
    return Padding(
      padding: const EdgeInsets.only(
        left: kMainPadding,
        right: kMainPadding,
        top: kMainPadding * 3,
        bottom: kMainPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/tastehub.png",
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          Text(
            "Delicious food,\ndelivered with love",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: AppColors.primWhite,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10,),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Order | Eat | Enjoy",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                color: AppColors.primWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginCard() {
    return Stack(
      children: [
        Positioned(
          left: 8,
          right: 8,
          top: 0,
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kCardBR),
              color: AppColors.primWhite.withValues(alpha: 0.3),
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          top: 20,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.only(
              left: kMainPadding,
              right: kMainPadding,
              top: kMainPadding * 2,
              bottom: kMainPadding,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColors.primWhite.withValues(alpha: 0.3),
              //     offset: Offset(0, -10),
              //     blurRadius: 1,
              //     spreadRadius: 10,
              //     blurStyle: BlurStyle.inner
              //   ),
              // ],
            ),
            child: Column(
              children: [
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 5),
                Text(
                  "Enter you detail below",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.primLightGrey,
                  ),
                ),
                SizedBox(height: 50),

                _buildLoginForm(),
                SizedBox(height: 20),

                customButton(
                  context: context,
                  title: "Log In",
                  bgColor: AppColors.primMain,
                  titleColor: AppColors.primWhite,
                  height: 50,
                  width: double.infinity,
                  onTap: () {
                    _onLogin();
                  },
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.primDark,
                      ),
                    ),
                    SizedBox(width: 10),

                    TextButton(
                      child: Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.primMain,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.primLightGrey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or sign in with",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.primLightGrey,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.primLightGrey)),
                  ],
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildOtherSignInOptionCard(
                      "assets/icons/google.png",
                      "Google",
                    ),
                    _buildOtherSignInOptionCard(
                      "assets/icons/fb.png",
                      "Facebook",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          textInputFieldWidget(
            context: context,
            controller: emailController,
            hintText: "Email Address",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please enter your email";
              }

              final emailRegex = RegExp(
                r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
              );
              if (!emailRegex.hasMatch(value.trim())) {
                return "Please enter valid email address";
              }

              return null;
            },
          ),
          SizedBox(height: 30),
          textInputFieldWidget(
            context: context,
            controller: passwordController,
            hintText: "Password",
            isObscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Password can not be empty";
              }

              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOtherSignInOptionCard(String icon, String title) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: 60,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primWhite,
        border: Border.all(color: AppColors.primLightGrey),
        borderRadius: BorderRadius.circular(kButtonBR),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon),
          SizedBox(width: 10),
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
