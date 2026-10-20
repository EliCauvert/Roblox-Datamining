local BuildExperience = script:FindFirstAncestor("BuildExperience")
local NumberLocalization = require(BuildExperience.Parent.Localization).NumberLocalization
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local RoundToDecimalsModule = require(BuildExperience.Analytics.roundToDecimals)

local function formatNumber(p1, p2, p3)
	-- upvalues: NumberLocalization (copy)
	return if p2 == "Regular" then NumberLocalization.localizeDecimal(p1, p3, 2) else NumberLocalization.abbreviate(p1, p3)
end

return function(p1: number, Minutes, p2, p3)
	-- upvalues: AnalyticsUnitModule (copy), NumberLocalization (copy), formatNumber (copy), RoundToDecimalsModule (copy)
	if Minutes == AnalyticsUnitModule.Minutes then
		return NumberLocalization.localizeDecimal(p1, p3, 2)
	elseif Minutes == AnalyticsUnitModule.Percent then
		return formatNumber(p1 * 100, p2, p3)
	elseif Minutes == AnalyticsUnitModule.Temporal then
		local Value = p1 / 60
		
		return if math.abs(Value) < 1 then NumberLocalization.localizeDecimal(RoundToDecimalsModule(Value, 2), p3, 2) else formatNumber(RoundToDecimalsModule(Value, 1), p2, p3)
	else
		return formatNumber(p1, p2, p3)
	end
end