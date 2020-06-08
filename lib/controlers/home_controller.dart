import 'package:flutter/material.dart';

class HomeController {
  getElementType(int type) {
    String elementType;

    switch (type) {
      case 1:
        elementType = "Não metal";
        break;
      case 2:
        elementType = "Gás nobre";
        break;
      case 3:
        elementType = "Metal alcalino";
        break;
      case 4:
        elementType = "Metal alcalino terroso";
        break;
      case 5:
        elementType = "Semimetal";
        break;
      case 6:
        elementType = "Halogênio";
        break;
      case 7:
        elementType = "Outros metais";
        break;
      case 8:
        elementType = "Metal de transição";
        break;
      case 9:
        elementType = "Lantanídeo";
        break;
      case 10:
        elementType = "Actinídio";
        break;
    }

    return elementType;
  }

  getElementColor(int type) {
    Color elementColor;

    switch (type) {
      case 1:
        elementColor = Color(0xffa8db56);
        break;
      case 2:
        elementColor = Color(0xff84b6e5);
        break;
      case 3:
        elementColor = Color(0xfff3c356);
        break;
      case 4:
        elementColor = Color(0xffe8e454);
        break;
      case 5:
        elementColor = Color(0xff7ec4b8);
        break;
      case 6:
        elementColor = Color(0xffb1e0f0);
        break;
      case 7:
        elementColor = Color(0xffa5cad6);
        break;
      case 8:
        elementColor = Color(0xfff39cac);
        break;
      case 9:
        elementColor = Color(0xffa0dddd);
        break;
      case 10:
        elementColor = Color(0xffe5aedc);
        break;
    }

    return elementColor;
  }
}
