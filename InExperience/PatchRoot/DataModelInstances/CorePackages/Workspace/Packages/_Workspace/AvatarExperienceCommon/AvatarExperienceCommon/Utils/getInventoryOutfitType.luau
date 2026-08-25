local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local outfitTypesModule = require(avatarExperienceCommon.Enums.OutfitTypes)
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local inventoryOutfitTypeModule = require(avatarExperienceCommon.Enums.InventoryOutfitType)

return function(p0, p1)
	-- upvalues: outfitTypesModule (ref), inventoryOutfitTypeModule (ref)
	return if p0 == outfitTypesModule.Avatar then if p1 == false then inventoryOutfitTypeModule.Body else inventoryOutfitTypeModule.Avatar elseif p0 == outfitTypesModule.DynamicHead then inventoryOutfitTypeModule.DynamicHead elseif p0 == outfitTypesModule.Shoes then inventoryOutfitTypeModule.Shoes elseif p0 == outfitTypesModule.Animations then inventoryOutfitTypeModule.Animations elseif p0 == outfitTypesModule.Makeup then if p1 == false then inventoryOutfitTypeModule.PurchasedMakeup else inventoryOutfitTypeModule.CreatedMakeup else nil
end