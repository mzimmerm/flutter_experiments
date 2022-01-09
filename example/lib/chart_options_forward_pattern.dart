import 'package:flutter/foundation.dart' show immutable;

main() {
  // Shows how a pattern where the base class is at the same time wrapped in extensions,
  // allows to create extensions with only setting the values that change from defaults.
  
  // Create the Default LineChartOptions
  var lineChartOptions = LineChartOptions();

  // Create LineChartOptions with some non-default piece in ChartOptions.
  // No need to repeat non-default values, just forward the whole non-default ChartOptions to the wrapper/extended.
  var chartOptionsNoLegend = const ChartOptions(
    legendOptions: LegendOptions(isLegendContainerShown: false),
  );
  var lineChartOptionsNoLegend = LineChartOptions(
    chartOptions: chartOptionsNoLegend,
  );

  //  Create LineChartOptions with some non-default piece in it's member.
  var lineChartOptionsBiggerCircle = LineChartOptions(
    hotspotInnerRadius: 200.9,
  );
}

////////////////////////////////////////////////////////// Base class which is also wrapped in extensions
/// Options which are both based class of extensions, as well as wrapped in extensions.
/// Makes for easy way to construct extensions without repeating members.
@immutable
class ChartOptions {
  final LegendOptions legendOptions;
  final LabelCommonOptions labelCommonOptions;

  const ChartOptions({
    this.legendOptions = const LegendOptions(),
    this.labelCommonOptions = const LabelCommonOptions(),
  });

  /// Convenience constructor sets all values to default except labels and gridlines are defined not to show.
  const ChartOptions.noLabels()
      : this(
          legendOptions: const LegendOptions(
            isLegendContainerShown: false,
          ),
        );
}

@immutable
class LegendOptions {
  /// Manages showing the legend container on the chart.
  final bool isLegendContainerShown;

  const LegendOptions({
    this.isLegendContainerShown = true,
  });
}

@immutable
class LabelCommonOptions {
  final double labelFontSize;

  const LabelCommonOptions({
    this.labelFontSize = 14.0,
  });
}

////////////////////////////////////////

@immutable
// todo-00-last class LineChartOptions extends ChartOptions {
class LineChartOptions extends ChartOptions {
  /// Control the look of the circle on line chart
  final double hotspotInnerRadius;

  /// Constructor with default values; super values can be set by passing an instantiated [ChartOptions] super.
  LineChartOptions({
    // This LineChartOptions constructor Cannot be const due to compile error in
    //   'legendOptions: chartOptions.legendOptions': chartOptions.legendOptions is not constant.
    //   I assume at compile time even the member reference dot (.) can not be done.
    // Forward an instance which values will be set on super
    ChartOptions chartOptions = const ChartOptions(),
    this.hotspotInnerRadius = 3.0,
  }) : super(
          legendOptions: chartOptions.legendOptions,
          labelCommonOptions: chartOptions.labelCommonOptions,
        );

  /// Constructor with default values except no labels.
  LineChartOptions.noLabels()
      : this(
          chartOptions: const ChartOptions.noLabels(),
        );
}
