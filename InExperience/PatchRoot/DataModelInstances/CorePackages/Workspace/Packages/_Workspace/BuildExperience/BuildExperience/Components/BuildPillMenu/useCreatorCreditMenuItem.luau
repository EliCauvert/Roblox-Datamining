local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getCreatorCreditStore = require(parent.DataHydration.CreatorCredit).getCreatorCreditStore
local fFlagBuildExperienceCreatorCreditUsageBadgeModule = require(buildExperience.Flags.FFlagBuildExperienceCreatorCreditUsageBadge)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local iconName = foundationModule.Enums.IconName

local function _(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p1)), localizationService.RobloxLocaleId)
end

return {
	ITEM_ID = "creator-credit-ai-usage",
	useCreatorCreditMenuItem = function(p1)
		-- upvalues: reactModule (ref), getCreatorCreditStore (ref), signalsReactModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (ref), numberLocalization (ref), localizationService (ref), iconName (ref)
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
		local var5 = useLocalization({
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
		})
		local menuItem = var5.menuItem
		
		return {
			item = reactModule.useMemo(function()
				-- upvalues: var4 (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (copy), iconName (copy), var5 (ref), menuItem (ref)
				return {
					id = "creator-credit-ai-usage",
					text = menuItem,
					trailing = if var4 ~= nil then if fFlagBuildExperienceCreatorCreditUsageBadgeModule then {
						type = "Badge",
						icon = if var4.freeTrialPctUsed >= 100 and var4.limitSettings.additionalUsageEnabled then iconName.Robux else nil,
						text = var5.usage or ""
					} else { type = "Hint", text = var5.usage or "" } else nil
				}
			end, { var4, var5, menuItem }),
			activate = var2
		}
	end
}