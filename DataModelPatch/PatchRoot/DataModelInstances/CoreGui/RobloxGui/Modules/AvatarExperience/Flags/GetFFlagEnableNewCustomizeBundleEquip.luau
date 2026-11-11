local GetFFlagAXEnableSlotBasedEditorModule = require(script.Parent.GetFFlagAXEnableSlotBasedEditor)
game:DefineFastFlag("EnableNewCustomizeBundleEquip3", false)

return function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy)
	return game:GetFastFlag("EnableNewCustomizeBundleEquip3") and GetFFlagAXEnableSlotBasedEditorModule()
end