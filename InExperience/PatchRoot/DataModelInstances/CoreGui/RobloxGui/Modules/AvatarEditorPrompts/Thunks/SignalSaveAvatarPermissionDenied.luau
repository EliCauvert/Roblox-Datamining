local avatarEditorService = game:GetService("AvatarEditorService")
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p1)
	-- upvalues: avatarEditorService (ref), closeOpenPromptModule (ref)
	avatarEditorService:SignalSaveAvatarPermissionDenied()
	p1:dispatch(closeOpenPromptModule())
end