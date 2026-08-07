local getEngineFeatureUGCValidateHSRMeshIdsModule = require(script.Parent.Parent.flags.getEngineFeatureUGCValidateHSRMeshIds)
game:DefineFastFlag("UGCValidateHSRMeshIdsLuaFlag", false)

return function() --[[ line: 7 ]]
	-- upvalues: getEngineFeatureUGCValidateHSRMeshIdsModule (ref)
	return game:GetFastFlag("UGCValidateHSRMeshIdsLuaFlag") and getEngineFeatureUGCValidateHSRMeshIdsModule()
end