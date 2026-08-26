local captureService = game:GetService("CaptureService")
local promptDismissedModule = require(script.Parent.Parent.Actions.PromptDismissed)

return function(p1, p2)
	-- upvalues: promptDismissedModule (ref), captureService (ref)
	return function(p3)
		-- upvalues: promptDismissedModule (copy), p1 (ref), captureService (copy), p2 (ref)
		p3:dispatch(promptDismissedModule(p1))
		
		if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
			captureService:OnCapturePermissionsPromptFinished(p1, p2)
		end
	end
end