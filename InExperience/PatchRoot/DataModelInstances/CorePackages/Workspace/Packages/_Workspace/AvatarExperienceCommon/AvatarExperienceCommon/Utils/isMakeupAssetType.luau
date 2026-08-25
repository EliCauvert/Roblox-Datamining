local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(value)
	-- upvalues: constantsModule (ref)
	return constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[value] ~= nil
end