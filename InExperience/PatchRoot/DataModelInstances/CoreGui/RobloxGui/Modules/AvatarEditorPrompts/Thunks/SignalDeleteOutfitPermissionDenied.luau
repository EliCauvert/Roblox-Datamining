local avatarEditorService = game:GetService("AvatarEditorService")
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p0) --[[ line: 9 ]]
	-- upvalues: avatarEditorService (ref), closeOpenPromptModule (ref)
	avatarEditorService:SignalDeleteOutfitPermissionDenied()
	p0:dispatch(closeOpenPromptModule())
end