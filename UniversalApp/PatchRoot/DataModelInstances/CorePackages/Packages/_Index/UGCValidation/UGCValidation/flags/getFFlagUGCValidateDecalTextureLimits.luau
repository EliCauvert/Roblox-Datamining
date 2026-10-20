local GetEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateDecalTextureLimits", false)

return function()
	-- upvalues: GetEngineUGCValidateAssetTextureLimitsModule (copy)
	return GetEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateDecalTextureLimits")
end