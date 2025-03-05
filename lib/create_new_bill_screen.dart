import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/buttom_fixed_button.dart';
import 'widgets/custom_toggle_switch.dart'; // Import du widget personnalisé

class CreateNewBillScreen extends StatefulWidget {
  const CreateNewBillScreen({super.key});

  @override
  State<CreateNewBillScreen> createState() => _CreateNewBillScreenState();
}

class _CreateNewBillScreenState extends State<CreateNewBillScreen> {
  bool _emailReminder = true;
  String _selectedDays = "3 Days";
  String _dueDate = "27th feb, 2024";
  final String _billAmount = "\$150.00";
  DateTime _selectedDateTime = DateTime.now();

  final List<String> _reminderOptions = [
    "3 Days",
    "5 Days",
    "10 Days",
    "14 Days",
    "20 Days"
  ];

  @override
  void initState() {
    super.initState();
    // Définir la couleur de la barre de statut en blanc avec des icônes foncées
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness:
          Brightness.light, // Pour iOS: fond clair = icônes foncées
      statusBarIconBrightness: Brightness.dark, // Pour Android: icônes foncées
    ));
  }

  // Fonction pour convertir le numéro du mois en abréviation
  String _getMonthName(int month) {
    const months = [
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec'
    ];
    return months[month - 1];
  }

  // Fonction pour formater le suffixe du jour (st, nd, rd, th)
  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
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
          'Create new bill',
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
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const SizedBox(height: 10),

                // Icône de popcorn dans un cercle
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E0),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/pop_corn.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.pencil,
                            color: CupertinoColors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Texte "Total amount"
                const Center(
                  child: Text(
                    'Total amount',
                    style: TextStyle(
                      fontSize: 13,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // Montant \$150.00
                Center(
                  child: Text(
                    _billAmount,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Bouton "What's this for?" avec style amélioré
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Afficher un dialogue pour entrer la description de la facture
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(187, 222, 222, 231),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "What's this for?",
                        style: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Section "Set due date"
                const Text(
                  'Set due date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.black,
                  ),
                ),

                const SizedBox(height: 10),

                // Sélecteur de date
                GestureDetector(
                  onTap: () {
                    _showDatePicker(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _dueDate,
                          style: const TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.black,
                          ),
                        ),
                        const Icon(
                          CupertinoIcons.calendar,
                          color: CupertinoColors.systemGrey,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Section "Email Reminder" avec toggle personnalisé
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Email Reminder',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Send email reminders before the due date',
                          style: TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                    // Utilisation du toggle personnalisé
                    CustomToggleSwitch(
                      value: _emailReminder,
                      onChanged: (value) {
                        setState(() {
                          _emailReminder = value;
                        });
                      },
                      activeColor: CupertinoColors.activeGreen,
                      height: 24, // Hauteur réduite pour un toggle plus fin
                      width: 44, // Largeur proportionnée
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Options de rappel en jours (3, 5, 10, 14, 20)
                Wrap(
                  spacing: 10,
                  children: _reminderOptions.map((option) {
                    return GestureDetector(
                      onTap: () {
                        if (_emailReminder) {
                          setState(() {
                            _selectedDays = option;
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedDays == option && _emailReminder
                              ? CupertinoColors.systemBlue.withOpacity(0.1)
                              : CupertinoColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedDays == option && _emailReminder
                                ? CupertinoColors.systemBlue
                                : CupertinoColors.systemGrey5,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight:
                                _selectedDays == option && _emailReminder
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                            color: _emailReminder
                                ? _selectedDays == option
                                    ? CupertinoColors.systemBlue
                                    : CupertinoColors.black
                                : CupertinoColors.systemGrey,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 25),

                // Zone "Reminder set"
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey6,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          CupertinoIcons.bell_fill,
                          color: CupertinoColors.black,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Reminder set',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.black,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Reminder set for ${_selectedDays.toLowerCase()} before the due date.',
                              style: const TextStyle(
                                fontSize: 13,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Espace pour le bouton fixe
                const SizedBox(height: 80),
              ],
            ),

            // Bouton "Proceed" en bas de l'écran
            BottomFixedButton(
              buttonText: 'Proceed',
              onPressed: () {
                // Navigation vers l'écran suivant
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: CupertinoColors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      setState(() {
                        // Formater la date avec le jour, mois abrégé et année
                        final day = _selectedDateTime.day;
                        final suffix = _getDaySuffix(day);
                        final month = _getMonthName(_selectedDateTime.month);
                        final year = _selectedDateTime.year;

                        _dueDate = "$day$suffix $month, $year";
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    // Mise à jour de la date sélectionnée
                    _selectedDateTime = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
