// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:floatingbubble/constants/constants.dart';

/// Abstracted the Icons which need an onTap property
///
/// 1. *onPressed* -> Used to handle clicks on the [CustomClickableIcon]
/// 2. *iconData* -> Used to display the Icon for [CustomClickableIcon]
/// 3. *iconSize* -> Used to control the Icon size displayed in [CustomClickableIcon]
/// 4. *iconColor* -> Used to set the color of the icon in [CustomClickableIcon]
class CustomClickableIcon extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;

  const CustomClickableIcon({
    Key key,
    this.onPressed,
    this.iconData,
    this.iconSize = Sizes.ICON_SIZE_32,
    this.iconColor = AppColors.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Icon(
        iconData,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
