local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local constantsModule = require(avatarExperienceCommon.Constants)
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local _ = require(avatarExperienceCommon.Types.CommonTypes)

return function(p0, p1, p2) --[[ line: 27 | named "createHumanoidDescriptionAccessoryInfo" ]]
	-- upvalues: constantsModule (ref)
	local var2 = tonumber(p1)
	assert(var2 ~= nil, "assetIdAsNumber is not nil. Silence type checker.")
	p2 = p2 or {}
	
	return {
		AssetId = var2,
		Order = p2.order,
		AccessoryType = p2.type or constantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[p0],
		IsLayered = p2.isLayered,
		Position = p2.position,
		Rotation = p2.rotation,
		Scale = p2.scale
	}
end