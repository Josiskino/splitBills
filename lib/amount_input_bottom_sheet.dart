import 'package:flutter/cupertino.dart';

class AmountInputBottomSheet extends StatefulWidget {
  final String name;
  final String initials;
  final Color avatarColor;
  final Function(double) onConfirm;

  const AmountInputBottomSheet({
    super.key,
    required this.name,
    required this.initials,
    required this.avatarColor,
    required this.onConfirm,
  });

  @override
  State<AmountInputBottomSheet> createState() => _AmountInputBottomSheetState();
}

class _AmountInputBottomSheetState extends State<AmountInputBottomSheet> {
  String _amount = "50.00";

  void _updateAmount(String value) {
    // Filtrer pour garder uniquement les chiffres et un point décimal
    if (value == "." && _amount.contains(".")) {
      return; // Evite d'avoir plusieurs points
    }

    // Si on appuie sur effacer
    if (value == "←") {
      if (_amount.isNotEmpty) {
        setState(() {
          _amount = _amount.substring(0, _amount.length - 1);
          if (_amount.isEmpty || _amount == "0") {
            _amount = "0";
          }
        });
      }
      return;
    }

    setState(() {
      if (_amount == "0" && value != ".") {
        _amount = value;
      } else {
        _amount = _amount + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Poignée de déplacement
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey5,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              
              // Header avec titre et bouton de fermeture
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Assign share',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        CupertinoIcons.xmark,
                        color: CupertinoColors.systemGrey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Texte d'indication
              Text(
                'Enter amount to assign',
                style: TextStyle(
                  fontSize: 15,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              
              // Zone d'affichage du montant
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.black,
                      ),
                    ),
                    Text(
                      _amount,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Nom de l'utilisateur avec avatar
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: widget.avatarColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          widget.initials,
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Clavier numérique
              _buildNumericKeyboard(),
              
              // Bouton de confirmation
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  color: CupertinoColors.systemBlue,
                  borderRadius: BorderRadius.circular(12),
                  onPressed: () {
                    double? value = double.tryParse(_amount);
                    if (value != null) {
                      widget.onConfirm(value);
                    }
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildNumericKeyboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeypadButton('1'),
            _buildKeypadButton('2'),
            _buildKeypadButton('3'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeypadButton('4'),
            _buildKeypadButton('5'),
            _buildKeypadButton('6'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeypadButton('7'),
            _buildKeypadButton('8'),
            _buildKeypadButton('9'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeypadButton('.'),
            _buildKeypadButton('0'),
            _buildKeypadButton('←', icon: CupertinoIcons.arrow_left),
          ],
        ),
      ],
    );
  }
  
  Widget _buildKeypadButton(String value, {IconData? icon}) {
    return GestureDetector(
      onTap: () => _updateAmount(value),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: icon != null 
            ? Icon(
                icon,
                size: 20,
                color: CupertinoColors.black,
              )
            : Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.black,
                ),
              ),
        ),
      ),
    );
  }
}

// Fonction d'aide pour afficher le bottom sheet à la Cupertino
void showAmountInputBottomSheet(
  BuildContext context, {
  required String name,
  required String initials,
  required Color avatarColor,
  required Function(double) onConfirm,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return AmountInputBottomSheet(
        name: name,
        initials: initials,
        avatarColor: avatarColor,
        onConfirm: onConfirm,
      );
    },
  );
}