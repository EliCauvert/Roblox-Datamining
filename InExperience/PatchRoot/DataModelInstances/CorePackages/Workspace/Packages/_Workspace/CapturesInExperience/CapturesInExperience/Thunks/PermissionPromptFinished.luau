local CaptureService = game:GetService("CaptureService")
local PromptDismissedModule = require(script.Parent.Parent.Actions.PromptDismissed)

return function(PromptId, WasAccepted) --[[ Line: 7 ]]
	-- upvalues: PromptDismissedModule (copy), CaptureService (copy)
	return function(p1) --[[ Line: 8 ]]
		-- upvalues: PromptDismissedModule (upval), PromptId (copy), CaptureService (upval), WasAccepted (copy)
		p1:dispatch(PromptDismissedModule(PromptId))
		
		if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
			CaptureService:OnCapturePermissionsPromptFinished(PromptId, WasAccepted)
		end
	end
end