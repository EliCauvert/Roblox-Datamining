local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local outfitTypesModule = require(avatarExperienceCommon.Enums.OutfitTypes)
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local inventoryOutfitType = require(parent.AvatarExperienceModel).Enums.InventoryOutfitType

return function(p1, p2)
	-- upvalues: outfitTypesModule (ref), inventoryOutfitType (ref)
	return if p1 == outfitTypesModule.Avatar then if p2 == false then inventoryOutfitType.Body else inventoryOutfitType.Avatar elseif p1 == outfitTypesModule.DynamicHead then inventoryOutfitType.DynamicHead elseif p1 == outfitTypesModule.Shoes then inventoryOutfitType.Shoes elseif p1 == outfitTypesModule.Animations then inventoryOutfitType.Animations elseif p1 == outfitTypesModule.Makeup then if p2 == false then inventoryOutfitType.PurchasedMakeup else inventoryOutfitType.CreatedMakeup else nil
end