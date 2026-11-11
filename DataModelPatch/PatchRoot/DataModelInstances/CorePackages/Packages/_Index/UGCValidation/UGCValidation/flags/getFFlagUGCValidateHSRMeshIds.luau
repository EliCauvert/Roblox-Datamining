local GetEngineFeatureUGCValidateHSRMeshIdsModule = require(script.Parent.Parent.flags.getEngineFeatureUGCValidateHSRMeshIds)
game:DefineFastFlag("UGCValidateHSRMeshIdsLuaFlag", false)

return function()
	-- upvalues: GetEngineFeatureUGCValidateHSRMeshIdsModule (copy)
	return game:GetFastFlag("UGCValidateHSRMeshIdsLuaFlag") and GetEngineFeatureUGCValidateHSRMeshIdsModule()
end