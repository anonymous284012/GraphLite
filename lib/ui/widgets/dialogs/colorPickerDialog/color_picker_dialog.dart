import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/models/color_type_model.dart';
import 'package:floatingbubble/utils/spaces.dart';
import 'package:floatingbubble/widgets/multi_select_dialog_field/custom_button_widget.dart';
import 'package:flutter/material.dart';

class ColorPickerDialog extends StatefulWidget {
  final Color selectedColor;

  const ColorPickerDialog({
    Key key,
    this.selectedColor,
  }) : super(key: key);

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  List<ColorType> colorsList = [
    ColorType(
      color: Colors.black,
    ),
    ColorType(
      color: Colors.white,
    ),
    ColorType(
      color: Colors.red,
    ),
    ColorType(
      color: Colors.green,
    ),
    ColorType(
      color: Colors.teal,
    ),
    ColorType(
      color: Colors.blue,
    ),
    ColorType(
      color: Colors.yellow,
    ),
    ColorType(
      color: Colors.brown,
    ),
    ColorType(
      color: Colors.orange,
    ),
    ColorType(
      color: Colors.grey,
    ),
  ];

  Color selectedColor;

  @override
  void initState() {
    for (var colorItem in colorsList) {
      if (colorItem.color == widget.selectedColor) {
        colorItem.selected = true;
      }
    }
    super.initState();
  }

  void changeSelectedColor(Color currentColor) {
    for (var colorItem in colorsList) {
      if (colorItem.color == currentColor) {
        colorItem.selected = true;
      } else {
        colorItem.selected = false;
      }
    }
    selectedColor = currentColor;
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: AppColors.neutralLight,
        width: Sizes.WIDTH_360,
        padding: const EdgeInsets.all(Sizes.PADDING_8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Tool Tip Contrast",
              style: TextStyle(
                fontSize: Sizes.TEXT_SIZE_18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SpaceH20(),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: Sizes.HEIGHT_20,
              spacing: Sizes.WIDTH_6,
              children: colorsList.map((colorItem) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () => changeSelectedColor(colorItem.color),
                      child: Container(
                        width: Sizes.WIDTH_50,
                        height: Sizes.HEIGHT_50,
                        decoration: BoxDecoration(
                          color: colorItem.color,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              Sizes.RADIUS_80,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (colorItem.selected)
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check,
                            color: colorItem.color == Colors.black
                                ? Colors.white
                                : colorItem.color == Colors.white ||
                                        colorItem.color == Colors.yellow
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      )
                  ],
                );
              }).toList(),
            ),
            SpaceH20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  width: Sizes.WIDTH_100,
                  color: AppColors.neutralLight,
                  textColor: Colors.black,
                  title: "Cancel",
                  onPressed: () => Navigator.of(context).pop(widget.selectedColor),
                ),
                CustomButton(
                  width: Sizes.WIDTH_100,
                  title: "Confirm",
                  onPressed: () => Navigator.of(context).pop(selectedColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
