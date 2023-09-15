import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color mainColor = Colors.blue;

  Color contrastColor = Colors.black;

  // Tool Tip
  Color tooltipContrastColor = Colors.red;
  Color tooltipTitleColor = Colors.white;
  Color tooltipDescriptionColor = Colors.black;

  Color chartBarsColor = Colors.teal;

  String applicationFont = "TimesNewRoman";

  double axisLabelFontSize = 14;

  double tooltipSize = 50.0;

  void changeThemeColor(Color color) {
    mainColor = color;
    notifyListeners();
  }

  void changeContrastColor(Color color) {
    contrastColor = color;
    notifyListeners();
  }

  void changeTooltipContrastColor(Color color) {
    tooltipContrastColor = color;
    notifyListeners();
  }

  void changeTooltipTitleColor(Color color) {
    tooltipTitleColor = color;
    notifyListeners();
  }

  void changeTooltipDescriptionColor(Color color) {
    tooltipDescriptionColor = color;
    notifyListeners();
  }

  void changeChartBarsColor(Color color) {
    chartBarsColor = color;
    notifyListeners();
  }

  void changeFontFamily(String font) {
    applicationFont = font;
    notifyListeners();
  }

  void changeAxisLabelFontSize(double fontSize) {
    axisLabelFontSize = fontSize;
    notifyListeners();
  }

  void changeToolTipSize(double fontSize) {
    tooltipSize = fontSize;
    notifyListeners();
  }
}
