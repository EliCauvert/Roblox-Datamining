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
		-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), getCreatorCreditStore (ref), signalsReactModule (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (ref), iconName (ref), numberLocalization (ref), localizationService (ref), formatNumber (ref)
		local var9 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
			menuItem = localizationStringsModule.CREATOR_CREDIT_MENU_ITEM
		}) else nil).menuItem else localizationStringsModule.CREATOR_CREDIT_MENU_ITEM
		local var10 = if p1 ~= nil then nil else p1.onOpenCreatorCreditPage
		local var11 = reactModule.useCallback(function() --[[ line: 55 ]]
			-- upvalues: var10 (ref)
			if var10 then
				var10()
			end
		end, { var10 })
		local var12 = getCreatorCreditStore(false)
		local var13 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 66 ]]
			-- upvalues: var12 (ref)
			return var12.getQuotaSummary()
		end, { var12 }).data)
		
		return {
			item = reactModule.useMemo(function() --[[ line: 71 ]]
				-- upvalues: var13 (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (copy), iconName (copy), localizationStringsModule (copy), numberLocalization (copy), localizationService (copy), formatNumber (copy), var9 (ref)
				local t = nil
				
				if var13 ~= nil then
					if fFlagBuildExperienceCreatorCreditUsageBadgeModule then
						local var15 = var13.freeTrialPctUsed >= 100 and var13.limitSettings.additionalUsageEnabled
						t = {
							type = "Badge",
							icon = if var15 then iconName.Robux else nil,
							text = if var15 then if var13.limitSettings.dailyLimitSet then localizationStringsModule.formatCreatorCreditRobuxUsage(numberLocalization.localize(string.format("%.0f", math.floor(var13.robuxSpentToday)), localizationService.RobloxLocaleId), formatNumber(var13.limitSettings.dailyLimit)) else localizationStringsModule.formatCreatorCreditRobuxUsageUnlimited(formatNumber(var13.robuxSpentToday)) else localizationStringsModule.formatCreatorCreditPercentUsed(var13.freeTrialPctUsed)
						}
					else
						t = {
							type = "Hint",
							text = localizationStringsModule.formatCreatorCreditPercentUsed(var13.freeTrialPctUsed)
						}
					end
				end
				return {
					id = "creator-credit-ai-usage",
					text = var9,
					trailing = t
				}
			end, { var13, var9 }),
			activate = var11
		}
	end
}