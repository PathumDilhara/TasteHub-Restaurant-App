import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tastehub/core/router/router_paths.dart';
import 'package:tastehub/core/utils/colors.dart';
import 'package:tastehub/core/widgets/custom_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, size: 70, color: Colors.green),
              ),
              SizedBox(height: 30),

              Text(
                "Order Placed Successfully!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 12),

              Text(
                "Your delicious food is being prepared.",
                textAlign: TextAlign.center,

                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.primLightGrey,
                ),
              ),
              SizedBox(height: 40),

              customButton(
                context: context,
                title: "Home",
                titleColor: AppColors.primDark,
                bgColor: AppColors.primMain.withValues(alpha: 0.8),
                onTap: () {
                  GoRouter.of(
                    context,
                  ).pushReplacement('/${RouterPaths.bottomNavigation}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
