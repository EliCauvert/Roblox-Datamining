local avatarEditorService = game:GetService("AvatarEditorService")
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p0) --[[ line: 6 ]]
	-- upvalues: avatarEditorService (ref), closeOpenPromptModule (ref)
	return function(p1) --[[ line: 7 ]]
		-- upvalues: avatarEditorService (copy), p0 (ref), closeOpenPromptModule (copy)
		avatarEditorService:SetAllowInventoryReadAccess(p0)
		p1:dispatch(closeOpenPromptModule())
	end
end