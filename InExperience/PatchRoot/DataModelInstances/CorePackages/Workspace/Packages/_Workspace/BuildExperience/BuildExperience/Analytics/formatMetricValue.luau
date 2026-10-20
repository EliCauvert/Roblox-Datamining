local BuildExperience = script:FindFirstAncestor("BuildExperience")
local NumberLocalization = require(BuildExperience.Parent.Localization).NumberLocalization
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local FormatStatNumberModule = require(BuildExperience.Analytics.formatStatNumber)
local FillTemplateFunction = require(BuildExperience.Analytics.metricUnitTemplate).fillTemplate

local function formatNumber(Value: number, Minutes, p1, p2)
	-- upvalues: FormatStatNumberModule (copy), AnalyticsUnitModule (copy), NumberLocalization (copy)
	return if p2 == "Full" then if Minutes == AnalyticsUnitModule.Percent then NumberLocalization.localizeDecimal(Value * 100, p1, 2) elseif Minutes == AnalyticsUnitModule.Temporal then NumberLocalization.localizeDecimal(Value / 60, p1, 2) else NumberLocalization.localizeDecimal(Value, p1, if Value == math.floor(Value) then 0 else 2) else FormatStatNumberModule(Value, Minutes, "Abbreviated", p1)
end

return function(p1, Minutes, p2, p3, p4)
	-- upvalues: formatNumber (copy), AnalyticsUnitModule (copy), FillTemplateFunction (copy)
	local FormatNumberResult = formatNumber(p1, Minutes, p2, p4)
	
	return if Minutes == AnalyticsUnitModule.Percent then FillTemplateFunction(p3.percent, FormatNumberResult) elseif Minutes == AnalyticsUnitModule.Temporal or Minutes == AnalyticsUnitModule.Minutes then FillTemplateFunction(p3.duration, FormatNumberResult) else FormatNumberResult
end