local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p1, p2, p3)
	-- upvalues: ConstantsModule (copy)
	local Number: number? = tonumber(p2)
	assert(Number ~= nil, "assetIdAsNumber is not nil. Silence type checker.")
	local P2 = p3 or {}
	
	return {
		AssetId = Number,
		Order = P2.order,
		AccessoryType = P2.type or ConstantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[p1],
		IsLayered = P2.isLayered,
		Position = P2.position,
		Rotation = P2.rotation,
		Scale = P2.scale
	}
end