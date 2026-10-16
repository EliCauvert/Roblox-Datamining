local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p1): boolean --[[ Line: 7 | Named "isLayeredClothingAssetType" ]]
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.LAYERED_ASSET_TYPES[p1] ~= nil
end