import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/buttom_fixed_button.dart';

class AllocatePortionsScreen extends StatefulWidget {
  const AllocatePortionsScreen({super.key});

  @override
  State<AllocatePortionsScreen> createState() => _AllocatePortionsScreenState();
}

class _AllocatePortionsScreenState extends State<AllocatePortionsScreen> {
  bool _saveForFuture = true;

  @override
  void initState() {
    super.initState();
    // Définir la couleur de la barre de statut en blanc avec des icônes foncées
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Barre de statut blanche
      statusBarBrightness:
          Brightness.light, // Pour iOS: fond clair = icônes foncées
      statusBarIconBrightness: Brightness.dark, // Pour Android: icônes foncées
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: const Border(
          bottom: BorderSide(
            color: CupertinoColors.systemGrey5,
            width: 0.5,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              CupertinoIcons.back,
              color: CupertinoColors.systemGrey,
              size: 18,
            ),
          ),
        ),
        middle: const Text(
          'Allocate portions',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  const SizedBox(height: 16),

                  // Movie hangout card
                  Container(
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.systemGrey4.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Movie hangout section
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Popcorn icon
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF3E0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/pop_corn.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Text info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Movie hangout',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: CupertinoColors.black,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '3 members',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Price
                              const Text(
                                '\$150.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.5,
                                  color: CupertinoColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Divider avec même padding
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            height: 1,
                            thickness: 0.5,
                            color: CupertinoColors.systemGrey5,
                          ),
                        ),

                        // Total bill allocated
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total bill allocated:',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              Text(
                                '\$150.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: CupertinoColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Remaining balance
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Remaining balance:',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              Text(
                                '\$0.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: CupertinoColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Split group header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Split group',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.black,
                        ),
                      ),
                      // Custom split dans conteneur blanc
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: CupertinoColors.systemGrey5,
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Custom split',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(
                              CupertinoIcons.chevron_down,
                              size: 14,
                              color: CupertinoColors.systemGrey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Split members list
                  Container(
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.systemGrey4.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Theresa Webb avec (you) en gris
                        _buildMemberTile(
                          initials: 'TW',
                          avatarColor: const Color(0xFFFF8A80),
                          name: 'Theresa Webb',
                          isCurrentUser: true,
                          amount: '\$ 50.00',
                        ),

                        // Divider
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            height: 1,
                            thickness: 0.5,
                            color: CupertinoColors.systemGrey5,
                          ),
                        ),

                        // Favour dumnoi
                        _buildMemberTile(
                          initials: 'FD',
                          avatarColor: const Color(0xFFFF80AB),
                          name: 'Favour dumnoi',
                          isCurrentUser: false,
                          amount: '\$ 50.00',
                        ),

                        // Divider
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            height: 1,
                            thickness: 0.5,
                            color: CupertinoColors.systemGrey5,
                          ),
                        ),

                        // Joshua kimmich
                        _buildMemberTile(
                          initials: 'JK',
                          avatarColor: const Color(0xFFB388FF),
                          name: 'Joshua kimmich',
                          isCurrentUser: false,
                          amount: '\$ 50.00',
                        ),
                      ],
                    ),
                  ),

                  // Save this split checkbox
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _saveForFuture = !_saveForFuture;
                              });
                            },
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: _saveForFuture
                                    ? CupertinoColors.systemBlue
                                    : CupertinoColors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: _saveForFuture
                                      ? CupertinoColors.systemBlue
                                      : CupertinoColors.systemGrey3,
                                  width: 1.5,
                                ),
                              ),
                              child: _saveForFuture
                                  ? const Icon(
                                      CupertinoIcons.check_mark,
                                      size: 13,
                                      color: CupertinoColors.white,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Save this split group for future payments',
                          style: TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Espace pour le bouton fixe
                  const SizedBox(height: 80),
                ],
              ),
            ),

            // Utilisation du widget BottomFixedButton
            BottomFixedButton(
              buttonText: 'Create split',
              onPressed: () {
                // Votre logique ici
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberTile({
    required String initials,
    required Color avatarColor,
    required String name,
    required bool isCurrentUser,
    required String amount,
  }) {
    // Extraire les chiffres uniquement du montant pour le soulignement
    String amountValue = amount.replaceAll(RegExp(r'[^\d.]'), '');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: avatarColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Name avec (you) en gris
              Expanded(
                child: isCurrentUser
                    ? RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' (you)',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: CupertinoColors.black,
                        ),
                      ),
              ),
              // Amount avec trait de soulignement directement sous les chiffres
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                  ),
                  // Trait directement sous les chiffres 50 uniquement
                  if (amountValue.contains('50'))
                    Container(
                      width: 37,
                      height: 1,
                      color: CupertinoColors.systemGrey4,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}