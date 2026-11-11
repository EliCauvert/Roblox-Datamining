local CaptureService = game:GetService("CaptureService")
local PromptDismissedModule = require(script.Parent.Parent.Actions.PromptDismissed)

return function(PromptId, Results)
	-- upvalues: PromptDismissedModule (copy), CaptureService (copy)
	return function(p1)
		-- upvalues: PromptDismissedModule (upval), PromptId (copy), CaptureService (upval), Results (copy)
		p1:dispatch(PromptDismissedModule(PromptId))
		CaptureService:OnSavePromptFinished(PromptId, Results)
	end
end