import 'dart:ui';

class ColorType implements Comparable<ColorType> {
  Color color;
  bool selected = false;

  ColorType({this.color});

  @override
  int compareTo(ColorType other) {
    if (selected == other.selected) {
      return 0;
    } else if (selected) {
      return -1;
    }
    return 1;
  }
}
