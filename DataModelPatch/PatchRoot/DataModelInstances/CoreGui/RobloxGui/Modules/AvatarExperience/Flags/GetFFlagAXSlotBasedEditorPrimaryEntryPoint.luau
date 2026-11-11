local GetFFlagAXEnableSlotBasedEditorModule = require(script.Parent.GetFFlagAXEnableSlotBasedEditor)
game:DefineFastFlag("AXSlotBasedEditorPrimaryEntryPoint2", false)

return function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy)
	return GetFFlagAXEnableSlotBasedEditorModule() and game:GetFastFlag("AXSlotBasedEditorPrimaryEntryPoint2")
end