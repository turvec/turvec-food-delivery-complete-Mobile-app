import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Container(
                child: Center(child: BigText(size: Dimensions.font26, text: "Welcome Back")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExpandableTextWidget(text: "Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos,Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos ,Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos,  na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos, Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos , Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos,Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos ,Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos,  na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos, Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos , Turvec na boss base on one or twos Turvec na boss base on one twos.Turvec na boss base on one or twos ,  na boss base on one twos Turvec na boss base on one or twos Turvec na boss base on one twos."),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20*2.5, vertical: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(iconSize: Dimensions.iconSize24, backgroundColor: AppColors.mainColor, iconColor: Colors.white, icon: Icons.remove),
                BigText(text: "\$12.88 "+" X "+" 0 ", color: AppColors.mainBlackColor, size: Dimensions.font26,),
                AppIcon(iconSize: Dimensions.iconSize24, backgroundColor: AppColors.mainColor, iconColor: Colors.white, icon: Icons.add),
              ],
            ),
          ),
          Container(
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
              child: Icon(
                Icons.favorite,
                color: AppColors.mainColor,
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
        ],
      ),
    );
  }
}
