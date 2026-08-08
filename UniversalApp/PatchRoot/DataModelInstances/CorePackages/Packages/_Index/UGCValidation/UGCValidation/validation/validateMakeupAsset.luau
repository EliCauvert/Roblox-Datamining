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

return function(value) --[[ line: 23 | named "validateMakeupAsset" ]]
	-- upvalues: validateSingleInstanceModule (ref), createMakeupSchemaModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), validateModerationModule (ref), getFFlagUGCValidateMigrateWrapAndMakeupModule (ref), validateMakeupDecalModule (ref), validateWrapTextureTransferModule (ref)
	local instances = value.instances
	local _ = nil
	local _ = nil
	local var15, var16 = validateSingleInstanceModule(instances, value)
	local var17 = var16
	
	if not var15 then
		return false, var17
	end
	local var18 = instances[1]
	local var19 = createMakeupSchemaModule()
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var20, var21 = validateInstanceTreeModule(var19, var18, value)
		local var22 = var21
		
		if not var20 then
			return false, var22
		elseif not getFFlagUGCValidateMigrateSchemaPropertiesModule() and getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
			local var23, var24 = validatePropertiesSensibleModule.validate(var18, value)
			local var25 = var24
			
			if not var23 then
				return false, var25
			end
		end
		local var26, var27 = validateDependenciesModule(var18, value, {
			skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
			skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
		})
		
		if not var26 then
			return false, var27
		end
		local var28 = failureReasonsAccumulatorModule.new()
		
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var28:updateReasons(validatePropertyRequirementsModule(var18, nil, value))
		end
		var28:updateReasons(validateTagsModule(var18, value))
		
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var28:updateReasons(validateAttributesModule(var18, value))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var28:updateReasons(validateModerationModule(var18, {}, value))
		end
		if not getFFlagUGCValidateMigrateWrapAndMakeupModule() then
			var28:updateReasons(validateMakeupDecalModule(var18, value))
		end
		if not getFFlagUGCValidateMigrateWrapAndMakeupModule() then
			var28:updateReasons(validateWrapTextureTransferModule(var18, value))
		end
		return var28:getFinalResults()
	end
end