local AXCommonModule = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent.AXCommon)
local itemRestrictions = AXCommonModule.Enums.ItemRestrictions
local catalogItemCardItemTypeEnum = AXCommonModule.Components.CatalogItemCard.CatalogItemCardItemTypeEnum

return function(p0)
	-- upvalues: itemRestrictions (ref), catalogItemCardItemTypeEnum (ref)
	return if p0 then if p0[itemRestrictions.Limited] then catalogItemCardItemTypeEnum.Limited elseif p0[itemRestrictions.Collectible] or p0[itemRestrictions.LimitedUnique] then catalogItemCardItemTypeEnum.Collectible else nil else nil
end