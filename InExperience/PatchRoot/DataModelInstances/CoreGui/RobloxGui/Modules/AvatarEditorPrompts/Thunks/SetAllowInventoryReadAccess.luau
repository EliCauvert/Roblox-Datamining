local AvatarEditorService = game:GetService("AvatarEditorService")
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(InventoryReadAccessGranted) --[[ Line: 6 ]]
	-- upvalues: AvatarEditorService (copy), CloseOpenPromptModule (copy)
	return function(p1) --[[ Line: 7 ]]
		-- upvalues: AvatarEditorService (upval), InventoryReadAccessGranted (copy), CloseOpenPromptModule (upval)
		AvatarEditorService:SetAllowInventoryReadAccess(InventoryReadAccessGranted)
		p1:dispatch(CloseOpenPromptModule())
	end
end