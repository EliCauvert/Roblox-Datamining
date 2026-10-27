local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(AvatarExperienceInspectAndBuy.Types)
local GetItemThumbnailUrlModule = require(AvatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local AvatarBackground = require(Parent.AXCommon).Constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground

return function(p1)
	-- upvalues: ItemTypeEnum (copy), AvatarBackground (copy), GetItemThumbnailUrlModule (copy)
	return if p1 == nil or p1.itemType ~= ItemTypeEnum.Asset or p1.itemSubType ~= AvatarBackground then nil else GetItemThumbnailUrlModule({ itemType = p1.itemType, id = p1.itemId })
end