local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local AnalyticsMetricChartModule = require(Parent.AnalyticsMetricChart)
local ReactModule = require(Parent.React)
local UseMetricChartContentModule = require(script.Parent.useMetricChartContent)
local UseMetricChartViewModelModule = require(script.Parent.useMetricChartViewModel)
local FFlagBuildAnalyticsSharedMetricChartModule = require(BuildExperience.Flags.FFlagBuildAnalyticsSharedMetricChart)

return function(p1)
	-- upvalues: FFlagBuildAnalyticsSharedMetricChartModule (copy), UseMetricChartContentModule (copy), ReactModule (copy), AnalyticsMetricChartModule (copy), UseMetricChartViewModelModule (copy)
	return if FFlagBuildAnalyticsSharedMetricChartModule then ReactModule.createElement(AnalyticsMetricChartModule.MetricChart, (UseMetricChartContentModule(p1))) else ReactModule.createElement(AnalyticsMetricChartModule.MetricChartView, (UseMetricChartViewModelModule(p1)))
end