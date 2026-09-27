local parent = script.Parent.Parent
local default = require(parent.LoggingProtocol).default
local notificationsCommonModule = require(parent.NotificationsCommon)
local sharedFlagsModule = require(parent.SharedFlags)
local modalEventConstantsModule = require(script.Parent.Analytics.ModalEventConstants)
local pushUpsellEventNameModule = require(script.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName)
local notificationsUpsellConstantsModule = require(script.Parent.NotificationsUpsellConstants)
local setupPushNotificationsUpsellModule = require(script.Parent.setupPushNotificationsUpsell)
local fFlagPushNotificationsUpsellHomePromptsExperiment = sharedFlagsModule.FFlagPushNotificationsUpsellHomePromptsExperiment
local var1 = false

local function requestPermission()
	-- upvalues: var1 (write), notificationsCommonModule (ref), sharedFlagsModule (ref), default (ref), pushUpsellEventNameModule (ref), modalEventConstantsModule (ref), setupPushNotificationsUpsellModule (ref), notificationsUpsellConstantsModule (ref)
	if var1 then
		return
	end
	var1 = true
	notificationsCommonModule.ixpHelper.logUserLayerExposure(sharedFlagsModule.FStringPushNotificationsUpsellHomePromptsExperimentLayer)
	default:logRobloxTelemetryEvent(pushUpsellEventNameModule, {}, {
		[modalEventConstantsModule.ActionType] = modalEventConstantsModule.ShouldRequest,
		[modalEventConstantsModule.EntryPoint] = "Home"
	}, modalEventConstantsModule.ModalContextSysUpsell)
	setupPushNotificationsUpsellModule.OpenModal(notificationsUpsellConstantsModule.ModalKey.PushUpsellHome, false, "Home")
end

return {
	isEnabled = function()
		-- upvalues: fFlagPushNotificationsUpsellHomePromptsExperiment (ref), sharedFlagsModule (ref)
		return fFlagPushNotificationsUpsellHomePromptsExperiment and sharedFlagsModule.FFlagNotificationsUpsellUseRequestPushPermissionHelper
	end,
	handlePromptsResponse = function(p1)
		-- upvalues: fFlagPushNotificationsUpsellHomePromptsExperiment (ref), sharedFlagsModule (ref), requestPermission (ref)
		if not fFlagPushNotificationsUpsellHomePromptsExperiment or not sharedFlagsModule.FFlagNotificationsUpsellUseRequestPushPermissionHelper or type(p1) ~= "table" then return end
		local customPrompts = p1.custom_prompts
		
		if type(customPrompts) == "table" and customPrompts[sharedFlagsModule.FStringPushNotificationsUpsellHomeCustomPromptName] ~= nil then
			requestPermission()
			
			return
		end
	end
}