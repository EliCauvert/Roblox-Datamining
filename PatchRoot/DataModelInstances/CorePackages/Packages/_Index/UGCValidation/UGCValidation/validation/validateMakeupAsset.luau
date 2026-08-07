-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:43 2026 Pacific Standard Time.

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
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local getFFlagUGCValidateMigrateWrapAndMakeupModule = require(parent.flags.getFFlagUGCValidateMigrateWrapAndMakeup)

return function(value) --[[ line: 24 | named "validateMakeupAsset" ]]
	-- upvalues: validateSingleInstanceModule (ref), createMakeupSchemaModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), validateModerationModule (ref), getFFlagUGCValidateMigrateWrapAndMakeupModule (ref), validateMakeupDecalModule (ref), validateWrapTextureTransferModule (ref)
	local instances = value.instances
	local _ = nil
	local _ = nil
	local var16, var17 = validateSingleInstanceModule(instances, value)
	local var18 = var17
	
	if not var16 then
		return false, var18
	end
	local var19 = instances[1]
	local var20 = createMakeupSchemaModule()
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local var21, var22 = validateInstanceTreeModule(var20, var19, value)
		local var23 = var22
		
		if not var21 then
			return false, var23
		elseif (not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule()) and getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
			local var24, var25 = validatePropertiesSensibleModule.validate(var19, value)
			local var26 = var25
			
			if not var24 then
				return false, var26
			end
		end
		local var27, var28 = validateDependenciesModule(var19, value, {
			skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule(),
			skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule()
		})
		
		if not var27 then
			return false, var28
		end
		local var29 = failureReasonsAccumulatorModule.new()
		
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
			var29:updateReasons(validatePropertyRequirementsModule(var19, nil, value))
		end
		var29:updateReasons(validateTagsModule(var19, value))
		
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
			var29:updateReasons(validateAttributesModule(var19, value))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
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