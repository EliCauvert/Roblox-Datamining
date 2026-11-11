local FFlagAppChatEnableAutotranslationModule = require(script.Parent.FFlagAppChatEnableAutotranslation)
game:DefineFastFlag("AppChatEnableManualTranslation", false)

return function()
	-- upvalues: FFlagAppChatEnableAutotranslationModule (copy)
	return game:GetFastFlag("AppChatEnableManualTranslation") and FFlagAppChatEnableAutotranslationModule
end