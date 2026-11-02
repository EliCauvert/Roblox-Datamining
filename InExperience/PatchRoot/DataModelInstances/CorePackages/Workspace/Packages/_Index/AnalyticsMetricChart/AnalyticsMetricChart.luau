local _ = require(script.Components.MetricChart.MetricChartTypes)

return {
	MetricChart = require(script.Components.MetricChart.MetricChart),
	MetricChartView = require(script.Components.MetricChart.MetricChartView),
	deriveChartAxes = require(script.Utils.deriveChartAxes),
	chartLayout = require(script.Components.MetricChart.chartLayout),
	["jest.config"] = script["jest.config"]
}