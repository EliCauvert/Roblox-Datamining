local avatarEditorService = game:GetService("AvatarEditorService")
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p0) --[[ line: 6 ]]
	-- upvalues: avatarEditorService (ref), closeOpenPromptModule (ref)
	avatarEditorService:SignalSetFavoritePermissionDenied()
	p0:dispatch(closeOpenPromptModule())
end