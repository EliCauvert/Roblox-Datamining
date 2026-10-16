local FFlagAppChatEnableAutotranslationModule = require(script.Parent.FFlagAppChatEnableAutotranslation)
game:DefineFastFlag("AppChatEnableManualTranslation", false)

return function() --[[ Line: 5 ]]
	-- upvalues: FFlagAppChatEnableAutotranslationModule (copy)
	return game:GetFastFlag("AppChatEnableManualTranslation") and FFlagAppChatEnableAutotranslationModule
end