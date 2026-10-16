local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local _ = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.StatsCardView)
local _ = require(BuildExperience.Analytics.AnalyticsUnit)
local _ = require(script.Parent.StatsCardValueFormat)
local FormatStatNumberModule = require(BuildExperience.Analytics.formatStatNumber)
local MetricValueRoundsToZeroModule = require(BuildExperience.Analytics.metricValueRoundsToZero)
local NoDataPlaceholderModule = require(BuildExperience.Components.Analytics.noDataPlaceholder)
local TemplateForFunction = require(BuildExperience.Analytics.metricUnitTemplate).templateFor

return function(p1) --[[ Line: 46 | Named "useStatsCardViewModel" ]]
	-- upvalues: LocalizationService (copy), FormatStatNumberModule (copy), TemplateForFunction (copy), MetricValueRoundsToZeroModule (copy), UseLocalizationFunction (copy), NoDataPlaceholderModule (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local NoHasData = p1.hasData == nil or p1.hasData
	local FormatStatNumberModuleResult = FormatStatNumberModule(p1.statValue, p1.statUnit, p1.statValueFormat, RobloxLocaleId)
	local TemplateForResult = TemplateForFunction(p1.statUnit)
	local Magnitude = math.abs(p1.deltaValue)
	local Inverted: boolean = NoHasData and (Magnitude ~= 0 and not MetricValueRoundsToZeroModule(Magnitude, p1.deltaUnit, p1.deltaValueFormat, RobloxLocaleId))
	local FormatStatNumberModuleResult1 = if Inverted then FormatStatNumberModule(Magnitude, p1.deltaUnit, p1.deltaValueFormat, RobloxLocaleId) else nil
	local TemplateForResult1 = TemplateForFunction(p1.deltaUnit)
	local t = {}
	
	if NoHasData and TemplateForResult ~= nil then
		t.statText = { TemplateForResult, number = FormatStatNumberModuleResult }
	end
	if Inverted and TemplateForResult1 ~= nil then
		t.deltaText = {
			TemplateForResult1,
			number = FormatStatNumberModuleResult1
		}
	end
	local UseLocalizationResult = UseLocalizationFunction(t)
	
	return {
		title = p1.title,
		statText = if NoHasData then if TemplateForResult == nil then FormatStatNumberModuleResult else UseLocalizationResult.statText else NoDataPlaceholderModule,
		statIcon = if NoHasData then p1.statIcon else nil,
		statIconPosition = p1.statIconPosition,
		deltaText = if Inverted then if TemplateForResult1 == nil then FormatStatNumberModuleResult1 else UseLocalizationResult.deltaText else nil,
		deltaIcon = p1.deltaIcon,
		deltaIconPosition = p1.deltaIconPosition,
		isDeltaPositive = NoHasData and p1.deltaValue > 0,
		isLoading = p1.isLoading == true,
		isSelected = p1.isSelected,
		onActivated = p1.onActivated,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end