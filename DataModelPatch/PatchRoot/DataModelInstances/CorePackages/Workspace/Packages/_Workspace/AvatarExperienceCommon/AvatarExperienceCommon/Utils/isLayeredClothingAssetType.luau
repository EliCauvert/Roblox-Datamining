local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.LAYERED_ASSET_TYPES[p1] ~= nil
end