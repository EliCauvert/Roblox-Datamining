local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local OutfitTypesModule = require(AvatarExperienceCommon.Enums.OutfitTypes)
local _ = require(AvatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local InventoryOutfitType = require(AvatarExperienceCommon.Parent.AvatarExperienceModel).Enums.InventoryOutfitType

return function(Animations, Enabled) --[[ Line: 17 | Named "getInventoryOutfitType" ]]
	-- upvalues: OutfitTypesModule (copy), InventoryOutfitType (copy)
	return if Animations == OutfitTypesModule.Avatar then if Enabled == false then InventoryOutfitType.Body else InventoryOutfitType.Avatar elseif Animations == OutfitTypesModule.DynamicHead then InventoryOutfitType.DynamicHead elseif Animations == OutfitTypesModule.Shoes then InventoryOutfitType.Shoes elseif Animations == OutfitTypesModule.Animations then InventoryOutfitType.Animations elseif Animations == OutfitTypesModule.Makeup then if Enabled == false then InventoryOutfitType.PurchasedMakeup else InventoryOutfitType.CreatedMakeup else nil
end