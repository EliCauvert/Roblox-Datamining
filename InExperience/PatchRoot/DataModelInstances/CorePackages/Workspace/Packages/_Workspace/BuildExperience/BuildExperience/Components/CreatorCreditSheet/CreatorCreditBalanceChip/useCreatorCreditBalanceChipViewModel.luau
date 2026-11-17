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
local FFlagBuildExperienceAdsAndRobuxTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceAdsAndRobuxTelemetry)
local GetBuildCreatorCreditRefreshStoreModule = require(BuildExperience.Stores.GetBuildCreatorCreditRefreshStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

local function _(Value: number)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(string.format("%.0f", (math.floor(Value))), LocalizationService.RobloxLocaleId)
end

return function()
	-- upvalues: CreatorCreditModule (copy), ReactModule (copy), SignalsReactModule (copy), FFlagBuildExperienceModelPickerModule (copy), GetBuildCreatorCreditRefreshStoreModule (copy), UseOpenBuyRobuxWebViewModule (copy), FFlagBuildExperienceAdsAndRobuxTelemetryModule (copy), SendBuildExperienceEventModule (copy), NumberLocalization (copy), LocalizationService (copy)
	local CreatorCreditStore = CreatorCreditModule.getCreatorCreditStore(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: CreatorCreditStore (copy)
		return CreatorCreditStore.getQuotaSummary()
	end, { CreatorCreditStore }).data)
	local UseOpenBuyRobuxWebViewModuleResult = UseOpenBuyRobuxWebViewModule((ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceModelPickerModule (upval), GetBuildCreatorCreditRefreshStoreModule (upval), CreatorCreditStore (copy)
		if FFlagBuildExperienceModelPickerModule then
			GetBuildCreatorCreditRefreshStoreModule(false).refresh()
			
			return
		else
			CreatorCreditStore.refreshQuotaSummary():catch(function() end)
		end
	end, { CreatorCreditStore })))
	local UseResult = if FFlagBuildExperienceAdsAndRobuxTelemetryModule then ReactModule.useCallback(function()
		-- upvalues: SendBuildExperienceEventModule (upval), UseOpenBuyRobuxWebViewModuleResult (copy)
		SendBuildExperienceEventModule("BUY_ROBUX_CLICK", {}, {
			context = "creator_credit_balance_chip",
			isInExperience = if game.GameId == 0 then "false" else "true"
		})
		UseOpenBuyRobuxWebViewModuleResult()
	end, { UseOpenBuyRobuxWebViewModuleResult }) else nil
	
	return {
		balanceText = if UseSignalStateResult == nil then nil else NumberLocalization.localize(string.format("%.0f", (math.floor(UseSignalStateResult.robuxBalance))), LocalizationService.RobloxLocaleId),
		onActivated = if FFlagBuildExperienceAdsAndRobuxTelemetryModule and UseResult ~= nil then UseResult else UseOpenBuyRobuxWebViewModuleResult
	}
end