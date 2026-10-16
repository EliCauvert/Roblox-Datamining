local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ItemTypeEnum = require(AvatarExperienceInspectAndBuy.Parent.AvatarExperienceModel).Enums.ItemTypeEnum

return function(p1) --[[ Line: 12 | Named "getItemThumbnailUrl" ]]
	-- upvalues: ItemTypeEnum (copy)
	return if p1.itemType == ItemTypeEnum.Bundle then "rbxthumb://type=BundleThumbnail&id=" .. p1.id .. "&w=420&h=420" elseif p1.itemType == ItemTypeEnum.Asset then "rbxthumb://type=Asset&id=" .. p1.id .. "&w=420&h=420" else nil
end