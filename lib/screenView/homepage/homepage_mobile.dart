import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_gateway_integration/Components/custom_text_field.dart';
import 'package:payment_gateway_integration/Components/get_ordinal.dart';
import 'package:payment_gateway_integration/Components/spacing.dart';
import 'package:payment_gateway_integration/responsive/responsive_layout.dart';
import 'package:payment_gateway_integration/screenView/payment_getway/payment_gateway_mobile.dart';
import 'package:payment_gateway_integration/screenView/theme_selector/theme_selector_page_desktop.dart';
import 'package:payment_gateway_integration/screenView/theme_selector/theme_selector_page_mobile.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  List<Map<String, dynamic>> itemList = [];
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ResponsiveLayout(mobileBody: ThemeSelectorPageMobile(), desktopBody: ThemeSelectorPageDesktop(),)));
          }, icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(7.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: ItemList()),
              TotalPrice(),
              InputElements(),
              verticalSpacing(10.h),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InputElements() {
    return Row(
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                border: Border.all(
                  width: 2.h,
                  color: Colors.blue,
                )
            ),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Row(
                children: [
                  const Text('Amount: '),
                  Flexible(child: CustomTextField(textEditingController: textEditingController)),
                  horizontalSpacing(5.h),
                  ElevatedButton(onPressed: (){
                    double? price = double.tryParse(textEditingController.text);
                    if(price!=null){
                      setState(() {
                        itemList.add({'Index': itemList.length+1, 'Name': getOrdinal(itemList.length+1)+' item', 'Price': price});
                      });
                    }
                  }, child: Padding(padding: EdgeInsets.all(12.h), child: const Text('Add'))),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ElevatedButton(onPressed: (){
            if(calculateTotalPrice()==0){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please add item')));
            } else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentGatewayMobile(amount: calculateTotalPrice())));
            }
          }, child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const Text('Proceed'),
          )),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  ItemList() {
    return ListView.builder(itemBuilder: (BuildContext context, index){
     return Padding(
       padding: const EdgeInsets.all(2.0),
       child: Container(
         color: Colors.lightBlueAccent,
         child: Padding(
           padding: EdgeInsets.symmetric(vertical: 4.h),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(itemList[index]['Index'].toString()),
              Text(itemList[index]['Name']),
              Text('${itemList[index]['Price']} Taka'),
             ],
           ),
         ),
       ),
     );
    }, itemCount: itemList.length,);
  }

  // ignore: non_constant_identifier_names
  TotalPrice() {
    return Padding(
      padding: EdgeInsets.all(5.h),
      child: Container(
        color: Colors.greenAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Total Price: "),
            Text(calculateTotalPrice().toString()),
          ],
        ),
      ),
    );
  }
  calculateTotalPrice(){
    double totalPrice = 0;
    for(var item in itemList){
      totalPrice = totalPrice+item['Price'];
    }
    return totalPrice;
  }
}
