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

local function formatNumber(p0) --[[ line: 36 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p0)), localizationService.RobloxLocaleId)
end

return {
	ITEM_ID = "creator-credit-ai-usage",
	useCreatorCreditMenuItem = function(p1) --[[ line: 44 ]]
		-- upvalues: reactModule (ref), getCreatorCreditStore (ref), signalsReactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (ref), numberLocalization (ref), localizationService (ref), iconName (ref), formatNumber (ref)
		local var9 = if p1 ~= nil then nil else p1.onOpenCreatorCreditPage
		local var10 = reactModule.useCallback(function() --[[ line: 47 ]]
			-- upvalues: var9 (ref)
			if var9 then
				var9()
			end
		end, { var9 })
		local var11 = getCreatorCreditStore(false)
		local var12 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 58 ]]
			-- upvalues: var11 (ref)
			return var11.getQuotaSummary()
		end, { var11 }).data)
		local var13 = if fFlagBuildLocalization then useLocalization({
			menuItem = localizationStringsModule.CREATOR_CREDIT_MENU_ITEM,
			usage = if var12 == nil then nil elseif fFlagBuildExperienceCreatorCreditUsageBadgeModule and var12.freeTrialPctUsed >= 100 and var12.limitSettings.additionalUsageEnabled then if var12.limitSettings.dailyLimitSet then {
				localizationStringsModule.CREATOR_CREDIT_ROBUX_USAGE,
				USED = numberLocalization.localize(string.format("%.0f", math.floor(var12.robuxSpentToday)), localizationService.RobloxLocaleId),
				LIMIT = numberLocalization.localize(string.format("%.0f", math.floor(var12.limitSettings.dailyLimit)), localizationService.RobloxLocaleId)
			} else {
				localizationStringsModule.CREATOR_CREDIT_USAGE_USED,
				USED = numberLocalization.localize(string.format("%.0f", math.floor(var12.robuxSpentToday)), localizationService.RobloxLocaleId)
			} else {
				localizationStringsModule.CREATOR_CREDIT_PERCENT_USED,
				PERCENT = math.clamp(math.floor(var12.freeTrialPctUsed + 0.5), 0, 100)
			}
		}) else nil
		local var14 = if fFlagBuildLocalization then var13.menuItem else localizationStringsModule.CREATOR_CREDIT_MENU_ITEM
		
		return {
			item = reactModule.useMemo(function() --[[ line: 90 ]]
				-- upvalues: var12 (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (copy), iconName (copy), fFlagBuildLocalization (copy), var13 (ref), localizationStringsModule (copy), numberLocalization (copy), localizationService (copy), formatNumber (copy), var14 (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 15
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
			end, { var12, var13, var14 }),
			activate = var10
		}
	end
}