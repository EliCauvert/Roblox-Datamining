local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local itemTypeEnumModule = require(avatarExperienceCommon.Enums.ItemTypeEnum)
local constantsModule = require(avatarExperienceCommon.Constants)

local function getBodiesInTryOns(p0) --[[ line: 6 ]]
	-- upvalues: itemTypeEnumModule (ref), constantsModule (ref)
	local t = {}
	
	for i, v in p0 do
		if v.itemType == itemTypeEnumModule.Bundle and v.itemSubType == constantsModule.BODY_BUNDLE_TYPE_ID then
			table.insert(t, v.itemId)
		end
	end
	return t
end

return function(p1) --[[ line: 19 | named "selectTryOnBodyIds" ]]
	-- upvalues: getBodiesInTryOns (ref)
	local outfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	
	return if outfitTryOn and outfitTryOn.TryOnItems then getBodiesInTryOns(outfitTryOn.TryOnItems) else {}
end