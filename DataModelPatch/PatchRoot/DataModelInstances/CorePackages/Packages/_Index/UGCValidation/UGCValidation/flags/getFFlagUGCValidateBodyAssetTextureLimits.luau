local GetEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateBodyAssetTextureLimits", false)

return function()
	-- upvalues: GetEngineUGCValidateAssetTextureLimitsModule (copy)
	return GetEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateBodyAssetTextureLimits")
end