local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local NumberLocalization = require(Parent.Localization).NumberLocalization
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetCreatorCreditStoreFunction = require(Parent.DataHydration.CreatorCredit).getCreatorCreditStore
local FFlagBuildExperienceCreatorCreditUsageBadgeModule = require(BuildExperience.Flags.FFlagBuildExperienceCreatorCreditUsageBadge)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local IconName = require(Parent.Foundation).Enums.IconName

local function _(Value: number) --[[ Line: 34 | Named "formatNumber" ]]
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(string.format("%.0f", (math.floor(Value))), LocalizationService.RobloxLocaleId)
end

return {
	ITEM_ID = "creator-credit-ai-usage",
	useCreatorCreditMenuItem = function(p1) --[[ Line: 42 ]]
		-- upvalues: ReactModule (copy), GetCreatorCreditStoreFunction (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceCreatorCreditUsageBadgeModule (copy), NumberLocalization (copy), LocalizationService (copy), IconName (copy)
		local OnOpenCreatorCreditPage = if p1 == nil then nil else p1.onOpenCreatorCreditPage
		local UseResult = ReactModule.useCallback(function() --[[ Line: 45 ]]
			-- upvalues: OnOpenCreatorCreditPage (copy)
			if OnOpenCreatorCreditPage then
				OnOpenCreatorCreditPage()
			end
		end, { OnOpenCreatorCreditPage })
		local CreatorCreditStore = GetCreatorCreditStoreFunction(false)
		local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 56 ]]
			-- upvalues: CreatorCreditStore (copy)
			return CreatorCreditStore.getQuotaSummary()
		end, { CreatorCreditStore }).data)
		local UseLocalizationResult = UseLocalizationFunction({
			menuItem = LocalizationStringsModule.CREATOR_CREDIT_MENU_ITEM,
			usage = if UseSignalStateResult == nil then nil elseif FFlagBuildExperienceCreatorCreditUsageBadgeModule and UseSignalStateResult.freeTrialPctUsed >= 100 and UseSignalStateResult.limitSettings.additionalUsageEnabled then if UseSignalStateResult.limitSettings.dailyLimitSet then {
				LocalizationStringsModule.CREATOR_CREDIT_ROBUX_USAGE,
				USED = NumberLocalization.localize(string.format("%.0f", (math.floor(UseSignalStateResult.robuxSpentToday))), LocalizationService.RobloxLocaleId),
				LIMIT = NumberLocalization.localize(string.format("%.0f", (math.floor(UseSignalStateResult.limitSettings.dailyLimit))), LocalizationService.RobloxLocaleId)
			} else {
				LocalizationStringsModule.CREATOR_CREDIT_USAGE_USED,
				USED = NumberLocalization.localize(string.format("%.0f", (math.floor(UseSignalStateResult.robuxSpentToday))), LocalizationService.RobloxLocaleId)
			} else {
				LocalizationStringsModule.CREATOR_CREDIT_PERCENT_USED,
				PERCENT = math.clamp(math.floor(UseSignalStateResult.freeTrialPctUsed + 0.5), 0, 100)
			}
		})
		local MenuItem = UseLocalizationResult.menuItem
		
		return {
			item = ReactModule.useMemo(function() --[[ Line: 84 ]]
				-- upvalues: UseSignalStateResult (copy), FFlagBuildExperienceCreatorCreditUsageBadgeModule (upval), IconName (upval), UseLocalizationResult (copy), MenuItem (copy)
				local Trailing = nil
				
				if UseSignalStateResult ~= nil then
					if FFlagBuildExperienceCreatorCreditUsageBadgeModule then
						local AdditionalUsageEnabled = UseSignalStateResult.freeTrialPctUsed >= 100 and UseSignalStateResult.limitSettings.additionalUsageEnabled
						Trailing = {
							type = "Badge",
							icon = if AdditionalUsageEnabled then IconName.Robux else nil,
							text = UseLocalizationResult.usage or ""
						}
					else
						Trailing = { type = "Hint", text = UseLocalizationResult.usage or "" }
					end
				end
				return {
					id = "creator-credit-ai-usage",
					text = MenuItem,
					trailing = Trailing
				}
			end, { UseSignalStateResult, UseLocalizationResult, MenuItem }),
			activate = UseResult
		}
	end
}