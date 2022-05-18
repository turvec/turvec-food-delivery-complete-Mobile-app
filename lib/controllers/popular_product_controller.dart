import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded  => _isLoaded;

  int _quantity= 0;
  int get quantity => _quantity;

  int _inCartItems= 0;
  int get inCartItems => _inCartItems+_quantity;

  Future<void> getPopularProductList() async {
     Response response = await popularProductRepo.getPopularProductList(); 
     if (response.statusCode == 200) {
      //  print('got product');
       _popularProductList=[];
       _popularProductList.addAll(Product.fromJson(response.body).products);
      //  print(_popularProductList);
      _isLoaded = true;
       update();
     } else {
       Get.snackbar("Internet Error", "Oops, Failed to Connect!",
        backgroundColor: Colors.red,
        colorText: Color(0xffffffff),
      );
     }
  }
  
  void setQuantity(bool isIncrement){
    if (isIncrement) {
      _quantity = checkQuantity(_quantity+1);
    } else {
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if ((_inCartItems+quantity)<0) {
      Get.snackbar("Item Count", "You have exceeded the reduction Limit!",
      backgroundColor: AppColors.mainColor,
      colorText: Color(0xffffffff),
      );
      if (_inCartItems>0) {
        _quantity = - _inCartItems;
        return _quantity;
      }
      return 0;
    } else if((_inCartItems+quantity)>20){
      Get.snackbar("Item Count", "You have exceeded the addition Limit!",
      backgroundColor: AppColors.mainColor,
      colorText: Color(0xffffffff),
      );
      if (_inCartItems>0) {
        _quantity -= 1;
        return _quantity;
      }
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //if exist
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }
  void addItem(ProductModel product){
      _cart.addItem(product, _quantity);
       Get.snackbar("Item Count", " Added to Your Cart Successfully",
      backgroundColor: AppColors.mainColor,
      colorText: Color(0xffffffff),
      );
      _quantity=0;
      _inCartItems = _cart.getQuantity(product);

      update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}