local GetFFlagAXEnableSlotBasedEditorModule = require(script.Parent.GetFFlagAXEnableSlotBasedEditor)
game:DefineFastFlag("AXEnableNewInventoryItemsList2", false)

return function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy)
	return GetFFlagAXEnableSlotBasedEditorModule() and game:GetFastFlag("AXEnableNewInventoryItemsList2")
end