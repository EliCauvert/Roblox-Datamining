local GetEngineUGCValidateTexturePackCPlusPlusModule = require(script.Parent.Parent.flags.getEngineUGCValidateTexturePackCPlusPlus)
game:DefineFastFlag("UGCValidateTexturePack", false)

return function()
	-- upvalues: GetEngineUGCValidateTexturePackCPlusPlusModule (copy)
	return game:GetFastFlag("UGCValidateTexturePack") and GetEngineUGCValidateTexturePackCPlusPlusModule()
end