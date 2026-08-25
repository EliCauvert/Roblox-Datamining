local avatarEditorService = game:GetService("AvatarEditorService")
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p0)
	-- upvalues: avatarEditorService (ref), closeOpenPromptModule (ref)
	avatarEditorService:SignalCreateOutfitPermissionDenied()
	p0:dispatch(closeOpenPromptModule())
end