local getEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateAccessoryAssetSurfaceAppearanceTextureLimits", false)

return function() --[[ line: 7 ]]
	-- upvalues: getEngineUGCValidateAssetTextureLimitsModule (ref)
	return getEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateAccessoryAssetSurfaceAppearanceTextureLimits")
end