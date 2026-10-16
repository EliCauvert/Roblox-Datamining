local AvatarEditorService = game:GetService("AvatarEditorService")
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: AvatarEditorService (copy), CloseOpenPromptModule (copy)
	AvatarEditorService:PerformDeleteOutfit()
	p1:dispatch(CloseOpenPromptModule())
end