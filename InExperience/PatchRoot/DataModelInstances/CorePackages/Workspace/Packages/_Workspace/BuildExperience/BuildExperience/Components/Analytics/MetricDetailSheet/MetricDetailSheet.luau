local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local MetricDetailSheetViewModule = require(script.Parent.MetricDetailSheetView)
local UseMetricDetailSheetViewModelModule = require(script.Parent.useMetricDetailSheetViewModel)

return function(p1) --[[ Line: 11 | Named "MetricDetailSheet" ]]
	-- upvalues: UseMetricDetailSheetViewModelModule (copy), ReactModule (copy), MetricDetailSheetViewModule (copy)
	return ReactModule.createElement(MetricDetailSheetViewModule, (UseMetricDetailSheetViewModelModule(p1)))
end