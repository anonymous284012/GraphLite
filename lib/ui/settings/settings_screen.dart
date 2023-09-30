import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/ui/settings/theme_provider.dart';
import 'package:floatingbubble/ui/widgets/dialogs/ColorPickerDialog/color_picker_dialog_helper.dart';
import 'package:floatingbubble/ui/widgets/dialogs/fontPickerDialog/font_picker_dialog_helper.dart';
import 'package:floatingbubble/utils/spaces.dart';
import 'package:floatingbubble/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> contrastList = [
    'Light',
    'Dark',
  ];
  String contrastSelectedValue;

  // Tool Tip
  Color toolTipContrastSelectedValue;
  Color toolTipTitleSelectedValue;
  Color toolTipDescriptionSelectedValue;

  Color chartBarsColorSelectedValue;

  String applicationFontSelectedValue;

  final List<double> axisLabelFontSizeList = [14, 15, 16, 17];

  double axisLabelFontSizeSelectedValue;

  final List<double> toolTipFontSizeList = [50, 75, 100, 125];

  double tooltipSizeSelectedValue;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    contrastSelectedValue = themeProvider.contrastColor == Colors.white ? 'Light' : 'Dark';

    // Tool Tip
    toolTipContrastSelectedValue = themeProvider.tooltipContrastColor;
    toolTipTitleSelectedValue = themeProvider.tooltipTitleColor;
    toolTipDescriptionSelectedValue = themeProvider.tooltipDescriptionColor;

    chartBarsColorSelectedValue = themeProvider.chartBarsColor;

    applicationFontSelectedValue = themeProvider.applicationFont;

    axisLabelFontSizeSelectedValue = themeProvider.axisLabelFontSize;

    tooltipSizeSelectedValue = themeProvider.tooltipSize;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.neutralLight,
        body: Column(
          children: [
            CustomAppBar(
              onBackPress: () => Navigator.of(context).pop(),
              title: "Theme Settings",
              isBackIconPresent: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_10,
                vertical: Sizes.PADDING_12,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: Sizes.WIDTH_180,
                        child: Text(
                          'Theme Picker',
                          style: TextStyle(
                            fontSize: Sizes.TEXT_SIZE_18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.arrow_drop_down),
                          Text(
                            'Click to Change',
                            style: TextStyle(
                              fontSize: Sizes.TEXT_SIZE_18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SpaceH20(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      themeLabel('Contrast'),
                      DropdownButton2(
                        hint: const Text(
                          'Pick Contrast',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        items: contrastList
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: contrastSelectedValue,
                        onChanged: (value) {
                          Color color = (value == "Light" ? Colors.white : Colors.black);
                          themeProvider.changeContrastColor(color);
                          setState(() => contrastSelectedValue = value);
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 40,
                          width: 140,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  SpaceH16(),
                  // GestureDetector(
                  //   onTap: () async {
                  //     final Color selectedColor =
                  //         await ColorPickerDialogHelper.showColorPickerDialog(
                  //       context: context,
                  //       selectedColor: toolTipContrastSelectedValue,
                  //     );
                  //     themeProvider.changeTooltipContrastColor(selectedColor);
                  //     setState(() => toolTipContrastSelectedValue = selectedColor);
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       themeLabel('Tool-Tip Contrast'),
                  //       colorLabel(toolTipContrastSelectedValue)
                  //     ],
                  //   ),
                  // ),
                  // SpaceH16(),
                  // GestureDetector(
                  //   onTap: () async {
                  //     final Color selectedColor =
                  //         await ColorPickerDialogHelper.showColorPickerDialog(
                  //       context: context,
                  //       selectedColor: toolTipTitleSelectedValue,
                  //     );
                  //     themeProvider.changeTooltipTitleColor(selectedColor);
                  //     setState(() => toolTipTitleSelectedValue = selectedColor);
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       themeLabel('Tool-Tip Text Color'),
                  //       colorLabel(toolTipTitleSelectedValue)
                  //     ],
                  //   ),
                  // ),
                  // SpaceH16(),
                  GestureDetector(
                    onTap: () async {
                      final Color selectedColor =
                          await ColorPickerDialogHelper.showColorPickerDialog(
                        context: context,
                        selectedColor: chartBarsColorSelectedValue,
                      );
                      themeProvider.changeChartBarsColor(selectedColor);
                      setState(() => chartBarsColorSelectedValue = selectedColor);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        themeLabel('Chart Bars'),
                        colorLabel(chartBarsColorSelectedValue),
                      ],
                    ),
                  ),
                  SpaceH16(),
                  GestureDetector(
                    onTap: () async {
                      final String selectedFont = await FontPickerDialogHelper.showFontPickerDialog(
                        context: context,
                        selectedFont: applicationFontSelectedValue,
                      );
                      debugPrint("Selected Font :- $selectedFont");
                      themeProvider.changeFontFamily(selectedFont);
                      setState(() => applicationFontSelectedValue = selectedFont);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        themeLabel('Application Font'),
                        fontLabel(applicationFontSelectedValue),
                      ],
                    ),
                  ),
                  SpaceH16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      themeLabel('Axis Label Size'),
                      DropdownButton2(
                        hint: const Text(
                          'Pick Size',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        items: axisLabelFontSizeList
                            .map((item) => DropdownMenuItem<double>(
                                  value: item,
                                  child: Text(
                                    '$item px',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: axisLabelFontSizeSelectedValue,
                        onChanged: (value) {
                          themeProvider.changeAxisLabelFontSize(value);
                          setState(() => axisLabelFontSizeSelectedValue = value);
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 40,
                          width: 140,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  // SpaceH16(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     themeLabel('Tooltip Text Size'),
                  //     DropdownButton2(
                  //       hint: const Text(
                  //         'Pick Size',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //       items: toolTipFontSizeList
                  //           .map((item) => DropdownMenuItem<double>(
                  //                 value: item,
                  //                 child: Text(
                  //                   '$item px',
                  //                   style: const TextStyle(
                  //                     fontSize: 14,
                  //                   ),
                  //                 ),
                  //               ))
                  //           .toList(),
                  //       value: tooltipSizeSelectedValue,
                  //       onChanged: (value) {
                  //         themeProvider.changeToolTipSize(value);
                  //         setState(() => tooltipSizeSelectedValue = value);
                  //       },
                  //       buttonStyleData: const ButtonStyleData(
                  //         height: 40,
                  //         width: 140,
                  //       ),
                  //       menuItemStyleData: const MenuItemStyleData(
                  //         height: 40,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget selectionDropDown({
  String hintText,
  List<String> dropdownList,
  String selectedValue,
  Function(String) onChanged,
}) {
  return DropdownButton2(
    hint: Text(
      hintText,
      style: const TextStyle(
        fontSize: 14,
      ),
    ),
    items: dropdownList
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
        .toList(),
    value: selectedValue,
    onChanged: onChanged,
    buttonStyleData: const ButtonStyleData(
      height: 40,
      width: 140,
    ),
    menuItemStyleData: const MenuItemStyleData(
      height: 40,
    ),
  );
}

Widget themeLabel(String labelText) {
  return SizedBox(
    width: Sizes.WIDTH_180,
    child: Text(
      labelText,
      style: const TextStyle(
        fontSize: Sizes.TEXT_SIZE_18,
      ),
    ),
  );
}

Widget colorLabel(Color selectedColor) {
  return Container(
    width: 140,
    height: Sizes.HEIGHT_36,
    color: selectedColor,
  );
}

Widget fontLabel(String selectedFont) {
  return Container(
    width: 140,
    height: Sizes.HEIGHT_36,
    color: AppColors.greyColor,
    child: Center(
      child: Text(
        selectedFont,
        style: const TextStyle(
          fontSize: Sizes.TEXT_SIZE_16,
        ),
      ),
    ),
  );
}
