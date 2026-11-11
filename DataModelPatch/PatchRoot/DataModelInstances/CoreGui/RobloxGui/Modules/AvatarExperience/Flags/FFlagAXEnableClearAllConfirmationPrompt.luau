local GetFFlagAXEnableSlotBasedEditorModule = require(script.Parent.GetFFlagAXEnableSlotBasedEditor)
game:DefineFastFlag("AXEnableClearAllConfirmationPrompt2", false)

return GetFFlagAXEnableSlotBasedEditorModule() and game:GetFastFlag("AXEnableClearAllConfirmationPrompt2")