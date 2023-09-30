import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/ui/settings/theme_provider.dart';
import 'package:floatingbubble/ui/views/charts/chart_options.dart';
import 'package:floatingbubble/utils/spaces.dart';
import 'package:floatingbubble/widgets/multi_select_dialog_field/multi_select_dialog_field.dart';
import 'package:flutter/material.dart';
import 'package:floatingbubble/widgets/multi_select_dialog_field/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _ChartData {
  _ChartData(this.xLabel, this.yLabel);
  final String xLabel;
  final double yLabel;
}

class BarChartNew extends StatefulWidget {
  final int currentIndex;
  const BarChartNew({
    Key key,
    this.currentIndex,
  }) : super(key: key);

  @override
  State<BarChartNew> createState() => _BarChartNewState();
}

class _BarChartNewState extends State<BarChartNew> {
  ZoomPanBehavior _zoomingPanBehavior;
  final List<MultiSelectItem<SelectOption>> _items = [];
  bool showDialog = false;

  List<_ChartData> filteredData = [];
  bool isFiltered = false;

  bool isZoomEnabled = false;

  List<List<_ChartData>> chartData = [
    [
      _ChartData("Jan", 10),
      _ChartData("Feb", 5),
      _ChartData("Mar", 18),
      _ChartData("Apr", 4),
      _ChartData("May", 15),
      _ChartData("Jun", 8),
      _ChartData("Jul", 6),
      _ChartData("Aug", 7),
      _ChartData("Sep", 13),
      _ChartData("Oct", 8),
      _ChartData("Nov", 9),
      _ChartData("Dec", 11)
    ],
    [
      _ChartData('Mon', 8),
      _ChartData('Tue', 12),
      _ChartData('Wed', 5),
      _ChartData('Thu', 9),
      _ChartData('Fri', 4),
      _ChartData('Sat', 10),
      _ChartData('Sun', 15),
    ],
    [
      _ChartData("Prod A", 10),
      _ChartData("Prod B", 5),
      _ChartData("Prod C", 18),
      _ChartData("Prod D", 7),
      _ChartData("Prod E", 15),
      _ChartData("Prod F", 8),
      _ChartData("Prod G", 11),
      _ChartData("Prod H", 7),
      _ChartData("Prod I", 3),
      _ChartData("Prod J", 6),
      _ChartData("Prod K", 12),
      _ChartData("Prod L", 5)
    ],
    [
      _ChartData("NSE 1", 10),
      _ChartData("NSE 2", 5),
      _ChartData("NSE 3", 11),
      _ChartData("NSE 4", 7),
      _ChartData("NSE 5", 5),
      _ChartData("NSE 6", 12),
      _ChartData("NSE 7", 15),
      _ChartData("NSE 8", 7),
      _ChartData("NSE 9", 3),
      _ChartData("NSE 10", 13),
    ]
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < chartData[widget.currentIndex].length; i++) {
      _items.add(
        MultiSelectItem<SelectOption>(
            SelectOption(id: i, name: chartData[widget.currentIndex][i].xLabel),
            chartData[widget.currentIndex][i].xLabel),
      );
    }
    _zoomingPanBehavior = ZoomPanBehavior(
      maximumZoomLevel: 0.1,
      enablePanning: true,
      enableDoubleTapZooming: true,
    );
  }
  // List<MultiSelectItem<dynamic>>
  // List<MultiSelectItem<SelectOption>> _items

  List<_ChartData> showChartData(bool isFiltered) {
    debugPrint("isFiltered :- $isFiltered");
    if (isFiltered) {
      debugPrint("$filteredData");
      return filteredData;
    } else {
      return chartData[widget.currentIndex];
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SfCartesianChart(
            backgroundColor: themeProvider.contrastColor,
            zoomPanBehavior: _zoomingPanBehavior,
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelRotation: themeProvider.axisLabelFontSize > 14.0 ||
                      widget.currentIndex == 2 ||
                      widget.currentIndex == 3
                  ? 300
                  : 0,
              labelStyle: TextStyle(
                fontSize: themeProvider.axisLabelFontSize,
              ),
            ),
            primaryYAxis: NumericAxis(
              decimalPlaces: 0,
              labelStyle: TextStyle(
                fontSize: themeProvider.axisLabelFontSize,
              ),
            ),
            // Chart title
            // title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            // tooltipBehavior: TooltipBehavior(
            //   enable: true,
            //   textAlignment: ChartAlignment.center,
            //   color: themeProvider.tooltipContrastColor,
            //   format: 'point.y\npoint.x',
            //   textStyle: TextStyle(
            //     fontSize: themeProvider.tooltipSize,
            //     color: themeProvider.tooltipTitleColor,
            //   ),
            // ),
            onZoomStart: (zoomingArgs) {
              debugPrint("Zooming Args :- ${zoomingArgs.currentZoomFactor}");
              if (zoomingArgs.currentZoomFactor > 0) {
                setState(() => isZoomEnabled = true);
              } else {
                setState(() => isZoomEnabled = false);
              }
            },
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                dataSource: showChartData(isFiltered),
                xValueMapper: (_ChartData sales, _) => sales.xLabel,
                yValueMapper: (_ChartData sales, _) => sales.yLabel,
                // Enable data label
                color: themeProvider.chartBarsColor,
                isVisibleInLegend: false,
                name: "",
                dataLabelSettings: const DataLabelSettings(isVisible: false),
              )
            ],
          ),
        ),
        MultiSelectDialogField(
          // key: GlobalKey<FormFieldState>(),
          isOpen: showDialog,
          // chipDisplay: MultiSelectChipDisplay.none(),
          isChipsDisplayEnabled: true,
          dialogHeight: 250,
          items: _items,
          itemsTextStyle: const TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          selectedItemsTextStyle: const TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          title: const Text("Select Option"),
          selectedColor: Colors.blue,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          buttonText: Text(
            "Filter Graph",
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 16,
            ),
          ),
          onConfirm: (results) async {
            // setState(() {});
            _zoomingPanBehavior.reset();
            debugPrint("Results :- $results");
            if (results.isEmpty) {
              filteredData.clear();
              setState(() => isFiltered = false);
            } else {
              filteredData.clear();
              for (var resultItem in results) {
                var monthItem = chartData[widget.currentIndex]
                    .firstWhere((monthItem) => monthItem.xLabel == resultItem.name);
                filteredData.add(monthItem);
              }

              setState(() => isFiltered = true);
            }
          },
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: () => setState(() => showDialog = !showDialog),
        ),
        if (isZoomEnabled)
          PositionedDirectional(
            bottom: 10,
            end: 10,
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _zoomingPanBehavior.panToDirection('top');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.PADDING_6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_80),
                      color: AppColors.linkedInBlueColor,
                    ),
                    child: const Icon(
                      Icons.arrow_upward,
                      size: Sizes.ICON_SIZE_40,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SpaceH8(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _zoomingPanBehavior.panToDirection('bottom');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.PADDING_6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_80),
                      color: AppColors.linkedInBlueColor,
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      size: Sizes.ICON_SIZE_40,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SpaceH8(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() => isZoomEnabled = false);
                    _zoomingPanBehavior.reset();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.PADDING_6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_80),
                      color: AppColors.linkedInBlueColor,
                    ),
                    child: const Icon(
                      Icons.zoom_out,
                      size: Sizes.ICON_SIZE_40,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
