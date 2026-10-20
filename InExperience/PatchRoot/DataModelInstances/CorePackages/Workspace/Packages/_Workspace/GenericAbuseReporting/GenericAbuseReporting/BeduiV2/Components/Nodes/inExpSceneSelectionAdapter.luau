local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local MessageBusService = game:GetService("MessageBusService")
local SafetyService = game:GetService("SafetyService")
local CaptureModeMessageId = MessageBusService:GetMessageId("CaptureMode", "sceneSelectionExitReason")

return {
	start = function()
		-- upvalues: SafetyService (copy), ExperienceStateCaptureService (copy)
		SafetyService.IsCaptureModeForReport = true
		ExperienceStateCaptureService:ToggleCaptureMode()
	end,
	subscribeOnceToExitReason = function(Callback)
		-- upvalues: MessageBusService (copy), CaptureModeMessageId (copy)
		return MessageBusService:Subscribe(CaptureModeMessageId, Callback, true, false)
	end
}