local buildExperience = script:FindFirstAncestor("BuildExperience")
local numberLocalization = require(buildExperience.Parent.Localization).NumberLocalization
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local roundToDecimalsModule = require(buildExperience.Analytics.roundToDecimals)

local function formatNumber(p1, p2, p3)
	-- upvalues: numberLocalization (ref)
	return if p2 == "Regular" then numberLocalization.localizeDecimal(p1, p3, 2) else numberLocalization.abbreviate(p1, p3)
end

return function(p1, p2, p3, p4)
	-- upvalues: analyticsUnitModule (ref), numberLocalization (ref), formatNumber (ref), roundToDecimalsModule (ref)
	if p2 == analyticsUnitModule.Minutes then
		return numberLocalization.localizeDecimal(p1, p4, 2)
	elseif p2 == analyticsUnitModule.Percent then
		return formatNumber(p1 * 100, p3, p4)
	elseif p2 ~= analyticsUnitModule.Temporal then
		return formatNumber(p1, p3, p4)
	end
	local var1 = p1 / 60
	
	return if math.abs(var1) < 1 then numberLocalization.localizeDecimal(roundToDecimalsModule(var1, 2), p4, 2) else formatNumber(roundToDecimalsModule(var1, 1), p3, p4)
end