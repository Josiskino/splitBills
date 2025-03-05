import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'amount_input_bottom_sheet.dart';
import 'widgets/buttom_fixed_button.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({super.key});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    // Setting status bar to white with dark icons
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light, // For iOS: light background = dark icons
      statusBarIconBrightness: Brightness.dark, // For Android: dark icons
    ));
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
          child: const Icon(
            CupertinoIcons.back,
            color: CupertinoColors.systemGrey,
            size: 22,
          ),
        ),
        middle: const Text(
          'Add friends',
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
            // Contenu principal avec défilement
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  
                  // Add members section
                  const Text(
                    'Add members',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Search input with invite button
                  Container(
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: _searchController,
                              placeholder: 'Enter username or email',
                              placeholderStyle: const TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: 16,
                              ),
                              decoration: const BoxDecoration(
                                color: CupertinoColors.white,
                                border: null,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14.0),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              cursorColor: CupertinoColors.systemBlue,
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Icon(
                                  CupertinoIcons.add, 
                                  size: 16,
                                  color: CupertinoColors.systemBlue,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Invite',
                                  style: TextStyle(
                                    color: CupertinoColors.systemBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Members added count in a centered container with white background
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: CupertinoColors.systemGrey5,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          '3 members added',
                          style: TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Divider
                  const Divider(
                    height: 1,
                    thickness: 0.5,
                    color: CupertinoColors.systemGrey5,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Split group header
                  const Text(
                    'Split group',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Group members list
                  Container(
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Theresa Webb
                        _buildMemberTile(
                          initials: 'TW',
                          backgroundColor: const Color(0xFFFF8A80),
                          name: 'Theresa Webb',
                          username: '@theresa',
                          isCurrentUser: true,
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
                          backgroundColor: const Color(0xFFFF80AB),
                          name: 'Favour dumnoi',
                          username: '@favouranking',
                          isCurrentUser: false,
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
                          backgroundColor: const Color(0xFFB388FF),
                          name: 'Joshua kimmich',
                          username: '@joshua',
                          isCurrentUser: false,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Friends without Splitzy section
                  const Text(
                    'Friends without Splitzy',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Share Splitzy card - Cliquable pour ouvrir le modal
                  GestureDetector(
                    onTap: () {
                      // Utilisation de la version Cupertino du bottom sheet
                      showAmountInputBottomSheet(
                        context,
                        name: 'Joshua kimmich',
                        initials: 'JK',
                        avatarColor: const Color(0xFFB388FF),
                        onConfirm: (double amount) {
                          print('Montant confirmé: \$${amount.toStringAsFixed(2)}');
                          // Ajouter votre logique de traitement du montant ici
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Share icon in blue circle
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemBlue.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                CupertinoIcons.share,
                                color: CupertinoColors.systemBlue,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Share text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Share splitzy with friends',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: CupertinoColors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Tap to share app link to friends',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Espace pour le bouton fixe (important pour éviter que le contenu soit caché derrière le bouton)
                  const SizedBox(height: 80),
                ],
              ),
            ),
            
            // Utilisation du widget BottomFixedButton
            BottomFixedButton(
              buttonText: 'Proceed',
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
    required Color backgroundColor,
    required String name,
    required String username,
    required bool isCurrentUser,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          // Avatar with initials
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
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
          // Name and username
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: CupertinoColors.black,
                      ),
                    ),
                    if (isCurrentUser)
                      Text(
                        ' (you)',
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 13,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
          // Remove button (smaller size)
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              CupertinoIcons.minus,
              color: CupertinoColors.systemGrey,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}