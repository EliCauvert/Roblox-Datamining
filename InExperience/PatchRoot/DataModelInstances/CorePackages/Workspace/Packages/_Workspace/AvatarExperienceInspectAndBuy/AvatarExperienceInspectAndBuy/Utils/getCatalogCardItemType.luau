local AXCommonModule = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent.AXCommon)
local itemRestrictions = AXCommonModule.Enums.ItemRestrictions
local catalogItemCardItemTypeEnum = AXCommonModule.Components.CatalogItemCard.CatalogItemCardItemTypeEnum

return function(p1)
	-- upvalues: itemRestrictions (ref), catalogItemCardItemTypeEnum (ref)
	return if p1 then if p1[itemRestrictions.Limited] then catalogItemCardItemTypeEnum.Limited elseif p1[itemRestrictions.Collectible] or p1[itemRestrictions.LimitedUnique] then catalogItemCardItemTypeEnum.Collectible else nil else nil
end