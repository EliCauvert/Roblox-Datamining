local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local PerformFetch = require(Parent.Http).PerformFetch
local PromiseModule = require(Parent.Promise)
local ToastRoduxModule = require(Parent.ToastRodux)
local AVATAREDITORCONSTANTS = AvatarExperienceCommonModule.Constants.AVATAR_EDITOR_CONSTANTS
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local Constants = AvatarExperienceAnalyticsModule.Constants
local GetGearAssetIdFromStateFunction = AvatarExperienceCommonModule.Utils.getGearAssetIdFromState
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = AvatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local ReportAvatarEventCounterV1Function = AvatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local FIntAXLookOutfitCreationDelayMs = require(Parent.AvatarExperienceFlags).FIntAXLookOutfitCreationDelayMs
local config = {
	toastMessage = "Feature.Avatar.Message.InvalidName",
	isLocalized = false,
	toastType = ToastType.InformationMessage
}
local config1 = {
	toastMessage = "Feature.Avatar.Message.ReachedMaxOutfits",
	isLocalized = false,
	toastType = ToastType.InformationMessage
}
local config2 = {
	toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingOutfit",
	isLocalized = false,
	toastType = ToastType.InformationMessage
}

return function(Name, Callback, p1, Callback1) --[[ Line: 41 ]]
	-- upvalues: PerformFetch (copy), AVATAREDITORCONSTANTS (copy), GetGearAssetIdFromStateFunction (copy), FIntAXLookOutfitCreationDelayMs (copy), PromiseModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), Constants (copy), ReportAvatarEventCounterV1Function (copy), SetCurrentToastMessageFunction (copy), config (copy), config1 (copy), config2 (copy)
	return function(p2, p3) --[[ Line: 47 ]]
		-- upvalues: PerformFetch (upval), AVATAREDITORCONSTANTS (upval), GetGearAssetIdFromStateFunction (upval), Callback (copy), p1 (copy), FIntAXLookOutfitCreationDelayMs (upval), PromiseModule (upval), Name (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), Constants (upval), ReportAvatarEventCounterV1Function (upval), Callback1 (copy), SetCurrentToastMessageFunction (upval), config (upval), config1 (upval), config2 (upval)
		local AvatarEditorService = p3.avatarEditorService
		
		return PerformFetch.Single(AVATAREDITORCONSTANTS.CreateOutfitKey, function(p4) --[[ Line: 49 ]]
			-- upvalues: GetGearAssetIdFromStateFunction (upval), Callback (upval), p1 (upval), FIntAXLookOutfitCreationDelayMs (upval), PromiseModule (upval), AvatarEditorService (copy), Name (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), Constants (upval), ReportAvatarEventCounterV1Function (upval), Callback1 (upval), SetCurrentToastMessageFunction (upval), config (upval), config1 (upval), config2 (upval)
			local State = p4:getState()
			local HumanoidRigTypeEntry = Enum.HumanoidRigType[State.AvatarExperience.AvatarEditor.Character.AvatarType]
			local GearAssetIdFromState = GetGearAssetIdFromStateFunction(State.AvatarExperience)
			local CallbackResult = Callback(State, p1)
			task.spawn(function() --[[ Line: 59 ]]
				-- upvalues: FIntAXLookOutfitCreationDelayMs (upval), PromiseModule (upval), AvatarEditorService (upval), CallbackResult (copy), HumanoidRigTypeEntry (copy), Name (upval), GearAssetIdFromState (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), Constants (upval), ReportAvatarEventCounterV1Function (upval), Callback1 (upval), p4 (copy), SetCurrentToastMessageFunction (upval), config (upval), config1 (upval), config2 (upval)
				task.wait(FIntAXLookOutfitCreationDelayMs / 1000)
				PromiseModule.new(function(Callback: () -> (), Callback2: () -> ()) --[[ Line: 63 ]]
					-- upvalues: AvatarEditorService (upval), CallbackResult (upval), HumanoidRigTypeEntry (upval), Name (upval), GearAssetIdFromState (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), Constants (upval), ReportAvatarEventCounterV1Function (upval), Callback1 (upval), p4 (upval), SetCurrentToastMessageFunction (upval), config (upval), config1 (upval), config2 (upval)
					local NoPromptCreateOutfitResult = AvatarEditorService:NoPromptCreateOutfit(CallbackResult, HumanoidRigTypeEntry, Name, GearAssetIdFromState)
					while not NoPromptCreateOutfitResult do
						AvatarEditorService.PromptCreateOutfitCompleted:Wait()
						NoPromptCreateOutfitResult = AvatarEditorService:NoPromptCreateOutfit(CallbackResult, HumanoidRigTypeEntry, Name, 0)
						ReportAvatarEventCounterNoAnalyticsArgumentFunction(Constants.AVATAR_EDITOR_SERVICE_ERRORS.NoPromptCreateOutfit)
					end
					local Result, FailureType = AvatarEditorService.PromptCreateOutfitCompleted:Wait()
					
					if Result == Enum.AvatarPromptResult.Success then
						ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXCreateCostume)
						Callback1()
						Callback()
						
						return
					end
					if FailureType == Enum.CreateOutfitFailure.InvalidName then
						p4:dispatch(SetCurrentToastMessageFunction(config))
					elseif FailureType == Enum.CreateOutfitFailure.OutfitLimitReached then
						p4:dispatch(SetCurrentToastMessageFunction(config1))
					elseif FailureType == Enum.CreateOutfitFailure.Other then
						p4:dispatch(SetCurrentToastMessageFunction(config2))
					end
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(Constants.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit)
					Callback2()
				end)
			end)
			
			return PromiseModule.resolve()
		end)(p2):catch(function(_) --[[ Line: 110 ]] end)
	end
end