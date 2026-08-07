local getEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateBodyAssetTextureLimits", false)

return function() --[[ line: 7 ]]
	-- upvalues: getEngineUGCValidateAssetTextureLimitsModule (ref)
	return getEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateBodyAssetTextureLimits")
end