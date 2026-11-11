local GetFFlagAXEnableSlotBasedEditorModule = require(script.Parent.GetFFlagAXEnableSlotBasedEditor)
game:DefineFastFlag("AXMigrateAENavigationToFunctionalReact2", false)

return function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy)
	return GetFFlagAXEnableSlotBasedEditorModule() and game:GetFastFlag("AXMigrateAENavigationToFunctionalReact2")
end