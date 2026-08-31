local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local metricChartViewModule = require(script.Parent.MetricChartView)
local useMetricChartViewModelModule = require(script.Parent.useMetricChartViewModel)

return function(p1)
	-- upvalues: useMetricChartViewModelModule (ref), reactModule (ref), metricChartViewModule (ref)
	return reactModule.createElement(metricChartViewModule, useMetricChartViewModelModule(p1))
end