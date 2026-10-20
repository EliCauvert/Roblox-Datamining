local AXCommonModule = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent.AXCommon)
local ItemRestrictions = AXCommonModule.Enums.ItemRestrictions
local CatalogItemCardItemTypeEnum = AXCommonModule.Components.CatalogItemCard.CatalogItemCardItemTypeEnum

return function(p1)
	-- upvalues: ItemRestrictions (copy), CatalogItemCardItemTypeEnum (copy)
	return if p1 then if p1[ItemRestrictions.Limited] then CatalogItemCardItemTypeEnum.Limited elseif p1[ItemRestrictions.Collectible] or p1[ItemRestrictions.LimitedUnique] then CatalogItemCardItemTypeEnum.Collectible else nil else nil
end