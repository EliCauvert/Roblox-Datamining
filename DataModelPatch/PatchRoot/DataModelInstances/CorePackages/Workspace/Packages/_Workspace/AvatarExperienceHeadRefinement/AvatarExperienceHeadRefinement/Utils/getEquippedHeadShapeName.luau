local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local Parent = AvatarExperienceHeadRefinement.Parent
local GetEquippedAssetIdsByAssetTypeIdModule = require(AvatarExperienceHeadRefinement.Utils.getEquippedAssetIdsByAssetTypeId)
local _ = require(AvatarExperienceHeadRefinement.Enums.HeadShape)
local HeadShapePropertiesByAssetIdModule = require(AvatarExperienceHeadRefinement.Enums.HeadShapePropertiesByAssetId)
local FFlagDynamicHeadsMigration = require(Parent.AvatarExperienceFlags).FFlagDynamicHeadsMigration
local Constants = require(Parent.AvatarExperienceCommon).Constants

return function(p1, p2)
	-- upvalues: GetEquippedAssetIdsByAssetTypeIdModule (copy), HeadShapePropertiesByAssetIdModule (copy), FFlagDynamicHeadsMigration (copy), Constants (copy)
	local EquippedAssetIdsByAssetTypeIdModuleEntry = GetEquippedAssetIdsByAssetTypeIdModule(p1, p2)[1]
	
	if EquippedAssetIdsByAssetTypeIdModuleEntry then
		return (HeadShapePropertiesByAssetIdModule[tostring(EquippedAssetIdsByAssetTypeIdModuleEntry)] or { name = nil }).name
	end
	if FFlagDynamicHeadsMigration and p1 then
		local DynamicHead = Constants.ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead
		
		if DynamicHead then
			local v1 = p1[DynamicHead]
			
			if v1 then
				for _, value in v1 do
					if value and value.headShape then
						return value.headShape
					end
				end
			end
		end
	end
	return nil
end