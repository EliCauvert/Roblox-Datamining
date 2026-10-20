local AvatarEditorService = game:GetService("AvatarEditorService")
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p1)
	-- upvalues: AvatarEditorService (copy), CloseOpenPromptModule (copy)
	AvatarEditorService:SignalRenameOutfitPermissionDenied()
	p1:dispatch(CloseOpenPromptModule())
end