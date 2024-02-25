import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AnimatedLoading extends StatelessWidget {
  final double? topPadding;
  const AnimatedLoading({this.topPadding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: topPadding ?? size.height / 4,
      ),
      LoadingAnimationWidget.staggeredDotsWave(
          color: AppColors.slate500, 
          size: size.height * 0.1,
        ),
      ],
    );
  }
}
