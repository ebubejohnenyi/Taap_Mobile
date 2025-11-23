import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/widget/payment_method_content.dart';
import 'package:mobile/widget/code_successful_modal.dart';
import 'package:mobile/widget/receipt_content.dart';

import 'address_wrapper.dart';
import 'assurance.dart';
import 'bottom_modal.dart';
import 'custom_button.dart';

class PaymentMethodModal extends StatefulWidget {
  const PaymentMethodModal({
    required this.selectedMethod,
    required this.tab,
    super.key,
  });

  final String tab;
  final String selectedMethod;

  @override
  State<StatefulWidget> createState() {
    return _PaymentMethodModalState();
  }
}

class _PaymentMethodModalState extends State<PaymentMethodModal> {
  String? selectedMethod;

  @override
  void initState() {
    super.initState();
    selectedMethod = widget.selectedMethod;
  }

  void handleSelectedMethod() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Payment Method',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, size: 25),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ReceiptContent(title: 'Sub Total', value: '₦10,000'),
            if (widget.tab == 'order-now')
            ReceiptContent(title: 'Service Fee', value: '₦2'),
            if (widget.tab == 'pre-order')
              ReceiptContent(title: 'Service Fee', value: '₦2'),
            if (widget.tab == 'pre-order')
              ReceiptContent(title: 'Delivery Fee', value: '₦745'),
            ReceiptContent(title: 'Total', value: '₦10,747'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            if (widget.tab == 'pre-order')
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  AddressWrapper(
                    label: 'Filling Stattion',
                    address: '11 Providence Street, Lekki Phase 1',
                    icon: Icons.my_location,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  AddressWrapper(
                    label: 'You',
                    address: '123 ABC street, Herbert Mercylay way, Yaba.',
                    icon: Icons.location_pin,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            PaymentMethodContent(
              title: 'Transfer',
              icon: Icons.network_check_outlined,
              isSelected: selectedMethod == 'Transfer',
              onSelect: () {
                setState(() => selectedMethod = 'Transfer');
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            PaymentMethodContent(
              title: 'Wallet',
              icon: Icons.account_balance_wallet_outlined,
              isSelected: selectedMethod == 'Wallet',
              onSelect: () {
                setState(() => selectedMethod = 'Wallet');
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Spacer(),
            Assurance(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            CustomButton(
              title: 'Continue',
              onClick: () {
                context.pop();
                BottomModal.show(
                  context: context,
                  enableDrag: true,
                  child: CodeSuccessfulModal(),
                );
              },
            ),
          ],
        ),
      );
  }
}
