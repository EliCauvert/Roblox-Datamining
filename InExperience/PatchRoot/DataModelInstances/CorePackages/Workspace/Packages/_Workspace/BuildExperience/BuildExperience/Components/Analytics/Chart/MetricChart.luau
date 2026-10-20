local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local MetricChartViewModule = require(script.Parent.MetricChartView)
local UseMetricChartViewModelModule = require(script.Parent.useMetricChartViewModel)

return function(p1)
	-- upvalues: UseMetricChartViewModelModule (copy), ReactModule (copy), MetricChartViewModule (copy)
	return ReactModule.createElement(MetricChartViewModule, (UseMetricChartViewModelModule(p1)))
end