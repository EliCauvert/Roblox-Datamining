local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p0, p1, p2) --[[ line: 22 | named "createHumanoidDescriptionAccessoryInfo" ]]
	-- upvalues: constantsModule (ref)
	local var1 = tonumber(p1)
	assert(var1 ~= nil, "assetIdAsNumber is not nil. Silence type checker.")
	p2 = p2 or {}
	
	return {
		AssetId = var1,
		Order = p2.order,
		AccessoryType = p2.type or constantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[p0],
		IsLayered = p2.isLayered,
		Position = p2.position,
		Rotation = p2.rotation,
		Scale = p2.scale
	}
end