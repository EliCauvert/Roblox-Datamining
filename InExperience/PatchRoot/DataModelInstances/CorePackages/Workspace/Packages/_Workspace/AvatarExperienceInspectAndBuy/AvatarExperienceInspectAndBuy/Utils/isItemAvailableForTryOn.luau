local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(AvatarExperienceInspectAndBuy.Types)
local Constants = require(Parent.AXCommon).Constants
local ASSETTYPETOACCESSORYTYPE = Constants.ASSET_TYPE_TO_ACCESSORY_TYPE
local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP = Constants.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP
local LAYEREDASSETTYPES = Constants.LAYERED_ASSET_TYPES
local AVATARANIMATIONSBUNDLETYPEID = Constants.AVATAR_ANIMATIONS_BUNDLE_TYPE_ID
local SHOESBUNDLETYPEID = Constants.SHOES_BUNDLE_TYPE_ID
local AvatarBackground = Constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)

return function(Character, p1)
	-- upvalues: ItemTypeEnum (copy), AVATARANIMATIONSBUNDLETYPEID (copy), SHOESBUNDLETYPEID (copy), AvatarBackground (copy), AvatarExperienceFlagsModule (copy), ASSETTYPETOACCESSORYTYPE (copy), ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP (copy), LAYEREDASSETTYPES (copy)
	local ItemSubType = p1.itemSubType
	local IsRigTypeMatch: boolean = Character and (Character.Humanoid and Character.Humanoid.RigType == Enum.HumanoidRigType.R6)
	
	if p1.itemType == ItemTypeEnum.Bundle and ItemSubType == AVATARANIMATIONSBUNDLETYPEID then
		return false
	elseif p1.itemType == ItemTypeEnum.Bundle and ItemSubType == SHOESBUNDLETYPEID and IsRigTypeMatch then
		return false
	elseif p1.itemType ~= ItemTypeEnum.Asset then
		return true
	elseif not ItemSubType then
		return false
	elseif ItemSubType == AvatarBackground then
		return AvatarExperienceFlagsModule.FFlagAXBackgroundsTryOn
	else
		local HasLAYEREDASSETTYPE: boolean = IsRigTypeMatch and LAYEREDASSETTYPES[ItemSubType] ~= nil
		
		return (ASSETTYPETOACCESSORYTYPE[ItemSubType] ~= nil or ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP[ItemSubType] ~= nil) and not HasLAYEREDASSETTYPE
	end
end