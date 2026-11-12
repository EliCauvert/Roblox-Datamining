local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(SPAWNEFFECTASSETTYPEIDSTRING): boolean
	-- upvalues: ConstantsModule (copy)
	return SPAWNEFFECTASSETTYPEIDSTRING == ConstantsModule.SPAWN_EFFECT_ASSET_TYPE_ID_STRING
end