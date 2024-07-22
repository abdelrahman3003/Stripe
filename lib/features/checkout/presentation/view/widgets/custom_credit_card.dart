import 'package:flutter/material.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.points, required this.formKey, required this.autovalidateMode});
  final Widget points;
  final GlobalKey<FormState> formKey;
 final AutovalidateMode autovalidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CreditCardWidget(
        //   cardNumber: cardNumber,
        //   expiryDate: expiryDate,
        //   cardHolderName: cardHolderName,
        //   cvvCode: cvvCode,
        //   showBackView: showBackView,
        //   isHolderNameVisible: true,
        //   onCreditCardWidgetChange: (CreditCardBrand brand) {},
        // ),
        widget.points,
        // CreditCardForm(
        //   autovalidateMode: widget.autovalidateMode,
        //     cardNumber: cardNumber,
        //     expiryDate: expiryDate,
        //     cardHolderName: cardHolderName,
        //     cvvCode: cvvCode,
        //     onCreditCardModelChange: (creditCardModel) {
        //       cardNumber = creditCardModel.cardNumber;
        //       expiryDate = creditCardModel.expiryDate;
        //       cardHolderName = creditCardModel.cardHolderName;
        //       cvvCode = creditCardModel.cvvCode;
        //       showBackView = creditCardModel.isCvvFocused;
        //       setState(() {});
        //     },
        //     formKey: widget.formKey),
      ],
    );
  }
}
