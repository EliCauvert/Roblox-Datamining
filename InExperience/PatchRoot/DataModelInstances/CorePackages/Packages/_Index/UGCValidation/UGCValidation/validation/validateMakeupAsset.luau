local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validateInstanceTreeModule = require(parent.validation.validateInstanceTree)
local validateModerationModule = require(parent.validation.validateModeration)
local validateTagsModule = require(parent.validation.validateTags)
local validatePropertyRequirementsModule = require(parent.validation.validatePropertyRequirements)
local validateAttributesModule = require(parent.validation.validateAttributes)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateMakeupDecalModule = require(parent.validation.validateMakeupDecal)
local validateWrapTextureTransferModule = require(parent.validation.validateWrapTextureTransfer)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local createMakeupSchemaModule = require(parent.util.createMakeupSchema)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateMigrateWrapAndMakeupModule = require(parent.flags.getFFlagUGCValidateMigrateWrapAndMakeup)
local getFFlagUGCValidateMakeupCategoryParityModule = require(parent.flags.getFFlagUGCValidateMakeupCategoryParity)

return function(value)
	-- upvalues: getFFlagUGCValidateMakeupCategoryParityModule (ref), validateSingleInstanceModule (ref), createMakeupSchemaModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), validateModerationModule (ref), getFFlagUGCValidateMigrateWrapAndMakeupModule (ref), validateMakeupDecalModule (ref), validateWrapTextureTransferModule (ref)
	local instances = value.instances
	local _ = nil
	local _ = nil
	
	if not getFFlagUGCValidateMakeupCategoryParityModule() then
		local var16, var17 = validateSingleInstanceModule(instances, value)
		local var18 = var17
		
		if not var16 then
			return false, var18
		end
	end
	local var19 = instances[1]
	local var20 = createMakeupSchemaModule()
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var21, var22 = validateInstanceTreeModule(var20, var19, value)
		local var23 = var22
		
		if not var21 then
			return false, var23
		elseif not getFFlagUGCValidateMigrateSchemaPropertiesModule() and getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
			local var24, var25 = validatePropertiesSensibleModule.validate(var19, value)
			local var26 = var25
			
			if not var24 then
				return false, var26
			end
		end
		local var27, var28 = validateDependenciesModule(var19, value, {
			skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
			skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
		})
		
		if not var27 then
			return false, var28
		end
		local var29 = failureReasonsAccumulatorModule.new()
		
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var29:updateReasons(validatePropertyRequirementsModule(var19, nil, value))
		end
		if not getFFlagUGCValidateMakeupCategoryParityModule() then
			var29:updateReasons(validateTagsModule(var19, value))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var29:updateReasons(validateAttributesModule(var19, value))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var29:updateReasons(validateModerationModule(var19, {}, value))
		end
		if not getFFlagUGCValidateMigrateWrapAndMakeupModule() then
			var29:updateReasons(validateMakeupDecalModule(var19, value))
		end
		if not getFFlagUGCValidateMigrateWrapAndMakeupModule() then
			var29:updateReasons(validateWrapTextureTransferModule(var19, value))
		end
		return var29:getFinalResults()
	end
end