local GetFFlagAXEnableSlotBasedEditorModule = require(script.Parent.GetFFlagAXEnableSlotBasedEditor)
game:DefineFastFlag("AXEnableRecommendationTypeAllInCustomize2", false)

return function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy)
	return GetFFlagAXEnableSlotBasedEditorModule() and game:GetFastFlag("AXEnableRecommendationTypeAllInCustomize2")
end