local GetEngineUGCValidateTexturePackCPlusPlusModule = require(script.Parent.Parent.flags.getEngineUGCValidateTexturePackCPlusPlus)
game:DefineFastFlag("UGCValidateTexturePack", false)

return function() --[[ Line: 7 ]]
	-- upvalues: GetEngineUGCValidateTexturePackCPlusPlusModule (copy)
	return game:GetFastFlag("UGCValidateTexturePack") and GetEngineUGCValidateTexturePackCPlusPlusModule()
end