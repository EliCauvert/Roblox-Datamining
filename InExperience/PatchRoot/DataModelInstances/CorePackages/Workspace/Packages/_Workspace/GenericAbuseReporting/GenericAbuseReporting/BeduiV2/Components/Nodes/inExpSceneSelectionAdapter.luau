local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local messageBusService = game:GetService("MessageBusService")
local safetyService = game:GetService("SafetyService")
local captureModeMessageId = messageBusService:GetMessageId("CaptureMode", "sceneSelectionExitReason")

return {
	start = function()
		-- upvalues: safetyService (ref), experienceStateCaptureService (ref)
		safetyService.IsCaptureModeForReport = true
		experienceStateCaptureService:ToggleCaptureMode()
	end,
	subscribeOnceToExitReason = function(p1)
		-- upvalues: messageBusService (ref), captureModeMessageId (ref)
		return messageBusService:Subscribe(captureModeMessageId, p1, true, false)
	end
}