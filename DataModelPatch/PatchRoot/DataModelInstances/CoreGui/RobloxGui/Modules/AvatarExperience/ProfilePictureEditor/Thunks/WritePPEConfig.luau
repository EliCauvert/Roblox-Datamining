local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local ConstantsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Constants)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local IncrementPPEVersionModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.IncrementPPEVersion)
local UtilsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Utils)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local config = {
	toastMessage = "Feature.Avatar.Message.FailedWritePPE",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config1 = {
	toastMessage = "Feature.Avatar.Label.PPEFinishedToast",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}

return function(p1, Closeup, p2, CameraDistanceScale, YRotDeg, FieldOfViewDeg)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy), PerformFetch (copy), PPEThumbnailTypeModule (copy), PromiseModule (copy), UtilsModule (copy), SetCurrentToastMessageModule (copy), config1 (copy), IncrementPPEVersionModule (copy), MutedErrorModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), config (copy), Logging (copy)
	ArgCheckModule.isType(Closeup, "userdata", "WritePPEConfig thunk expects thumbnailType to be a userdata")
	ArgCheckModule.isTypeOrNil(p2, "string", "WritePPEConfig thunk expects emoteAssetId to be a string or nil")
	ArgCheckModule.isType(CameraDistanceScale, "number", "WritePPEConfig thunk expects cameraDistanceScale to be a number")
	ArgCheckModule.isType(YRotDeg, "number", "WritePPEConfig thunk expects cameraYRotDeg to be a number")
	ArgCheckModule.isType(FieldOfViewDeg, "number", "WritePPEConfig thunk expects fieldOfViewDeg to be a number")
	local PPEConfigWriteStatusKey = ConstantsModule.PPEConfigWriteStatusKeys[Closeup]
	
	return function(p3, p4)
		-- upvalues: PerformFetch (upval), PPEConfigWriteStatusKey (copy), Closeup (copy), PPEThumbnailTypeModule (upval), p1 (copy), CameraDistanceScale (copy), YRotDeg (copy), p2 (copy), PromiseModule (upval), UtilsModule (upval), FieldOfViewDeg (copy), SetCurrentToastMessageModule (upval), config1 (upval), IncrementPPEVersionModule (upval), MutedErrorModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), config (upval), Logging (upval)
		local AvatarEditorService = p4.avatarEditorService
		
		return PerformFetch.Single(PPEConfigWriteStatusKey, function(p5)
			-- upvalues: Closeup (upval), PPEThumbnailTypeModule (upval), p1 (upval), CameraDistanceScale (upval), YRotDeg (upval), p2 (upval), PromiseModule (upval), UtilsModule (upval), AvatarEditorService (copy), FieldOfViewDeg (upval), SetCurrentToastMessageModule (upval), config1 (upval), IncrementPPEVersionModule (upval), MutedErrorModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), config (upval), Logging (upval)
			if Closeup == PPEThumbnailTypeModule.Closeup then
				p1.clickFinalSave(Closeup, CameraDistanceScale == 1 and YRotDeg == 0, p2)
			end
			return PromiseModule.new(function(Callback: () -> (), _)
				-- upvalues: p2 (upval), UtilsModule (upval), Closeup (upval), AvatarEditorService (upval), CameraDistanceScale (upval), YRotDeg (upval), FieldOfViewDeg (upval), PPEThumbnailTypeModule (upval), p5 (copy), SetCurrentToastMessageModule (upval), config1 (upval), IncrementPPEVersionModule (upval), MutedErrorModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), config (upval), Logging (upval)
				local Number: number = p2 and tonumber(p2) or 0
				local ConvertThumbnailTypeToEnumResult = UtilsModule.ConvertThumbnailTypeToEnum(Closeup)
				local NoPromptSaveAvatarThumbnailCustomizationResult = AvatarEditorService:NoPromptSaveAvatarThumbnailCustomization(ConvertThumbnailTypeToEnumResult, Number, CameraDistanceScale, YRotDeg, FieldOfViewDeg)
				while not NoPromptSaveAvatarThumbnailCustomizationResult do
					AvatarEditorService.PromptSaveAvatarThumbnailCustomizationCompleted:Wait()
					NoPromptSaveAvatarThumbnailCustomizationResult = AvatarEditorService:NoPromptSaveAvatarThumbnailCustomization(ConvertThumbnailTypeToEnumResult, Number, CameraDistanceScale, YRotDeg, FieldOfViewDeg)
				end
				local Result, FailureType = AvatarEditorService.PromptSaveAvatarThumbnailCustomizationCompleted:Wait()
				
				if Result == Enum.AvatarPromptResult.Success then
					if Closeup == PPEThumbnailTypeModule.Closeup then
						p5:dispatch(SetCurrentToastMessageModule(config1))
					end
					p5:dispatch(IncrementPPEVersionModule(Closeup))
					Callback()
					
					return
				else
					if tostring(FailureType) ~= tostring(Enum.SaveAvatarThumbnailCustomizationFailure.Other) then
						MutedErrorModule(string.format("Call to AvatarEditorService:NoPromptSaveAvatarThumbnailCustomization failed with error code \"%s\"", (tostring(FailureType))))
					end
					if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
						ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.NoPromptSaveAvatarThumbnailCustomization)
					end
					p5:dispatch(SetCurrentToastMessageModule(config))
					Logging.warn("WebApi failure in WritePPEConfig")
				end
			end)
		end)(p3)
	end
end