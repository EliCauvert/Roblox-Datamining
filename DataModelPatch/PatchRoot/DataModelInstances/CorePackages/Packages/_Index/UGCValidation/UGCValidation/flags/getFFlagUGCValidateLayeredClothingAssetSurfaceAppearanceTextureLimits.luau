local GetEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimits", false)

return function()
	-- upvalues: GetEngineUGCValidateAssetTextureLimitsModule (copy)
	return GetEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimits")
end