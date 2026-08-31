local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local _ = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.StatsCardView)
local _ = require(buildExperience.Analytics.AnalyticsUnit)
local _ = require(script.Parent.StatsCardValueFormat)
local formatStatNumberModule = require(buildExperience.Analytics.formatStatNumber)
local metricValueRoundsToZeroModule = require(buildExperience.Analytics.metricValueRoundsToZero)
local noDataPlaceholderModule = require(buildExperience.Components.Analytics.noDataPlaceholder)
local templateFor = require(buildExperience.Analytics.metricUnitTemplate).templateFor

return function(p1)
	-- upvalues: localizationService (ref), formatStatNumberModule (ref), templateFor (ref), metricValueRoundsToZeroModule (ref), useLocalization (ref), noDataPlaceholderModule (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var1 = p1.hasData == nil or p1.hasData
	local var2 = formatStatNumberModule(p1.statValue, p1.statUnit, p1.statValueFormat, robloxLocaleId)
	local var3 = templateFor(p1.statUnit)
	local absValue = math.abs(p1.deltaValue)
	local var4 = var1 and (absValue ~= 0 and not metricValueRoundsToZeroModule(absValue, p1.deltaUnit, p1.deltaValueFormat, robloxLocaleId))
	local var5 = if var4 then formatStatNumberModule(absValue, p1.deltaUnit, p1.deltaValueFormat, robloxLocaleId) else nil
	local var6 = templateFor(p1.deltaUnit)
	local t = {}
	
	if var1 and var3 ~= nil then
		t.statText = { var3, number = var2 }
	end
	if var4 and var6 ~= nil then
		t.deltaText = { var6, number = var5 }
	end
	local var7 = useLocalization(t)
	
	return {
		title = p1.title,
		statText = if not var1 then noDataPlaceholderModule elseif var3 == nil then var2 else var7.statText,
		statIcon = if var1 then p1.statIcon else nil,
		statIconPosition = p1.statIconPosition,
		deltaText = if var4 then if var6 == nil then var5 else var7.deltaText else nil,
		deltaIcon = p1.deltaIcon,
		deltaIconPosition = p1.deltaIconPosition,
		isDeltaPositive = var1 and p1.deltaValue > 0,
		isLoading = p1.isLoading == true,
		isSelected = p1.isSelected,
		onActivated = p1.onActivated,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end