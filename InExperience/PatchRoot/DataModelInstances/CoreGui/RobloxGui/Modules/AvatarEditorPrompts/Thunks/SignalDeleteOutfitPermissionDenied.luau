local AvatarEditorService = game:GetService("AvatarEditorService")
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: AvatarEditorService (copy), CloseOpenPromptModule (copy)
	AvatarEditorService:SignalDeleteOutfitPermissionDenied()
	p1:dispatch(CloseOpenPromptModule())
end