local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ASSETTYPENAMETOIDSTRING = require(AvatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING
local IsMakeupAssetTypeModule = require(AvatarExperienceCommon.Utils.isMakeupAssetType)
local _ = require(AvatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local OutfitTypesModule = require(AvatarExperienceCommon.Enums.OutfitTypes)

return function(EyebrowAccessory, Avatar) --[[ Line: 11 | Named "isValidAssetTypeForOutfitType" ]]
	-- upvalues: OutfitTypesModule (copy), IsMakeupAssetTypeModule (copy), ASSETTYPENAMETOIDSTRING (copy)
	return not Avatar or (if Avatar == OutfitTypesModule.Makeup then IsMakeupAssetTypeModule(EyebrowAccessory) or (EyebrowAccessory == ASSETTYPENAMETOIDSTRING.EyebrowAccessory or EyebrowAccessory == ASSETTYPENAMETOIDSTRING.EyelashAccessory) else Avatar == OutfitTypesModule.Avatar or Avatar == OutfitTypesModule.EditableAvatar or true)
end