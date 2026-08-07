local fFlagAppChatEnableAutotranslationModule = require(script.Parent.FFlagAppChatEnableAutotranslation)
game:DefineFastFlag("AppChatEnableManualTranslation", false)

return function() --[[ line: 5 ]]
	-- upvalues: fFlagAppChatEnableAutotranslationModule (ref)
	return game:GetFastFlag("AppChatEnableManualTranslation") and fFlagAppChatEnableAutotranslationModule
end