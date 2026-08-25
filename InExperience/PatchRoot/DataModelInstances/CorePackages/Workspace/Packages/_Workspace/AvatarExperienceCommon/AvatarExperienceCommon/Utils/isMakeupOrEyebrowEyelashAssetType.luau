local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)
local t = {
	[constantsModule.ASSET_TYPE_NAME_TO_ID_STRING.EyebrowAccessory] = true,
	[constantsModule.ASSET_TYPE_NAME_TO_ID_STRING.EyelashAccessory] = true
}

return function(value)
	-- upvalues: constantsModule (ref), t (ref)
	return if constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[value] == nil then t[value] == true else true
end