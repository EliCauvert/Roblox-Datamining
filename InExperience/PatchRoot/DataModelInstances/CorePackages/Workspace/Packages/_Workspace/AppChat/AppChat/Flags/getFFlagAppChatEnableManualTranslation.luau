local fFlagAppChatEnableAutotranslationModule = require(script.Parent.FFlagAppChatEnableAutotranslation)
game:DefineFastFlag("AppChatEnableManualTranslation", false)

return function()
	-- upvalues: fFlagAppChatEnableAutotranslationModule (ref)
	return game:GetFastFlag("AppChatEnableManualTranslation") and fFlagAppChatEnableAutotranslationModule
end