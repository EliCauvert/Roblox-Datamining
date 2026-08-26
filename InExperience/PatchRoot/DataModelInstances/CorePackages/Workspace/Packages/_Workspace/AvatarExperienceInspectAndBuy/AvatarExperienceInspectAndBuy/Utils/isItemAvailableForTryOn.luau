local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(avatarExperienceInspectAndBuy.Types)
local AXCommonModule = require(parent.AXCommon)
local constants = AXCommonModule.Constants
local ASSET_TYPE_TO_ACCESSORY_TYPE = constants.ASSET_TYPE_TO_ACCESSORY_TYPE
local ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = constants.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP
local LAYERED_ASSET_TYPES = constants.LAYERED_ASSET_TYPES
local AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = constants.AVATAR_ANIMATIONS_BUNDLE_TYPE_ID
local SHOES_BUNDLE_TYPE_ID = constants.SHOES_BUNDLE_TYPE_ID
local avatarBackground = constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
local itemTypeEnum = AXCommonModule.Enums.ItemTypeEnum
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)

return function(p1, p2)
	-- upvalues: itemTypeEnum (ref), AVATAR_ANIMATIONS_BUNDLE_TYPE_ID (ref), SHOES_BUNDLE_TYPE_ID (ref), avatarBackground (ref), avatarExperienceFlagsModule (ref), ASSET_TYPE_TO_ACCESSORY_TYPE (ref), ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP (ref), LAYERED_ASSET_TYPES (ref)
	local itemSubType = p2.itemSubType
	local var1 = p1 and (p1.Humanoid and p1.Humanoid.RigType == Enum.HumanoidRigType.R6)
	
	return if p2.itemType == itemTypeEnum.Bundle and itemSubType == AVATAR_ANIMATIONS_BUNDLE_TYPE_ID then false elseif p2.itemType == itemTypeEnum.Bundle and itemSubType == SHOES_BUNDLE_TYPE_ID and var1 then false elseif p2.itemType == itemTypeEnum.Asset then if itemSubType then if itemSubType == avatarBackground then avatarExperienceFlagsModule.FFlagAXBackgroundsTryOn else (if ASSET_TYPE_TO_ACCESSORY_TYPE[itemSubType] == nil then ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[itemSubType] ~= nil else true) and not (var1 and LAYERED_ASSET_TYPES[itemSubType] ~= nil) else false else true
end