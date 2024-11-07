import 'package:astha_agent/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LinearGraph extends StatelessWidget {
  LinearGraph({super.key, required this.title});
  final String title;
  final yData = [5, 15, 10, 6, 20, 12, 25];
  final xData = List.generate(10, (index) => (index += 5).toString());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 20, 20, 10),
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 20),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.white70,
                  titlesData: titleData(xData),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Color(0xffe7e8ec), width: 1),
                      bottom: BorderSide(color: Color(0xffe7e8ec), width: 1),
                    ),
                  ),
                  lineBarsData: [
                    getReceivedLineData(yData),
                  ],
                  lineTouchData: const LineTouchData(
                    touchSpotThreshold: 30,
                    touchTooltipData: LineTouchTooltipData(
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Days',
                style: TextStyle(color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData getReceivedLineData(List<num> yData) {
    return LineChartBarData(
      spots: List.generate(
        yData.length,
        (index) => FlSpot(
          index.toDouble(),
          yData[index].toDouble(),
        ),
      ),
      isCurved: true,
      color: Colors.blue,
      barWidth: 2,
      isStrokeCapRound: false,
      preventCurveOverShooting: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
        applyCutOffY: true,
        color: Colors.blue.withOpacity(.1),
      ),
    );
  }

  FlTitlesData titleData(List<String> xData) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            var showBottom = value % 1 == 0;
            return showBottom
                ? SideTitleWidget(
                    axisSide: AxisSide.right,
                    child: Text(
                      xData[value.toInt()],
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  )
                : const SizedBox();
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 45,
          showTitles: true,
          getTitlesWidget: (value, meta) {
            // String formattedValue = formatAmount(value);

            // Skip displaying values too close to each other
            if (value == meta.max) {
              final remainder = value % meta.appliedInterval;
              if (remainder != 0.0 && remainder / meta.appliedInterval < 0.5) {
                return const SizedBox.shrink();
              }
            }

            return SideTitleWidget(
              axisSide: AxisSide.left,
              child: value % 1 == 0
                  ? Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    )
                  : const SizedBox(),
            );
          },
        ),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }
}
