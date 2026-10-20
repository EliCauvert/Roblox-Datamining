local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p1] ~= nil
end