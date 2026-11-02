local ReactModule = require(script:FindFirstAncestor("AnalyticsMetricChart").Parent.React)
local _ = require(script.Parent.MetricChartTypes)
local MetricChartViewModule = require(script.Parent.MetricChartView)
local UseMetricChartViewModelModule = require(script.Parent.useMetricChartViewModel)

return function(p1)
	-- upvalues: UseMetricChartViewModelModule (copy), ReactModule (copy), MetricChartViewModule (copy)
	return ReactModule.createElement(MetricChartViewModule, (UseMetricChartViewModelModule(p1)))
end