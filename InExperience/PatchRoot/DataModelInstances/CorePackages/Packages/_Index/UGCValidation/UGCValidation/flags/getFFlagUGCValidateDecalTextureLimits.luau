local GetEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateDecalTextureLimits", false)

return function() --[[ Line: 7 ]]
	-- upvalues: GetEngineUGCValidateAssetTextureLimitsModule (copy)
	return GetEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateDecalTextureLimits")
end