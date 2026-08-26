local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getCreatorCreditStore = require(parent.DataHydration.CreatorCredit).getCreatorCreditStore
local fFlagBuildExperienceCreatorCreditUsageBadgeModule = require(buildExperience.Flags.FFlagBuildExperienceCreatorCreditUsageBadge)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local iconName = foundationModule.Enums.IconName

local function formatNumber(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p1)), localizationService.RobloxLocaleId)
end

return {
	ITEM_ID = "creator-credit-ai-usage",
	useCreatorCreditMenuItem = function(p1)
		-- upvalues: reactModule (ref), getCreatorCreditStore (ref), signalsReactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (ref), numberLocalization (ref), localizationService (ref), iconName (ref), formatNumber (ref)
		local var1 = if p1 ~= nil then nil else p1.onOpenCreatorCreditPage
		local var2 = reactModule.useCallback(function()
			-- upvalues: var1 (ref)
			if var1 then
				var1()
			end
		end, { var1 })
		local var3 = getCreatorCreditStore(false)
		local var4 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: var3 (ref)
			return var3.getQuotaSummary()
		end, { var3 }).data)
		local var5 = if fFlagBuildLocalization then useLocalization({
			menuItem = localizationStringsModule.CREATOR_CREDIT_MENU_ITEM,
			usage = if var4 == nil then nil elseif fFlagBuildExperienceCreatorCreditUsageBadgeModule and var4.freeTrialPctUsed >= 100 and var4.limitSettings.additionalUsageEnabled then if var4.limitSettings.dailyLimitSet then {
				localizationStringsModule.CREATOR_CREDIT_ROBUX_USAGE,
				USED = numberLocalization.localize(string.format("%.0f", math.floor(var4.robuxSpentToday)), localizationService.RobloxLocaleId),
				LIMIT = numberLocalization.localize(string.format("%.0f", math.floor(var4.limitSettings.dailyLimit)), localizationService.RobloxLocaleId)
			} else {
				localizationStringsModule.CREATOR_CREDIT_USAGE_USED,
				USED = numberLocalization.localize(string.format("%.0f", math.floor(var4.robuxSpentToday)), localizationService.RobloxLocaleId)
			} else {
				localizationStringsModule.CREATOR_CREDIT_PERCENT_USED,
				PERCENT = math.clamp(math.floor(var4.freeTrialPctUsed + 0.5), 0, 100)
			}
		}) else nil
		local var6 = if fFlagBuildLocalization then var5.menuItem else localizationStringsModule.CREATOR_CREDIT_MENU_ITEM
		
		return {
			item = reactModule.useMemo(function()
				-- upvalues: var4 (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (copy), iconName (copy), fFlagBuildLocalization (copy), var5 (ref), localizationStringsModule (copy), numberLocalization (copy), localizationService (copy), formatNumber (copy), var6 (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 15
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
			end, { var4, var5, var6 }),
			activate = var2
		}
	end
}