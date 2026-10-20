local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local GetEquippedAssetIdsByAssetTypeIdModule = require(AvatarExperienceHeadRefinement.Utils.getEquippedAssetIdsByAssetTypeId)
local HeadShapeModule = require(AvatarExperienceHeadRefinement.Enums.HeadShape)
local FFlagDynamicHeadsMigration = require(AvatarExperienceHeadRefinement.Parent.AvatarExperienceFlags).FFlagDynamicHeadsMigration

local function _(p1): boolean
	-- upvalues: GetEquippedAssetIdsByAssetTypeIdModule (copy)
	return #GetEquippedAssetIdsByAssetTypeIdModule(p1, (tostring(Enum.AssetType.Face.Value))) > 0
end

return function(p1)
	-- upvalues: GetEquippedAssetIdsByAssetTypeIdModule (copy), FFlagDynamicHeadsMigration (copy), HeadShapeModule (copy)
	local IsTryingOnItems = p1.isTryingOnItems
	local v1 = #GetEquippedAssetIdsByAssetTypeIdModule(p1.equippedAssets, (tostring(Enum.AssetType.Face.Value))) > 0
	local DefaultHeadShapeName = if v1 then p1.defaultHeadShapeName else nil
	
	return if IsTryingOnItems and FFlagDynamicHeadsMigration then p1.lastTryOnHeadShapeName or (p1.defaultHeadShapeName or (p1.equippedHeadShapeName or DefaultHeadShapeName)) elseif IsTryingOnItems then p1.lastTryOnHeadShapeName or (p1.equippedHeadShapeName or DefaultHeadShapeName) else p1.equippedHeadShapeName or HeadShapeModule.Default
end