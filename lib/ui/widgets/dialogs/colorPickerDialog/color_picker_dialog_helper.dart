// 🐦 Flutter imports:
import 'package:floatingbubble/ui/widgets/dialogs/ColorPickerDialog/color_picker_dialog.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:

/// [ColorPickerDialogHelper] is used as a Helper class to show [LogoutDialog]
class ColorPickerDialogHelper {
  static Future showColorPickerDialog({
    BuildContext context,
    Color selectedColor,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => ColorPickerDialog(selectedColor: selectedColor),
      );
}
