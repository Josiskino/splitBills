import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import 'core/app_colors.dart';
import 'home_screen.dart';
import 'widgets/custom_buttom_app_bar.dart';
import 'widgets/custom_butttom_app_bar_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CupertinoPageScaffold(
        child: Center(child: Text('Favorites'))), // Placeholder
    const CupertinoPageScaffold(
        child: Center(child: Text('Address Book'))), // Placeholder
    const CupertinoPageScaffold(
        child: Center(child: Text('Settings'))), // Placeholder
  ];

  void onTabSelected(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    final isDarkMode = CupertinoTheme.of(context).brightness == Brightness.dark;

    return CupertinoPageScaffold(
      child: SafeArea(
        // SafeArea pour gérer les écrans avec encoche
        bottom:
            false, // Ne pas ajouter de padding en bas car nous avons notre propre barre
        child: Column(
          children: [
            // Zone de contenu principal (extensible)
            Expanded(
              child: screens[currentTab],
            ),
            // Barre de navigation fixée en bas
            CustomBottomAppBar(
              unSelectedColor: isDarkMode
                  ? AppColors.subTextColorDark
                  : AppColors.subTextColorLight,
              selectedColor: CupertinoTheme.of(context).primaryColor,
              onTap: onTabSelected,
              selectedTab: currentTab,
              showTopIndicator: false,
              children: const [
                CustomBottomAppBarItem(
                  icon: Iconsax.home,
                  text: "Home",
                ),
                CustomBottomAppBarItem(
                  icon: CupertinoIcons.person_3,
                  text: "Groups",
                ),
                CustomBottomAppBarItem(
                  icon: CupertinoIcons.list_bullet,
                  text: "Split history",
                ),
                CustomBottomAppBarItem(
                  icon: CupertinoIcons.person,
                  text: "Profile",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
