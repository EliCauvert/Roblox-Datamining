local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local CreateLegacyAccessoryMeshPartAssetFormatSchemaModule = require(Parent.util.createLegacyAccessoryMeshPartAssetFormatSchema)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateInstanceTreeModule = require(Parent.validation.validateInstanceTree)
local ValidateLegacyAccessoryMeshPartAssetFormatMatchModule = require(Parent.validation.validateLegacyAccessoryMeshPartAssetFormatMatch)
local ValidateSurfaceAppearancesModule = require(Parent.validation.validateSurfaceAppearances)
local ValidateSurfaceAppearanceTextureSizeModule = require(Parent.validation.validateSurfaceAppearanceTextureSize)
local ValidateTexturePackModule = require(Parent.validation.ValidateTexturePack)
local ValidateSurfaceAppearanceTransparencyModule = require(Parent.validation.validateSurfaceAppearanceTransparency)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidateTexturePackModule = require(Parent.flags.getFFlagUGCValidateTexturePack)
local GetFFlagUGCValidateMigrateTextureTransparencyModule = require(Parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(Parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)

return function(Object, p1)
	-- upvalues: ValidateSingleInstanceModule (copy), CreateLegacyAccessoryMeshPartAssetFormatSchemaModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (copy), ValidateSurfaceAppearancesModule (copy), GetFFlagUGCValidateMigrateTextureTransparencyModule (copy), ValidateSurfaceAppearanceTextureSizeModule (copy), ValidateSurfaceAppearanceTransparencyModule (copy), GetFFlagUGCValidateTexturePackModule (copy), ValidateTexturePackModule (copy), ValidateLegacyAccessoryMeshPartAssetFormatMatchModule (copy)
	assert(p1.instances ~= nil, "instances required in validationContext for validateLegacyAccessoryMeshPartAssetFormat")
	local Instances = p1.instances
	local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
	
	if not ValidateSingleInstanceModuleResult then
		return false, ValidateSingleInstanceModuleResult2
	end
	local InstancesEntry = Instances[1]
	local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(CreateLegacyAccessoryMeshPartAssetFormatSchemaModule(Object:FindFirstChild("Handle"):FindFirstChildOfClass("Attachment").Name), InstancesEntry, p1)
	
	if not ValidateInstanceTreeModuleResult then
		return false, ValidateInstanceTreeModuleResult2
	end
	if GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local ValidateResult, ValidateResult2 = ValidatePropertiesSensibleModule.validate(InstancesEntry, p1)
		
		if not ValidateResult then
			return false, ValidateResult2
		end
	end
	if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		local ValidateSurfaceAppearancesModuleResult, ValidateSurfaceAppearancesModuleResult2 = ValidateSurfaceAppearancesModule(InstancesEntry, p1)
		
		if not ValidateSurfaceAppearancesModuleResult then
			return false, ValidateSurfaceAppearancesModuleResult2
		end
	end
	if not GetFFlagUGCValidateMigrateTextureTransparencyModule() then
		local ValidateSurfaceAppearanceTextureSizeModuleResult, ValidateSurfaceAppearanceTextureSizeModuleResult2 = ValidateSurfaceAppearanceTextureSizeModule(InstancesEntry, p1)
		
		if not ValidateSurfaceAppearanceTextureSizeModuleResult then
			return false, ValidateSurfaceAppearanceTextureSizeModuleResult2
		end
		local ValidateSurfaceAppearanceTransparencyModuleResult, ValidateSurfaceAppearanceTransparencyModuleResult2 = ValidateSurfaceAppearanceTransparencyModule(InstancesEntry, p1)
		
		if not ValidateSurfaceAppearanceTransparencyModuleResult then
			return false, ValidateSurfaceAppearanceTransparencyModuleResult2
		end
	end
	if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and GetFFlagUGCValidateTexturePackModule() then
		local ValidateResult1, ValidateResult2_1 = ValidateTexturePackModule.validate(InstancesEntry, false, p1)
		
		if not ValidateResult1 then
			return false, ValidateResult2_1
		end
	end
	local ValidateLegacyAccessoryMeshPartAssetFormatMatchModuleResult, ValidateLegacyAccessoryMeshPartAssetFormatMatchModuleResult2 = ValidateLegacyAccessoryMeshPartAssetFormatMatchModule(InstancesEntry, Object, p1)
	
	if ValidateLegacyAccessoryMeshPartAssetFormatMatchModuleResult then
		return true
	else
		return false, ValidateLegacyAccessoryMeshPartAssetFormatMatchModuleResult2
	end
end