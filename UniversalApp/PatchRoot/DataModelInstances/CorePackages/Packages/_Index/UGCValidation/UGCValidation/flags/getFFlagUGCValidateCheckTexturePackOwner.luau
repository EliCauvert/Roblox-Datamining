local GetEngineUGCValidateTexturePackCPlusPlusModule = require(script.Parent.Parent.flags.getEngineUGCValidateTexturePackCPlusPlus)
game:DefineFastFlag("UGCValidateCheckTexturePackOwner", false)

return function() --[[ Line: 7 ]]
	-- upvalues: GetEngineUGCValidateTexturePackCPlusPlusModule (copy)
	return game:GetFastFlag("UGCValidateCheckTexturePackOwner") and GetEngineUGCValidateTexturePackCPlusPlusModule()
end