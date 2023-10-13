import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_gateway_integration/gateways/local/aamarpay.dart';

class PaymentGatewayMobile extends StatefulWidget {
  final double amount;
  const PaymentGatewayMobile({super.key, required this.amount});

  @override
  State<PaymentGatewayMobile> createState() => _PaymentGatewayMobileState();
}

class _PaymentGatewayMobileState extends State<PaymentGatewayMobile> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Gateway"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gatewayContainer(child: AamarpayButton(amount: widget.amount,)),
          ],
        ),
      )
    );
  }

  gatewayContainer({required Widget child}){
    return Center(
      child: SizedBox(
        width: .5.sw,
        child: child,
      ),
    );
  }

}

