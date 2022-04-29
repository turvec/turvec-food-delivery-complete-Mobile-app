import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/food0.png'))),
            ),
          ),
          //Prev and next icons 
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            )
          ),
          //Introduction
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodImgSize-20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Shawarma",),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20,),
                  //Expandable text widget
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: "Turvec na boss base on one or twos Turvec na boss base on one or twos Turvec na boss base on one or twos,Turvec na boss base on one or twos twos Turvec na boss base on one or twos Turvec na boss base on one,Turvec na boss base on one or twosTurvec na boss base on one ortwos Turvec na boss base on one or twos Turvec na boss base on one  twos Turvec na boss base on one or twos Turvec na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos."
                        )
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.pageViewTextContainer,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          ),
          color: AppColors.buttonBackgroundColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: AppColors.signColor,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
              child: BigText(text: "\$10 | add to cart", color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}

