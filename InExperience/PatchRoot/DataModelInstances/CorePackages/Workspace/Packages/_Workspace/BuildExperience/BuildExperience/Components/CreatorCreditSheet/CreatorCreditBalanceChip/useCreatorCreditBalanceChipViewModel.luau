local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local CreatorCreditModule = require(Parent.DataHydration.CreatorCredit)
local NumberLocalization = require(Parent.Localization).NumberLocalization
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.CreatorCreditBalanceChipView)
local UseOpenBuyRobuxWebViewModule = require(script.Parent.Parent.useOpenBuyRobuxWebView)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local GetBuildCreatorCreditRefreshStoreModule = require(BuildExperience.Stores.GetBuildCreatorCreditRefreshStore)

local function _(Value: number)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(string.format("%.0f", (math.floor(Value))), LocalizationService.RobloxLocaleId)
end

return function()
	-- upvalues: CreatorCreditModule (copy), ReactModule (copy), SignalsReactModule (copy), FFlagBuildExperienceModelPickerModule (copy), GetBuildCreatorCreditRefreshStoreModule (copy), UseOpenBuyRobuxWebViewModule (copy), NumberLocalization (copy), LocalizationService (copy)
	local CreatorCreditStore = CreatorCreditModule.getCreatorCreditStore(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: CreatorCreditStore (copy)
		return CreatorCreditStore.getQuotaSummary()
	end, { CreatorCreditStore }).data)
	
	return {
		balanceText = if UseSignalStateResult == nil then nil else NumberLocalization.localize(string.format("%.0f", (math.floor(UseSignalStateResult.robuxBalance))), LocalizationService.RobloxLocaleId),
		onActivated = UseOpenBuyRobuxWebViewModule((ReactModule.useCallback(function()
			-- upvalues: FFlagBuildExperienceModelPickerModule (upval), GetBuildCreatorCreditRefreshStoreModule (upval), CreatorCreditStore (copy)
			if FFlagBuildExperienceModelPickerModule then
				GetBuildCreatorCreditRefreshStoreModule(false).refresh()
				
				return
			else
				CreatorCreditStore.refreshQuotaSummary():catch(function() end)
			end
		end, { CreatorCreditStore })))
	}
end