local getEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateDecalTextureLimits", false)

return function()
	-- upvalues: getEngineUGCValidateAssetTextureLimitsModule (ref)
	return getEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateDecalTextureLimits")
end