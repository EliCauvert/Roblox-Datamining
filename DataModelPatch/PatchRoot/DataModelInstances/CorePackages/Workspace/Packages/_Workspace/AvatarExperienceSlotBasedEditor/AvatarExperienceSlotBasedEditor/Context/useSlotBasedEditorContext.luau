local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local SlotBasedEditorContextModule = require(script.Parent.SlotBasedEditorContext)

return function()
	-- upvalues: ReactModule (copy), SlotBasedEditorContextModule (copy)
	return (ReactModule.useContext(SlotBasedEditorContextModule))
end