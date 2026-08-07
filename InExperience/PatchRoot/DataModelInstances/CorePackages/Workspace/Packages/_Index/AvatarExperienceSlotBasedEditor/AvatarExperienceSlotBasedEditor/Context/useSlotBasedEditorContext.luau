local reactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local slotBasedEditorContextModule = require(script.Parent.SlotBasedEditorContext)

return function() --[[ line: 13 | named "useSlotBasedEditorContext" ]]
	-- upvalues: reactModule (ref), slotBasedEditorContextModule (ref)
	return reactModule.useContext(slotBasedEditorContextModule)
end