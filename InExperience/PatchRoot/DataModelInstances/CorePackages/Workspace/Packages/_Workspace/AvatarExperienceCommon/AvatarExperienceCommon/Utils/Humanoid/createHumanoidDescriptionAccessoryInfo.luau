local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local constantsModule = require(avatarExperienceCommon.Constants)
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local _ = require(avatarExperienceCommon.Types.CommonTypes)

return function(p1, p2, p3)
	-- upvalues: constantsModule (ref)
	local var1 = tonumber(p2)
	assert(var1 ~= nil, "assetIdAsNumber is not nil. Silence type checker.")
	p3 = p3 or {}
	
	return {
		AssetId = var1,
		Order = p3.order,
		AccessoryType = p3.type or constantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[p1],
		IsLayered = p3.isLayered,
		Position = p3.position,
		Rotation = p3.rotation,
		Scale = p3.scale
	}
end