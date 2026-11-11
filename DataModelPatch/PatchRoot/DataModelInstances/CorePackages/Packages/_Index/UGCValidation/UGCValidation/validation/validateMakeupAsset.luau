local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidateInstanceTreeModule = require(Parent.validation.validateInstanceTree)
local ValidateModerationModule = require(Parent.validation.validateModeration)
local ValidateTagsModule = require(Parent.validation.validateTags)
local ValidatePropertyRequirementsModule = require(Parent.validation.validatePropertyRequirements)
local ValidateAttributesModule = require(Parent.validation.validateAttributes)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateMakeupDecalModule = require(Parent.validation.validateMakeupDecal)
local ValidateWrapTextureTransferModule = require(Parent.validation.validateWrapTextureTransfer)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local CreateMakeupSchemaModule = require(Parent.util.createMakeupSchema)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local GetFFlagUGCValidationCombineEntrypointResultsModule = require(Parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local GetFFlagUGCValidateMigrateWrapAndMakeupModule = require(Parent.flags.getFFlagUGCValidateMigrateWrapAndMakeup)

return function(p1)
	-- upvalues: ValidateSingleInstanceModule (copy), CreateMakeupSchemaModule (copy), GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), GetFFlagUGCValidationCombineEntrypointResultsModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), ValidateDependenciesModule (copy), FailureReasonsAccumulatorModule (copy), ValidatePropertyRequirementsModule (copy), ValidateTagsModule (copy), ValidateAttributesModule (copy), ValidateModerationModule (copy), GetFFlagUGCValidateMigrateWrapAndMakeupModule (copy), ValidateMakeupDecalModule (copy), ValidateWrapTextureTransferModule (copy)
	local Instances = p1.instances
	local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
	
	if not ValidateSingleInstanceModuleResult then
		return false, ValidateSingleInstanceModuleResult2
	end
	local InstancesEntry = Instances[1]
	local MakeupSchemaModule = CreateMakeupSchemaModule()
	
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(MakeupSchemaModule, InstancesEntry, p1)
		
		if not ValidateInstanceTreeModuleResult then
			return false, ValidateInstanceTreeModuleResult2
		end
	end
	if (not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule()) and GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local ValidateResult, ValidateResult2 = ValidatePropertiesSensibleModule.validate(InstancesEntry, p1)
		
		if not ValidateResult then
			return false, ValidateResult2
		end
	end
	local ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2 = ValidateDependenciesModule(InstancesEntry, p1, {
		skipExistenceCheck = GetFFlagUGCValidateMigrateSchemaPropertiesModule() and GetFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = GetFFlagUGCValidateMigrateSchemaPropertiesModule() and GetFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
	if not ValidateDependenciesModuleResult then
		return false, ValidateDependenciesModuleResult2
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidatePropertyRequirementsModule(InstancesEntry, nil, p1))
	end
	NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(InstancesEntry, p1))
	
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateAttributesModule(InstancesEntry, p1))
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateModerationModule(InstancesEntry, {}, p1))
	end
	if not GetFFlagUGCValidateMigrateWrapAndMakeupModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateMakeupDecalModule(InstancesEntry, p1))
	end
	if not GetFFlagUGCValidateMigrateWrapAndMakeupModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateWrapTextureTransferModule(InstancesEntry, p1))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end