local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local itemTypeEnum = require(avatarExperienceCommon.Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local constantsModule = require(avatarExperienceCommon.Constants)

local function getBodiesInTryOns(p1)
	-- upvalues: itemTypeEnum (ref), constantsModule (ref)
	local t = {}
	
	for i, v in p1 do
		if v.itemType == itemTypeEnum.Bundle and v.itemSubType == constantsModule.BODY_BUNDLE_TYPE_ID then
			table.insert(t, v.itemId)
		end
	end
	return t
end

return function(p2)
	-- upvalues: getBodiesInTryOns (ref)
	local outfitTryOn = p2.AvatarExperience.AvatarScene.OutfitTryOn
	
	return if outfitTryOn and outfitTryOn.TryOnItems then getBodiesInTryOns(outfitTryOn.TryOnItems) else {}
end