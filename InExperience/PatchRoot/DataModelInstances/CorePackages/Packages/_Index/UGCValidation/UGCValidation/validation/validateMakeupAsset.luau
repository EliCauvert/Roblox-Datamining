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
		local var1, var2 = validateSingleInstanceModule(instances, value)
		local var3 = var2
		
		if not var1 then
			return false, var3
		end
	end
	local var4 = instances[1]
	local var5 = createMakeupSchemaModule()
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var6, var7 = validateInstanceTreeModule(var5, var4, value)
		local var8 = var7
		
		if not var6 then
			return false, var8
		elseif not getFFlagUGCValidateMigrateSchemaPropertiesModule() and getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
			local var9, var10 = validatePropertiesSensibleModule.validate(var4, value)
			local var11 = var10
			
			if not var9 then
				return false, var11
			end
		end
		local var12, var13 = validateDependenciesModule(var4, value, {
			skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
			skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
		})
		
		if not var12 then
			return false, var13
		end
		local var14 = failureReasonsAccumulatorModule.new()
		
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var14:updateReasons(validatePropertyRequirementsModule(var4, nil, value))
		end
		if not getFFlagUGCValidateMakeupCategoryParityModule() then
			var14:updateReasons(validateTagsModule(var4, value))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var14:updateReasons(validateAttributesModule(var4, value))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var14:updateReasons(validateModerationModule(var4, {}, value))
		end
		if not getFFlagUGCValidateMigrateWrapAndMakeupModule() then
			var14:updateReasons(validateMakeupDecalModule(var4, value))
		end
		if not getFFlagUGCValidateMigrateWrapAndMakeupModule() then
			var14:updateReasons(validateWrapTextureTransferModule(var4, value))
		end
		return var14:getFinalResults()
	end
end