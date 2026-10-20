local Parent = script.Parent.Parent
local Default = require(Parent.LoggingProtocol).default
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local SharedFlagsModule = require(Parent.SharedFlags)
local ModalEventConstantsModule = require(script.Parent.Analytics.ModalEventConstants)
local PushUpsellEventNameModule = require(script.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName)
local NotificationsUpsellConstantsModule = require(script.Parent.NotificationsUpsellConstants)
local SetupPushNotificationsUpsellModule = require(script.Parent.setupPushNotificationsUpsell)
local FFlagPushNotificationsUpsellHomePromptsExperiment = SharedFlagsModule.FFlagPushNotificationsUpsellHomePromptsExperiment
local Flag = false

local function requestPermission()
	-- upvalues: Flag (ref), NotificationsCommonModule (copy), SharedFlagsModule (copy), Default (copy), PushUpsellEventNameModule (copy), ModalEventConstantsModule (copy), SetupPushNotificationsUpsellModule (copy), NotificationsUpsellConstantsModule (copy)
	if not Flag then
		Flag = true
		NotificationsCommonModule.ixpHelper.logUserLayerExposure(SharedFlagsModule.FStringPushNotificationsUpsellHomePromptsExperimentLayer)
		Default:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
			[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.ShouldRequest,
			[ModalEventConstantsModule.EntryPoint] = "Home"
		}, ModalEventConstantsModule.ModalContextSysUpsell)
		SetupPushNotificationsUpsellModule.OpenModal(NotificationsUpsellConstantsModule.ModalKey.PushUpsellHome, false, "Home")
		
		return
	end
end

return {
	isEnabled = function()
		-- upvalues: FFlagPushNotificationsUpsellHomePromptsExperiment (copy), SharedFlagsModule (copy)
		return FFlagPushNotificationsUpsellHomePromptsExperiment and SharedFlagsModule.FFlagNotificationsUpsellUseRequestPushPermissionHelper
	end,
	handlePromptsResponse = function(p1)
		-- upvalues: FFlagPushNotificationsUpsellHomePromptsExperiment (copy), SharedFlagsModule (copy), requestPermission (copy)
		if not FFlagPushNotificationsUpsellHomePromptsExperiment or not SharedFlagsModule.FFlagNotificationsUpsellUseRequestPushPermissionHelper or type(p1) ~= "table" then return end
		local CustomPrompts = p1.custom_prompts
		
		if type(CustomPrompts) == "table" and CustomPrompts[SharedFlagsModule.FStringPushNotificationsUpsellHomeCustomPromptName] ~= nil then
			requestPermission()
			
			return
		end
	end
}