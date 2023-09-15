class FontType implements Comparable<FontType> {
  String font;
  bool selected = false;

  FontType({this.font});

  @override
  int compareTo(FontType other) {
    if (selected == other.selected) {
      return 0;
    } else if (selected) {
      return -1;
    }
    return 1;
  }
}
