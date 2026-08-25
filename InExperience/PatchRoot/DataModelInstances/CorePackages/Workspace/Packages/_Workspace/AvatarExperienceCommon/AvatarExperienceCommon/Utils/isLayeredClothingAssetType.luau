local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(value)
	-- upvalues: constantsModule (ref)
	return constantsModule.LAYERED_ASSET_TYPES[value] ~= nil
end