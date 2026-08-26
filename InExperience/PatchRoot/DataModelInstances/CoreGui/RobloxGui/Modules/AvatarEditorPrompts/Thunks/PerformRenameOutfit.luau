local avatarEditorService = game:GetService("AvatarEditorService")
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p1)
	-- upvalues: avatarEditorService (ref), closeOpenPromptModule (ref)
	return function(p2)
		-- upvalues: avatarEditorService (copy), p1 (ref), closeOpenPromptModule (copy)
		avatarEditorService:PerformRenameOutfit(p1)
		p2:dispatch(closeOpenPromptModule())
	end
end