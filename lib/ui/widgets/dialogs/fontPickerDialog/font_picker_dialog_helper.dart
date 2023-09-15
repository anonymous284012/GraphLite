// 🐦 Flutter imports:

import 'package:floatingbubble/ui/widgets/dialogs/fontPickerDialog/font_picker_dialog.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:

/// [ColorPickerDialogHelper] is used as a Helper class to show [LogoutDialog]
class FontPickerDialogHelper {
  static Future showFontPickerDialog({
    BuildContext context,
    String selectedFont,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => FontPickerDialog(selectedFont: selectedFont),
      );
}
