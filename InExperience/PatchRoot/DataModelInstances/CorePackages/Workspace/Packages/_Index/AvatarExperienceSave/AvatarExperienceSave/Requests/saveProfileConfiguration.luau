local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local BuildProfileConfigurationApplyConfigModule = require(script.Parent.buildProfileConfigurationApplyConfig)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = AvatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local ReportAvatarEditorServiceCounterFunction = AvatarExperienceAnalyticsModule.reportAvatarEditorServiceCounter
local AVATAREDITORSERVICEERRORS = AvatarExperienceAnalyticsModule.Constants.AVATAR_EDITOR_SERVICE_ERRORS
local AVATAREDITORSERVICEEVENTS = AvatarExperienceAnalyticsModule.Constants.AVATAR_EDITOR_SERVICE_EVENTS
local AVATAREDITORSERVICECOUNTERSTATUS = AvatarExperienceAnalyticsModule.Constants.AVATAR_EDITOR_SERVICE_COUNTER_STATUS
local FFlagAXAvatarEditorServiceTelemetryV2 = AvatarExperienceFlagsModule.FFlagAXAvatarEditorServiceTelemetryV2
local FFlagAXDeprecateAvatarEditorServiceTelemetryV1 = AvatarExperienceFlagsModule.FFlagAXDeprecateAvatarEditorServiceTelemetryV1

return function(BackgroundAssetId) --[[ Line: 40 | Named "saveProfileConfiguration" ]]
	-- upvalues: PromiseModule (copy), AvatarExperienceFlagsModule (copy), BuildProfileConfigurationApplyConfigModule (copy), FFlagAXAvatarEditorServiceTelemetryV2 (copy), ReportAvatarEditorServiceCounterFunction (copy), AVATAREDITORSERVICEEVENTS (copy), AVATAREDITORSERVICECOUNTERSTATUS (copy), AvatarEditorService (copy), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), AVATAREDITORSERVICEERRORS (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 43 ]]
		-- upvalues: AvatarExperienceFlagsModule (upval), BuildProfileConfigurationApplyConfigModule (upval), BackgroundAssetId (copy), FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), AVATAREDITORSERVICEEVENTS (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval), AvatarEditorService (upval), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), AVATAREDITORSERVICEERRORS (upval)
		local ProfileConfigurationApplyConfigModule = if AvatarExperienceFlagsModule.FFlagAXProfileConfigurationMultiFieldApply then BuildProfileConfigurationApplyConfigModule(BackgroundAssetId) else { BackgroundAssetId = BackgroundAssetId }
		
		if FFlagAXAvatarEditorServiceTelemetryV2 then
			ReportAvatarEditorServiceCounterFunction(AVATAREDITORSERVICEEVENTS.NoPromptApplyProfileConfiguration, AVATAREDITORSERVICECOUNTERSTATUS.Request)
		end
		local NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(ProfileConfigurationApplyConfigModule)
		while not NoPromptApplyProfileConfigurationResult do
			if FFlagAXAvatarEditorServiceTelemetryV2 then
				ReportAvatarEditorServiceCounterFunction(AVATAREDITORSERVICEEVENTS.NoPromptApplyProfileConfiguration, AVATAREDITORSERVICECOUNTERSTATUS.Error)
			end
			AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
			
			if not FFlagAXDeprecateAvatarEditorServiceTelemetryV1 then
				ReportAvatarEventCounterNoAnalyticsArgumentFunction(AVATAREDITORSERVICEERRORS.NoPromptApplyProfileConfiguration)
			end
			if FFlagAXAvatarEditorServiceTelemetryV2 then
				ReportAvatarEditorServiceCounterFunction(AVATAREDITORSERVICEEVENTS.NoPromptApplyProfileConfiguration, AVATAREDITORSERVICECOUNTERSTATUS.Request)
			end
			NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(ProfileConfigurationApplyConfigModule)
		end
		local Result = AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
		
		if Result == Enum.AvatarPromptResult.Success then
			if FFlagAXAvatarEditorServiceTelemetryV2 then
				ReportAvatarEditorServiceCounterFunction(AVATAREDITORSERVICEEVENTS.NoPromptApplyProfileConfiguration, AVATAREDITORSERVICECOUNTERSTATUS.Success)
			end
			Callback({ avatarPromptResult = Result })
			
			return
		else
			if not FFlagAXDeprecateAvatarEditorServiceTelemetryV1 then
				ReportAvatarEventCounterNoAnalyticsArgumentFunction(AVATAREDITORSERVICEERRORS.PromptApplyProfileConfigurationCompleted)
			end
			if FFlagAXAvatarEditorServiceTelemetryV2 then
				ReportAvatarEditorServiceCounterFunction(AVATAREDITORSERVICEEVENTS.NoPromptApplyProfileConfiguration, AVATAREDITORSERVICECOUNTERSTATUS.Error, Result)
			end
			Callback1({ avatarPromptResult = Result })
		end
	end)
end