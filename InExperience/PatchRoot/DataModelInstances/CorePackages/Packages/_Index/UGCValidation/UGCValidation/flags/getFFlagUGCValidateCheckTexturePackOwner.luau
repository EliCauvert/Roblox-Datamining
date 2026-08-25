local getEngineUGCValidateTexturePackCPlusPlusModule = require(script.Parent.Parent.flags.getEngineUGCValidateTexturePackCPlusPlus)
game:DefineFastFlag("UGCValidateCheckTexturePackOwner", false)

return function()
	-- upvalues: getEngineUGCValidateTexturePackCPlusPlusModule (ref)
	return game:GetFastFlag("UGCValidateCheckTexturePackOwner") and getEngineUGCValidateTexturePackCPlusPlusModule()
end