local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local isMeshPartAccessoryModule = require(parent.util.isMeshPartAccessory)
local isLayeredClothingModule = require(parent.util.isLayeredClothing)
local validateLayeredClothingAccessoryModule = require(parent.validation.validateLayeredClothingAccessory)
local validateLegacyAccessoryModule = require(parent.validation.validateLegacyAccessory)
local validateMeshPartAccessoryModule = require(parent.validation.validateMeshPartAccessory)
local validateMakeupAssetModule = require(parent.validation.validateMakeupAsset)
local validateLimbsAndTorsoModule = require(parent.validation.validateLimbsAndTorso)
local validateDynamicHeadMeshPartFormatModule = require(parent.validation.validateDynamicHeadMeshPartFormat)
local validatePackageModule = require(parent.validation.validatePackage)
local validateEmoteAnimationModule = require(parent.validation.ValidateEmoteAnimation)

local function validateBodyPartInternal(p0)
	-- upvalues: constantsInterfaceModule (ref), validateDynamicHeadMeshPartFormatModule (ref), validateLimbsAndTorsoModule (ref)
	local assetTypeEnum = p0.assetTypeEnum
	assert(assetTypeEnum ~= nil, "assetTypeEnum is required in validateBodyPartInternal")
	assert(constantsInterfaceModule.isBodyPart(assetTypeEnum))
	
	return if Enum.AssetType.DynamicHead == assetTypeEnum then validateDynamicHeadMeshPartFormatModule(p0) else validateLimbsAndTorsoModule(p0)
end

return function(p1)
	-- upvalues: getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), validateEmoteAnimationModule (ref), constantsInterfaceModule (ref), validateMakeupAssetModule (ref), validateBodyPartInternal (ref), validatePackageModule (ref), isMeshPartAccessoryModule (ref), isLayeredClothingModule (ref), validateLayeredClothingAccessoryModule (ref), validateMeshPartAccessoryModule (ref), validateLegacyAccessoryModule (ref)
	assert(p1.instances ~= nil, "instances required in validationContext for validateInternal")
	assert(p1.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateInternal")
	local instances = p1.instances
	local assetTypeEnum = p1.assetTypeEnum
	local validateMeshPartAccessories = p1.validateMeshPartAccessories
	
	if getFFlagUGCValidationAnimationPackSupportModule() and constantsModule.ANIMATION_ASSET_INFO and constantsModule.ANIMATION_ASSET_INFO[assetTypeEnum] then
		return true
	elseif assetTypeEnum == Enum.AssetType.EmoteAnimation then
		return validateEmoteAnimationModule.validate(p1)
	elseif constantsInterfaceModule.isMakeupAsset(assetTypeEnum) then
		return validateMakeupAssetModule(p1)
	elseif constantsInterfaceModule.isBodyPart(assetTypeEnum) then
		return validateBodyPartInternal(p1)
	elseif assetTypeEnum == Enum.AssetType.Model then
		return validatePackageModule(p1)
	elseif validateMeshPartAccessories then
		local var14 = instances[1]
		
		return if isMeshPartAccessoryModule(var14) then if isLayeredClothingModule(var14) then validateLayeredClothingAccessoryModule(p1) else validateMeshPartAccessoryModule(p1) else validateLegacyAccessoryModule(p1)
	end
	return if isLayeredClothingModule(instances[1]) then validateLayeredClothingAccessoryModule(p1) else validateLegacyAccessoryModule(p1)
end