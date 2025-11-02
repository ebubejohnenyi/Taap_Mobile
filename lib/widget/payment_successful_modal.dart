import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/widget/track_successful_content.dart';

import 'custom_button.dart';

class PaymentSuccessfulModal extends StatelessWidget {
  const PaymentSuccessfulModal({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                  context.go('/order');
                },
                child: Icon(Icons.close, size: 25),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              'Meet your attendant and say "6001"',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text("Here's how it works"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TrackSuccessfulContent(
              orderNumber: '1',
              title: 'Drive to the station',
              image: 'assets/png/roadmap.png',
            ),
            TrackSuccessfulContent(
              orderNumber: '2',
              title: 'Arrives at station',
              image: 'assets/png/map.png',
            ),
            TrackSuccessfulContent(
              orderNumber: '3',
              title: 'Meet you attendant and say your PIN',
              image: 'assets/png/megaphone.png',
            ),
            TrackSuccessfulContent(
              orderNumber: '4',
              title: 'Receive your order',
              image: 'assets/png/fuel.png',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Okay',
              onClick: () {
                context.pop();
                context.go('/order');
              },
            ),
          ],
        ),
      ),
    );
  }
}
