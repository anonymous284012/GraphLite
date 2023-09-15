// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/utils/spaces.dart';
import 'package:floatingbubble/widgets/custom_clickable_icon_widget.dart';

/// Abstracted the App Bar with custom Configuration
///
/// 1. *isLeadingIconPresent* -> Used to check if Leading Icon is present
/// 2. *isTrailingWidgetPresent* -> Used to check if trailing widget Icon is present
/// 3. *leadingIcon* -> The value of Leading Icon (IconData)
/// 4. *trailingWidget* -> The value of Trailing Widget (Widget)
/// 5. *onLeadingPressed* -> Used to handle clicks on the Leading Icon in [CustomAppBar]
/// 6. *onTrailingPressed* -> Used to handle clicks on the Trailing Widget in [CustomAppBar]
/// 7. *title* -> Used to display the title for [CustomAppBar]
class CustomAppBar extends StatelessWidget {
  final bool isBackIconPresent;
  final bool isTrailingButtonPresent;
  final bool isBorderPresent;
  final Widget trailingWidget;
  final Function onBackPress;
  final Function onTrailingPress;
  final String title;
  final Color backIconColor;
  final Color backgroundColor;
  final Color textColor;

  const CustomAppBar({
    Key key,
    this.isBackIconPresent = false,
    this.isTrailingButtonPresent = false,
    this.isBorderPresent = true,
    this.trailingWidget = const CustomClickableIcon(
      iconData: Icons.edit,
    ),
    this.onBackPress,
    this.onTrailingPress,
    this.title,
    this.backIconColor = AppColors.whiteColor,
    this.backgroundColor = AppColors.neutralDark,
    this.textColor = AppColors.whiteColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// Wrapped with [Container] to add [Padding]
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_14,
        vertical: Sizes.PADDING_24,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: isBorderPresent
            ? const Border(
                bottom: BorderSide(
                  color: AppColors.neutralLight,
                  width: 2,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          /// if `isBackIconPresent` is present, display the back icon and add
          /// the back icon click functionality assosciated with it
          if (isBackIconPresent)
            Row(
              children: [
                CustomClickableIcon(
                  onPressed: onBackPress,
                  iconData: Icons.keyboard_arrow_left,
                  iconColor: backIconColor,
                ),

                // Horizontal Spacing
                SpaceW10(),
              ],
            ),

          /// Title
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: Sizes.TEXT_SIZE_20,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// if `isTrailingButtonPresent` is present, display the trailing button
          /// the click functionality assosciated with it
          if (isTrailingButtonPresent)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTrailingPress,
              child: trailingWidget,
            ),
        ],
      ),
    );
  }
}
