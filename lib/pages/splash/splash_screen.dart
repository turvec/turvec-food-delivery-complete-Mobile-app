import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController _controller;
  
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
    _controller = new AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    animation = new CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuint);
    Timer(Duration(seconds: 3), (() => Get.offNamed(RouteHelper.getInitial())));
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
            backgroundColor: AppColors.mainColor,
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ScaleTransition(
                 scale: animation,
                 child: Center(child: Image.asset('assets/image/food-logo.png'))),
               Center(child: Text('Turvec Food Republic',
                   style: TextStyle(fontSize: Dimensions.font26, fontFamily:'Roboto',fontWeight: FontWeight.w800, color: Colors.white),
                ))
             ],
           ),
       );
  }
}