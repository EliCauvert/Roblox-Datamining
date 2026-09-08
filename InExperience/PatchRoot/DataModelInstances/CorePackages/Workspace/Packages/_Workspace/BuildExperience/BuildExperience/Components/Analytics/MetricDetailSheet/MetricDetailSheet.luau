local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local metricDetailSheetViewModule = require(script.Parent.MetricDetailSheetView)
local useMetricDetailSheetViewModelModule = require(script.Parent.useMetricDetailSheetViewModel)

return function(p1)
	-- upvalues: useMetricDetailSheetViewModelModule (ref), reactModule (ref), metricDetailSheetViewModule (ref)
	return reactModule.createElement(metricDetailSheetViewModule, useMetricDetailSheetViewModelModule(p1))
end