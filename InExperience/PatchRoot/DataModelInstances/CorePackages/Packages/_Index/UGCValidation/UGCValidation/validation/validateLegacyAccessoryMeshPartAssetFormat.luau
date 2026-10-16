local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local CreateLegacyAccessoryMeshPartAssetFormatSchemaModule = require(Parent.util.createLegacyAccessoryMeshPartAssetFormatSchema)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateInstanceTreeModule = require(Parent.validation.validateInstanceTree)
local ValidateLegacyAccessoryMeshPartAssetFormatMatchModule = require(Parent.validation.validateLegacyAccessoryMeshPartAssetFormatMatch)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)

return function(Object, p1) --[[ Line: 16 | Named "validateLegacyAccessoryMeshPartAssetFormat" ]]
	-- upvalues: ValidateSingleInstanceModule (copy), CreateLegacyAccessoryMeshPartAssetFormatSchemaModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), ValidateLegacyAccessoryMeshPartAssetFormatMatchModule (copy)
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
	local ValidateLegacyAccessoryMeshPartAssetFormatMatchModuleResult, ValidateLegacyAccessoryMeshPartAssetFormatMatchModuleResult2 = ValidateLegacyAccessoryMeshPartAssetFormatMatchModule(InstancesEntry, Object, p1)
	
	if ValidateLegacyAccessoryMeshPartAssetFormatMatchModuleResult then
		return true
	else
		return false, ValidateLegacyAccessoryMeshPartAssetFormatMatchModuleResult2
	end
end