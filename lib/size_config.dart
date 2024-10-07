import 'package:flutter/material.dart';

class SizeConfig  {
  static MediaQueryData _mediaQueryData = 
  MediaQueryData.fromView(
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window
  );
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
//function that used to get sized of screen
double getPropotinateScreenHeight(double inputHeight){
  double screenHeight = SizeConfig.screenHeight;
  //812.0 layout height size that commonly used
  return(inputHeight / 812.0) * screenHeight;
}

//function that used to get sized of screen
double getPropotinateScreenWidht(double inputWidht){
  double screenWidht = SizeConfig.screenWidth;
  //812.0 layout height size that commonly used
  return(inputWidht / 375.0) * screenWidht;
}

