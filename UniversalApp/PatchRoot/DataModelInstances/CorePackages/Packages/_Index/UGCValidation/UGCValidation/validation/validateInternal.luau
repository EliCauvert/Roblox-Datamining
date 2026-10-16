local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local IsMeshPartAccessoryModule = require(Parent.util.isMeshPartAccessory)
local IsLayeredClothingModule = require(Parent.util.isLayeredClothing)
local ValidateLayeredClothingAccessoryModule = require(Parent.validation.validateLayeredClothingAccessory)
local ValidateLegacyAccessoryModule = require(Parent.validation.validateLegacyAccessory)
local ValidateMeshPartAccessoryModule = require(Parent.validation.validateMeshPartAccessory)
local ValidateMakeupAssetModule = require(Parent.validation.validateMakeupAsset)
local ValidateLimbsAndTorsoModule = require(Parent.validation.validateLimbsAndTorso)
local ValidateDynamicHeadMeshPartFormatModule = require(Parent.validation.validateDynamicHeadMeshPartFormat)
local ValidatePackageModule = require(Parent.validation.validatePackage)
local ValidateEmoteAnimationModule = require(Parent.validation.ValidateEmoteAnimation)

local function validateBodyPartInternal(p1) --[[ Line: 19 ]]
	-- upvalues: ConstantsInterfaceModule (copy), ValidateDynamicHeadMeshPartFormatModule (copy), ValidateLimbsAndTorsoModule (copy)
	local AssetTypeEnum = p1.assetTypeEnum
	assert(AssetTypeEnum ~= nil, "assetTypeEnum is required in validateBodyPartInternal")
	assert(ConstantsInterfaceModule.isBodyPart(AssetTypeEnum))
	
	return if Enum.AssetType.DynamicHead == AssetTypeEnum then ValidateDynamicHeadMeshPartFormatModule(p1) else ValidateLimbsAndTorsoModule(p1)
end

return function(p1) --[[ Line: 30 | Named "validateInternal" ]]
	-- upvalues: ConstantsModule (copy), ValidateEmoteAnimationModule (copy), ConstantsInterfaceModule (copy), ValidateMakeupAssetModule (copy), validateBodyPartInternal (copy), ValidatePackageModule (copy), IsMeshPartAccessoryModule (copy), IsLayeredClothingModule (copy), ValidateLayeredClothingAccessoryModule (copy), ValidateMeshPartAccessoryModule (copy), ValidateLegacyAccessoryModule (copy)
	assert(p1.instances ~= nil, "instances required in validationContext for validateInternal")
	assert(p1.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateInternal")
	local Instances = p1.instances
	local AssetTypeEnum = p1.assetTypeEnum
	local ValidateMeshPartAccessories = p1.validateMeshPartAccessories
	
	if ConstantsModule.ANIMATION_ASSET_INFO and ConstantsModule.ANIMATION_ASSET_INFO[AssetTypeEnum] then
		return true
	elseif AssetTypeEnum == Enum.AssetType.EmoteAnimation then
		return ValidateEmoteAnimationModule.validate(p1)
	elseif ConstantsInterfaceModule.isMakeupAsset(AssetTypeEnum) then
		return ValidateMakeupAssetModule(p1)
	elseif ConstantsInterfaceModule.isBodyPart(AssetTypeEnum) then
		return validateBodyPartInternal(p1)
	elseif AssetTypeEnum == Enum.AssetType.Model then
		return ValidatePackageModule(p1)
	elseif ValidateMeshPartAccessories then
		local InstancesEntry = Instances[1]
		
		return if IsMeshPartAccessoryModule(InstancesEntry) then if IsLayeredClothingModule(InstancesEntry) then ValidateLayeredClothingAccessoryModule(p1) else ValidateMeshPartAccessoryModule(p1) else ValidateLegacyAccessoryModule(p1)
	else
		return if IsLayeredClothingModule(Instances[1]) then ValidateLayeredClothingAccessoryModule(p1) else ValidateLegacyAccessoryModule(p1)
	end
end