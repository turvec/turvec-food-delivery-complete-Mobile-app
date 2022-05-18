import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/model/products_model.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded?Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }),
          ): Center(child: CircularProgressIndicator( color: AppColors.mainColor,));
        }),
        //dots Indicator
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        // Popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width30, bottom: Dimensions.height30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 1),
                child: SmallText(text: 'food pairing'),
              ),
            ],
          ),
        ),
        // List of Food and Images
        GetBuilder<RecommendedProductController>(builder: (recommendedProducts){
          return recommendedProducts.isLoaded?ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProducts.recommendedProductList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getRecommendedFood(index, 'home'));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height10),
                  child: Row(
                    children: [
                      //image
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/food0.png'),
                          ),
                        ),
                      ),
                      //text container
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextConSize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight: Radius.circular(Dimensions.radius20),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: recommendedProducts.recommendedProductList[index].name!),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                SmallText(text: 'With Chinese Characteristics'),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor1),
                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconColor: AppColors.mainColor),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: "32min",
                                        iconColor: AppColors.iconColor2)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }): Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index, 'home'));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven ? Color.fromARGB(255, 253, 146, 69) : Color.fromARGB(248, 244, 226, 65),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/food0.png')
                    )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      left: Dimensions.width15,
                      right: Dimensions.width15),
                  child: AppColumn(
                    text: popularProduct.name!,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
