import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/themes/app_theme.dart";

class LoadBar extends StatelessWidget {
  const LoadBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.main_color_1.withOpacity(.25),
      highlightColor: AppTheme.main_color_1.withOpacity(.5),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (_, int i) {
          return Container(
            height: 300,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppTheme.transparent_color,
              borderRadius: AppConstant.borderRadius,
              border: AppConstant.border,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.main_color_1,
                      borderRadius: AppConstant.borderRadius,
                      border: AppConstant.border,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 35,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppTheme.transparent_color,
                    borderRadius: AppConstant.borderRadius,
                    border: AppConstant.border,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.main_color_1,
                      borderRadius: AppConstant.borderRadius,
                      border: AppConstant.border,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppTheme.transparent_color,
                    borderRadius: AppConstant.borderRadius,
                    border: AppConstant.border,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.main_color_1,
                      borderRadius: AppConstant.borderRadius,
                      border: AppConstant.border,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
