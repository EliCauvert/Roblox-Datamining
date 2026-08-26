local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ASSET_TYPE_NAME_TO_ID_STRING = require(avatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING
local isMakeupAssetTypeModule = require(avatarExperienceCommon.Utils.isMakeupAssetType)
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local outfitTypesModule = require(avatarExperienceCommon.Enums.OutfitTypes)

return function(value, p1)
	-- upvalues: outfitTypesModule (ref), isMakeupAssetTypeModule (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref)
	return if p1 then if p1 == outfitTypesModule.Makeup then isMakeupAssetTypeModule(value) or (if value ~= ASSET_TYPE_NAME_TO_ID_STRING.EyebrowAccessory then value == ASSET_TYPE_NAME_TO_ID_STRING.EyelashAccessory else true) else true else true
end