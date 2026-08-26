local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local outfitTypesModule = require(avatarExperienceCommon.Enums.OutfitTypes)
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local inventoryOutfitTypeModule = require(avatarExperienceCommon.Enums.InventoryOutfitType)

return function(p1, p2)
	-- upvalues: outfitTypesModule (ref), inventoryOutfitTypeModule (ref)
	return if p1 == outfitTypesModule.Avatar then if p2 == false then inventoryOutfitTypeModule.Body else inventoryOutfitTypeModule.Avatar elseif p1 == outfitTypesModule.DynamicHead then inventoryOutfitTypeModule.DynamicHead elseif p1 == outfitTypesModule.Shoes then inventoryOutfitTypeModule.Shoes elseif p1 == outfitTypesModule.Animations then inventoryOutfitTypeModule.Animations elseif p1 == outfitTypesModule.Makeup then if p2 == false then inventoryOutfitTypeModule.PurchasedMakeup else inventoryOutfitTypeModule.CreatedMakeup else nil
end