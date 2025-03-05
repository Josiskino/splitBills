import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:split_ease/add_friends_screen.dart';

import 'allocate_portions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir la couleur du système de barre d'état pour toutes les pages
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            CupertinoColors.systemGroupedBackground, // Couleur du body
        statusBarBrightness: Brightness.light, // Pour iOS
        statusBarIconBrightness: Brightness.dark, // Pour Android
      ),
    );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground.withOpacity(0.9),
        border: const Border(
            bottom: BorderSide(color: CupertinoColors.systemGrey5, width: 0.5)),
        middle: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Alignement cohérent avec le reste du design
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemRed,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'TW',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Hi Theresa',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.black,
                        ),
                      ),
                      Text(
                        '@theresa',
                        style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.bell_fill,
                    color: CupertinoColors.black,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main card with gradient background
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFF3E0), // Light peach
                        Color(0xFFFFE0B2), // Lighter peach
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: CupertinoColors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      // Avatars with gradient circles - ENLARGED
                      SizedBox(
                        height: 90, // Increased height
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Left avatar (background)
                            Positioned(
                              left: MediaQuery.of(context).size.width / 2 -
                                  20, // Adjusted position
                              child: _buildGradientAvatar(
                                const Color(0xFFDCD3FF),
                                'assets/images/avatars/avatar2.png',
                                isMain: false,
                                showBorder: false,
                              ), // Light purple
                            ),
                            // Right avatar (background)
                            Positioned(
                              right: MediaQuery.of(context).size.width / 2 -
                                  20, // Adjusted position
                              child: _buildGradientAvatar(
                                const Color(0xFFFFCCCC),
                                'assets/images/avatars/avatar3.png',
                                isMain: false,
                                showBorder:
                                    false, // Pas de bordure blanche pour l'avatar droit
                              ), // Light red
                            ),
                            // Center avatar (foreground)
                            _buildGradientAvatar(
                              const Color(0xFFFFF2CC),
                              'assets/images/avatars/avatar.png',
                              isMain: true,
                              showBorder:
                                  true, // Bordure blanche pour l'avatar principal
                            ), // Light amber
                          ],
                        ),
                      ),

                      const SizedBox(height: 24), // Increased spacing

                      const Text(
                        'Splitting bills just got easier!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20, // Reduced font size to fit on one line
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.black,
                        ),
                      ),

                      const SizedBox(height: 12), // Increased spacing

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0),
                        child: Text(
                          'Manage group expenses effortlessly by adding your crew and sharing the link to settle up.',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize:
                                13, // Reduced font size to fit on two lines
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30), // Increased spacing

                      // Buttons row
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14), // Taller buttons
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    CupertinoIcons.person_3_fill,
                                    color: CupertinoColors.systemBlue,
                                    size: 19, // Slightly larger icons
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Join a split',
                                    style: TextStyle(
                                      color: CupertinoColors.systemBlue,
                                      fontSize: 15, // Slightly larger text
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        AllocatePortionsScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CupertinoButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14), // Taller buttons
                              color: CupertinoColors.systemBlue,
                              borderRadius: BorderRadius.circular(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/ticket1.png",
                                    width: 19,
                                    height: 19,
                                    color: CupertinoColors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'New split',
                                    style: TextStyle(
                                      color: CupertinoColors.white,
                                      fontSize: 15, // Slightly larger text
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        AddFriendsScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // To-do section
                const Text(
                  'Things to do',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),

                const SizedBox(height: 10),

                // Payment method setup card
                Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey4.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: CupertinoColors.systemGrey5.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Up next:',
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'setup payment method',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _buildCheckCircle(true),
                                const SizedBox(width: 8),
                                _buildCheckCircle(true),
                                const SizedBox(width: 8),
                                _buildCheckCircle(true),
                                const SizedBox(width: 8),
                                _buildCheckCircle(false),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          // Image wallet agrandie sans le conteneur bleu
                          ClipOval(
                            child: SizedBox(
                              width:
                                  65, // Image agrandie pour la mettre en valeur
                              height: 65,
                              child: Image.asset(
                                'assets/images/wallet.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Bouton Let's go sans bordure
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color:
                                  CupertinoColors.systemBlue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6),
                              // Bordure supprimée
                            ),
                            child: const Text(
                              'Let\'s go',
                              style: TextStyle(
                                color: CupertinoColors.systemBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // What's new section
                const Text(
                  'What\'s new?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),

                const SizedBox(height: 10),

                // Apple Pay card
                Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey4.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: CupertinoColors.systemGrey5.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemRed,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          CupertinoIcons.money_dollar,
                          color: CupertinoColors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Pay a split with apple pay',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Just tap, pay, and split seamlessly',
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.chevron_right,
                        color: CupertinoColors.systemGrey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create gradient circle avatars
  Widget _buildGradientAvatar(Color backgroundColor, String imagePath,
      {bool isMain = false, bool showBorder = true}) {
    final double size = isMain ? 80 : 65;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: showBorder
            ? Border.all(color: CupertinoColors.white, width: 2)
            : null,
        boxShadow: isMain
            ? [
                BoxShadow(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                )
              ]
            : null,
      ),
      child: Center(
        child: ClipOval(
          child: SizedBox(
            width: size * 0.8,
            height: size * 0.8,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create check circles
  Widget _buildCheckCircle(bool isChecked) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isChecked
            ? CupertinoColors.systemBlue
            : CupertinoColors.systemGrey6,
        shape: BoxShape.circle,
      ),
      child: isChecked
          ? const Icon(
              CupertinoIcons.checkmark,
              color: CupertinoColors.white,
              size: 14,
            )
          : null,
    );
  }
}
