import 'package:flutter/cupertino.dart';

import '../core/app_colors.dart';
import 'animated_nav_bar_item.dart';
import 'custom_butttom_app_bar_item.dart';


class CustomBottomAppBar extends StatelessWidget {
  final Color selectedColor;
  final Color unSelectedColor;
  final Function(int index) onTap;
  final List<CustomBottomAppBarItem> children;
  final int selectedTab;
  final bool showTopIndicator;

  const CustomBottomAppBar({
    super.key,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.onTap,
    required this.children,
    required this.selectedTab,
    this.showTopIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.of(context).brightness;
    final backgroundColor = brightness == Brightness.light
        ? AppColors.appBarColorLight
        : AppColors.appBarColorDark;

    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: brightness == Brightness.light
                ? CupertinoColors.black.withOpacity(0.05)
                : CupertinoColors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          children.length,
          (index) => Expanded(
            child: AnimatedNavBarItem(
              item: children[index],
              isSelected: selectedTab == index,
              selectedColor: selectedColor,
              unSelectedColor: unSelectedColor,
              showTopIndicator: showTopIndicator,
              onTap: () => onTap(index),
            ),
          ),
        ),
      ),
    );
  }
}
