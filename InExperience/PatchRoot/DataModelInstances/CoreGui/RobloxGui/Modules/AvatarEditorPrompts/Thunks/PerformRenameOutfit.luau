local AvatarEditorService = game:GetService("AvatarEditorService")
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(Name)
	-- upvalues: AvatarEditorService (copy), CloseOpenPromptModule (copy)
	return function(p1)
		-- upvalues: AvatarEditorService (upval), Name (copy), CloseOpenPromptModule (upval)
		AvatarEditorService:PerformRenameOutfit(Name)
		p1:dispatch(CloseOpenPromptModule())
	end
end