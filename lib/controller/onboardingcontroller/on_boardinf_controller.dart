import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_auth_fss/routes/app_routes.dart';

class OnBoardingController extends GetxController {
  final PageController _pageController = PageController();
   PageController get pageController => _pageController;
   RxInt currentIndex = 0.obs;
   void updatePage(int index) => currentIndex.value=index;
   void nextPage(){
     if (currentIndex.value==2){
       Get.offAllNamed(AppRoutes.login);
     }else{
       pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
     }
   }
}