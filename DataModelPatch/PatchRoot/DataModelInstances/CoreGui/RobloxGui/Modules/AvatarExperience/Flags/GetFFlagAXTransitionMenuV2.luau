local GetFFlagAXEnableSlotBasedEditorModule = require(script.Parent.GetFFlagAXEnableSlotBasedEditor)
game:DefineFastFlag("AXTransitionMenuV2_2", false)

return function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy)
	return GetFFlagAXEnableSlotBasedEditorModule() and game:GetFastFlag("AXTransitionMenuV2_2")
end