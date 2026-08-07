local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(value) --[[ line: 7 | named "isLayeredClothingAssetType" ]]
	-- upvalues: constantsModule (ref)
	return constantsModule.LAYERED_ASSET_TYPES[value] ~= nil
end