local GetEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateAccessoryAssetSurfaceAppearanceTextureLimits", false)

return function()
	-- upvalues: GetEngineUGCValidateAssetTextureLimitsModule (copy)
	return GetEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateAccessoryAssetSurfaceAppearanceTextureLimits")
end