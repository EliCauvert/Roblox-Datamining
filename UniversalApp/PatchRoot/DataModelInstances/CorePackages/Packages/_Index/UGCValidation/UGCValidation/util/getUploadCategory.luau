local Parent = script.Parent.Parent
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local GetFFlagUGCValidationEyebrowEyelashCategoryModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashCategory)
local Parts = string.split(require(Parent.flags.getFStringUGCLCAllowedAssetTypeIds)(), ",")

return function(p1, AssetType, BundleType) --[[ Line: 9 | Named "getUploadCategory" ]]
	-- upvalues: ValidationEnumsModule (copy), ConstantsModule (copy), Parts (copy), GetFFlagUGCValidationEyebrowEyelashCategoryModule (copy), ConstantsInterfaceModule (copy)
	if BundleType ~= nil then
		return if BundleType == Enum.BundleType.BodyParts then ValidationEnumsModule.UploadCategory.FULL_BODY elseif BundleType == Enum.BundleType.Animations then ValidationEnumsModule.UploadCategory.ANIMATION_PACK else ValidationEnumsModule.UploadCategory.BOTH_SHOES
	end
	assert(AssetType)
	local ANIMATION = nil
	
	if AssetType == Enum.AssetType.EmoteAnimation then
		ANIMATION = ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION
	elseif ConstantsModule.ASSET_TYPE_INFO[AssetType] and ConstantsModule.ASSET_TYPE_INFO[AssetType].isBodyPart then
		ANIMATION = AssetType == Enum.AssetType.DynamicHead and ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD or ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS
	elseif table.find(Parts, (tostring(AssetType.Value))) then
		local IsAssetTypeMatch: boolean = AssetType == Enum.AssetType.EyebrowAccessory or AssetType == Enum.AssetType.EyelashAccessory
		ANIMATION = if GetFFlagUGCValidationEyebrowEyelashCategoryModule() and IsAssetTypeMatch then ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH else ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING
	elseif ConstantsModule.ASSET_TYPE_INFO[AssetType] and ConstantsModule.ASSET_TYPE_INFO[AssetType].rigidAllowed then
		ANIMATION = ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	elseif ConstantsInterfaceModule.isMakeupAsset(AssetType) then
		ANIMATION = ValidationEnumsModule.UploadCategory.MAKEUP
	elseif ConstantsModule.ANIMATION_ASSET_INFO and ConstantsModule.ANIMATION_ASSET_INFO[AssetType] then
		ANIMATION = ValidationEnumsModule.UploadCategory.ANIMATION
	end
	if ANIMATION == nil then
		error(`No assigned validation category for {p1.Name}, {AssetType}, {BundleType} `)
	end
	return ANIMATION
end