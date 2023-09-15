import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/models/font_type_model.dart';
import 'package:floatingbubble/utils/spaces.dart';
import 'package:floatingbubble/widgets/multi_select_dialog_field/custom_button_widget.dart';
import 'package:flutter/material.dart';

class FontPickerDialog extends StatefulWidget {
  final String selectedFont;

  const FontPickerDialog({
    Key key,
    this.selectedFont,
  }) : super(key: key);

  @override
  State<FontPickerDialog> createState() => _FontPickerDialogState();
}

class _FontPickerDialogState extends State<FontPickerDialog> {
  List<FontType> fontList = [
    FontType(
      font: 'TimesNewRoman',
    ),
    FontType(
      font: "CourierPrime",
    ),
    FontType(
      font: "TiresiasInfofont",
    ),
    FontType(
      font: "SansSerif",
    ),
  ];

  String selectedFont;

  @override
  void initState() {
    for (var colorItem in fontList) {
      if (colorItem.font == widget.selectedFont) {
        colorItem.selected = true;
      }
    }
    super.initState();
  }

  void changeSelectedFont(String currentFont) {
    for (var colorItem in fontList) {
      if (colorItem.font == currentFont) {
        colorItem.selected = true;
      } else {
        colorItem.selected = false;
      }
    }
    selectedFont = currentFont;
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Sizes.WIDTH_360,
        padding: const EdgeInsets.all(Sizes.PADDING_8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Application Font",
              style: TextStyle(
                fontSize: Sizes.TEXT_SIZE_18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SpaceH20(),
            ListView(
              shrinkWrap: true,
              children: fontList.map((fontItem) {
                return GestureDetector(
                  onTap: () => changeSelectedFont(fontItem.font),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fontItem.font,
                            style: const TextStyle(
                              fontSize: Sizes.TEXT_SIZE_16,
                            ),
                          ),
                          Container(
                            width: Sizes.WIDTH_30,
                            height: Sizes.HEIGHT_30,
                            decoration: BoxDecoration(
                              color: fontItem.selected ? Colors.teal : Colors.transparent,
                              border: Border.all(color: AppColors.greyColor),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  Sizes.RADIUS_80,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SpaceH10()
                    ],
                  ),
                );
              }).toList(),
            ),
            SpaceH20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  width: Sizes.WIDTH_100,
                  color: Colors.white,
                  textColor: Colors.black,
                  title: "Cancel",
                  onPressed: () => Navigator.of(context).pop(widget.selectedFont),
                ),
                CustomButton(
                  width: Sizes.WIDTH_100,
                  title: "Confirm",
                  onPressed: () => Navigator.of(context).pop(selectedFont),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
