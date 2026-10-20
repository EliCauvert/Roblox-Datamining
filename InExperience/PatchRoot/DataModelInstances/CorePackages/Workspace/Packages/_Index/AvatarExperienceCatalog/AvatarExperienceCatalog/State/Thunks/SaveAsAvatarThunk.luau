local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local PerformFetch = require(Parent.Http).PerformFetch
local PromiseModule = require(Parent.Promise)
local ToastRoduxModule = require(Parent.ToastRodux)
local AVATAREDITORCONSTANTS = AvatarExperienceCommonModule.Constants.AVATAR_EDITOR_CONSTANTS
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local Constants = AvatarExperienceAnalyticsModule.Constants
local AVATAREDITORSERVICECOUNTERSTATUS = Constants.AVATAR_EDITOR_SERVICE_COUNTER_STATUS
local GetGearAssetIdFromStateFunction = AvatarExperienceCommonModule.Utils.getGearAssetIdFromState
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = AvatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local ReportAvatarEditorServiceCounterFunction = AvatarExperienceAnalyticsModule.reportAvatarEditorServiceCounter
local ReportAvatarEventCounterV1Function = AvatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local FIntAXLookOutfitCreationDelayMs = AvatarExperienceFlagsModule.FIntAXLookOutfitCreationDelayMs
local FFlagAXAvatarEditorServiceTelemetryV2 = AvatarExperienceFlagsModule.FFlagAXAvatarEditorServiceTelemetryV2
local FFlagAXDeprecateAvatarEditorServiceTelemetryV1 = AvatarExperienceFlagsModule.FFlagAXDeprecateAvatarEditorServiceTelemetryV1
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

return function(Name, Callback, p1, Callback1)
	-- upvalues: PerformFetch (copy), AVATAREDITORCONSTANTS (copy), GetGearAssetIdFromStateFunction (copy), FIntAXLookOutfitCreationDelayMs (copy), PromiseModule (copy), FFlagAXAvatarEditorServiceTelemetryV2 (copy), ReportAvatarEditorServiceCounterFunction (copy), Constants (copy), AVATAREDITORSERVICECOUNTERSTATUS (copy), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ReportAvatarEventCounterV1Function (copy), SetCurrentToastMessageFunction (copy), config (copy), config1 (copy), config2 (copy)
	return function(p2, p3)
		-- upvalues: PerformFetch (upval), AVATAREDITORCONSTANTS (upval), GetGearAssetIdFromStateFunction (upval), Callback (copy), p1 (copy), FIntAXLookOutfitCreationDelayMs (upval), PromiseModule (upval), FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), Constants (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval), Name (copy), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ReportAvatarEventCounterV1Function (upval), Callback1 (copy), SetCurrentToastMessageFunction (upval), config (upval), config1 (upval), config2 (upval)
		local AvatarEditorService = p3.avatarEditorService
		
		return PerformFetch.Single(AVATAREDITORCONSTANTS.CreateOutfitKey, function(p4)
			-- upvalues: GetGearAssetIdFromStateFunction (upval), Callback (upval), p1 (upval), FIntAXLookOutfitCreationDelayMs (upval), PromiseModule (upval), FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), Constants (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval), AvatarEditorService (copy), Name (upval), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ReportAvatarEventCounterV1Function (upval), Callback1 (upval), SetCurrentToastMessageFunction (upval), config (upval), config1 (upval), config2 (upval)
			local State = p4:getState()
			local HumanoidRigTypeEntry = Enum.HumanoidRigType[State.AvatarExperience.AvatarEditor.Character.AvatarType]
			local GearAssetIdFromState = GetGearAssetIdFromStateFunction(State.AvatarExperience)
			local CallbackResult = Callback(State, p1)
			task.spawn(function()
				-- upvalues: FIntAXLookOutfitCreationDelayMs (upval), PromiseModule (upval), FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), Constants (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval), AvatarEditorService (upval), CallbackResult (copy), HumanoidRigTypeEntry (copy), Name (upval), GearAssetIdFromState (copy), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ReportAvatarEventCounterV1Function (upval), Callback1 (upval), p4 (copy), SetCurrentToastMessageFunction (upval), config (upval), config1 (upval), config2 (upval)
				task.wait(FIntAXLookOutfitCreationDelayMs / 1000)
				PromiseModule.new(function(Callback: () -> (), Callback2: () -> ())
					-- upvalues: FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), Constants (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval), AvatarEditorService (upval), CallbackResult (upval), HumanoidRigTypeEntry (upval), Name (upval), GearAssetIdFromState (upval), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ReportAvatarEventCounterV1Function (upval), Callback1 (upval), p4 (upval), SetCurrentToastMessageFunction (upval), config (upval), config1 (upval), config2 (upval)
					if FFlagAXAvatarEditorServiceTelemetryV2 then
						ReportAvatarEditorServiceCounterFunction(Constants.AVATAR_EDITOR_SERVICE_EVENTS.NoPromptCreateOutfit, AVATAREDITORSERVICECOUNTERSTATUS.Request)
					end
					local NoPromptCreateOutfitResult = AvatarEditorService:NoPromptCreateOutfit(CallbackResult, HumanoidRigTypeEntry, Name, GearAssetIdFromState)
					while not NoPromptCreateOutfitResult do
						if FFlagAXAvatarEditorServiceTelemetryV2 then
							ReportAvatarEditorServiceCounterFunction(Constants.AVATAR_EDITOR_SERVICE_EVENTS.NoPromptCreateOutfit, AVATAREDITORSERVICECOUNTERSTATUS.Error)
						end
						AvatarEditorService.PromptCreateOutfitCompleted:Wait()
						
						if FFlagAXAvatarEditorServiceTelemetryV2 then
							ReportAvatarEditorServiceCounterFunction(Constants.AVATAR_EDITOR_SERVICE_EVENTS.NoPromptCreateOutfit, AVATAREDITORSERVICECOUNTERSTATUS.Request)
						end
						NoPromptCreateOutfitResult = AvatarEditorService:NoPromptCreateOutfit(CallbackResult, HumanoidRigTypeEntry, Name, 0)
						
						if not FFlagAXDeprecateAvatarEditorServiceTelemetryV1 then
							ReportAvatarEventCounterNoAnalyticsArgumentFunction(Constants.AVATAR_EDITOR_SERVICE_ERRORS.NoPromptCreateOutfit)
						end
					end
					local Result, FailureType = AvatarEditorService.PromptCreateOutfitCompleted:Wait()
					
					if Result == Enum.AvatarPromptResult.Success then
						if FFlagAXAvatarEditorServiceTelemetryV2 then
							ReportAvatarEditorServiceCounterFunction(Constants.AVATAR_EDITOR_SERVICE_EVENTS.NoPromptCreateOutfit, AVATAREDITORSERVICECOUNTERSTATUS.Success)
						end
						ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXCreateCostume)
						Callback1()
						Callback()
						
						return
					else
						if FailureType == Enum.CreateOutfitFailure.InvalidName then
							p4:dispatch(SetCurrentToastMessageFunction(config))
						elseif FailureType == Enum.CreateOutfitFailure.OutfitLimitReached then
							p4:dispatch(SetCurrentToastMessageFunction(config1))
						elseif FailureType == Enum.CreateOutfitFailure.Other then
							p4:dispatch(SetCurrentToastMessageFunction(config2))
						end
						if not FFlagAXDeprecateAvatarEditorServiceTelemetryV1 then
							ReportAvatarEventCounterNoAnalyticsArgumentFunction(Constants.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit)
						end
						if FFlagAXAvatarEditorServiceTelemetryV2 then
							ReportAvatarEditorServiceCounterFunction(Constants.AVATAR_EDITOR_SERVICE_EVENTS.NoPromptCreateOutfit, AVATAREDITORSERVICECOUNTERSTATUS.Error, FailureType or Result)
						end
						Callback2()
					end
				end)
			end)
			
			return PromiseModule.resolve()
		end)(p2):catch(function(_) end)
	end
end