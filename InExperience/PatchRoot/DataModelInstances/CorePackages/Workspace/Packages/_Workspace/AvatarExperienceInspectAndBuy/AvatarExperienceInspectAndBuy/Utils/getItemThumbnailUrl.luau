local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local _ = require(avatarExperienceInspectAndBuy.Types)
local itemTypeEnum = require(avatarExperienceInspectAndBuy.Parent.AXCommon).Enums.ItemTypeEnum

return function(p0)
	-- upvalues: itemTypeEnum (ref)
	return if p0.itemType == itemTypeEnum.Bundle then "rbxthumb://type=BundleThumbnail&id=" .. p0.id .. "&w=420&h=420" elseif p0.itemType == itemTypeEnum.Asset then "rbxthumb://type=Asset&id=" .. p0.id .. "&w=420&h=420" else nil
end