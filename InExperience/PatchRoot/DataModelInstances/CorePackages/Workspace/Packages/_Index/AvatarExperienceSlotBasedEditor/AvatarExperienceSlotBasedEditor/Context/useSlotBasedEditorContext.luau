local reactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local slotBasedEditorContextModule = require(script.Parent.SlotBasedEditorContext)

return function()
	-- upvalues: reactModule (ref), slotBasedEditorContextModule (ref)
	return reactModule.useContext(slotBasedEditorContextModule)
end