local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getCreatorCreditStore = require(parent.DataHydration.CreatorCredit).getCreatorCreditStore
local fFlagBuildExperienceCreatorCreditUsageBadgeModule = require(buildExperience.Flags.FFlagBuildExperienceCreatorCreditUsageBadge)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local iconName = foundationModule.Enums.IconName

local function formatNumber(p0) --[[ line: 33 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p0)), localizationService.RobloxLocaleId)
end

return {
	ITEM_ID = "creator-credit-ai-usage",
	useCreatorCreditMenuItem = function(p1) --[[ line: 41 ]]
		-- upvalues: reactModule (ref), getCreatorCreditStore (ref), signalsReactModule (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (ref), iconName (ref), localizationStringsModule (ref), numberLocalization (ref), localizationService (ref), formatNumber (ref)
		local var8 = if p1 ~= nil then nil else p1.onOpenCreatorCreditPage
		local var9 = reactModule.useCallback(function() --[[ line: 44 ]]
			-- upvalues: var8 (ref)
			if var8 then
				var8()
			end
		end, { var8 })
		local var10 = getCreatorCreditStore(false)
		local var11 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 55 ]]
			-- upvalues: var10 (ref)
			return var10.getQuotaSummary()
		end, { var10 }).data)
		
		return {
			item = reactModule.useMemo(function() --[[ line: 60 ]]
				-- upvalues: var11 (ref), fFlagBuildExperienceCreatorCreditUsageBadgeModule (copy), iconName (copy), localizationStringsModule (copy), numberLocalization (copy), localizationService (copy), formatNumber (copy)
				local t = nil
				
				if var11 ~= nil then
					if fFlagBuildExperienceCreatorCreditUsageBadgeModule then
						local var13 = var11.freeTrialPctUsed >= 100 and var11.limitSettings.additionalUsageEnabled
						t = {
							type = "Badge",
							icon = if var13 then iconName.Robux else nil,
							text = if var13 then if var11.limitSettings.dailyLimitSet then localizationStringsModule.formatCreatorCreditRobuxUsage(numberLocalization.localize(string.format("%.0f", math.floor(var11.robuxSpentToday)), localizationService.RobloxLocaleId), formatNumber(var11.limitSettings.dailyLimit)) else localizationStringsModule.formatCreatorCreditRobuxUsageUnlimited(formatNumber(var11.robuxSpentToday)) else localizationStringsModule.formatCreatorCreditPercentUsed(var11.freeTrialPctUsed)
						}
					else
						t = {
							type = "Hint",
							text = localizationStringsModule.formatCreatorCreditPercentUsed(var11.freeTrialPctUsed)
						}
					end
				end
				return {
					id = "creator-credit-ai-usage",
					text = localizationStringsModule.CREATOR_CREDIT_MENU_ITEM,
					trailing = t
				}
			end, { var11 }),
			activate = var9
		}
	end
}