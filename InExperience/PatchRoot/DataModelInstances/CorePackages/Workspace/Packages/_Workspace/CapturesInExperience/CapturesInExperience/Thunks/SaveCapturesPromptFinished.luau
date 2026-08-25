local captureService = game:GetService("CaptureService")
local promptDismissedModule = require(script.Parent.Parent.Actions.PromptDismissed)

return function(p0, p1)
	-- upvalues: promptDismissedModule (ref), captureService (ref)
	return function(p2)
		-- upvalues: promptDismissedModule (copy), p0 (ref), captureService (copy), p1 (ref)
		p2:dispatch(promptDismissedModule(p0))
		captureService:OnSavePromptFinished(p0, p1)
	end
end