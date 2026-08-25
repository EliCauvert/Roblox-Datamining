local getEngineFeatureUGCValidateHSRMeshIdsModule = require(script.Parent.Parent.flags.getEngineFeatureUGCValidateHSRMeshIds)
game:DefineFastFlag("UGCValidateHSRMeshIdsLuaFlag", false)

return function()
	-- upvalues: getEngineFeatureUGCValidateHSRMeshIdsModule (ref)
	return game:GetFastFlag("UGCValidateHSRMeshIdsLuaFlag") and getEngineFeatureUGCValidateHSRMeshIdsModule()
end