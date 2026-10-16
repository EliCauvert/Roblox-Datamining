local buildExperience = script:FindFirstAncestor("BuildExperience")
local numberLocalization = require(buildExperience.Parent.Localization).NumberLocalization
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local formatStatNumberModule = require(buildExperience.Analytics.formatStatNumber)
local fillTemplate = require(buildExperience.Analytics.metricUnitTemplate).fillTemplate

local function formatNumber(p1, p2, p3, p4)
	-- upvalues: formatStatNumberModule (ref), analyticsUnitModule (ref), numberLocalization (ref)
	return if p4 == "Full" then if p2 == analyticsUnitModule.Percent then numberLocalization.localizeDecimal(p1 * 100, p3, 2) elseif p2 == analyticsUnitModule.Temporal then numberLocalization.localizeDecimal(p1 / 60, p3, 2) else numberLocalization.localizeDecimal(p1, p3, if p1 == math.floor(p1) then 0 else 2) else formatStatNumberModule(p1, p2, "Abbreviated", p3)
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: formatNumber (ref), analyticsUnitModule (ref), fillTemplate (ref)
	local var1 = formatNumber(p1, p2, p3, p5)
	
	return if p2 == analyticsUnitModule.Percent then fillTemplate(p4.percent, var1) elseif p2 == analyticsUnitModule.Temporal then fillTemplate(p4.duration, var1) else var1
end