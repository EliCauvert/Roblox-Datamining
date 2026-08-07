local getEngineUGCValidateTexturePackCPlusPlusModule = require(script.Parent.Parent.flags.getEngineUGCValidateTexturePackCPlusPlus)
game:DefineFastFlag("UGCValidateTexturePack", false)

return function() --[[ line: 7 ]]
	-- upvalues: getEngineUGCValidateTexturePackCPlusPlusModule (ref)
	return game:GetFastFlag("UGCValidateTexturePack") and getEngineUGCValidateTexturePackCPlusPlusModule()
end