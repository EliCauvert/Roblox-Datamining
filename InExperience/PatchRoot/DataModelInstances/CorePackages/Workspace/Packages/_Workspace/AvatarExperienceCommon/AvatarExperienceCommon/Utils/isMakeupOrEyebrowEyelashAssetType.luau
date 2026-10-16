local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)
local config = {
	[ConstantsModule.ASSET_TYPE_NAME_TO_ID_STRING.EyebrowAccessory] = true,
	[ConstantsModule.ASSET_TYPE_NAME_TO_ID_STRING.EyelashAccessory] = true
}

return function(p1): boolean --[[ Line: 12 | Named "isMakeupOrEyebrowEyelashAssetType" ]]
	-- upvalues: ConstantsModule (copy), config (copy)
	return ConstantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p1] ~= nil or config[p1] == true
end