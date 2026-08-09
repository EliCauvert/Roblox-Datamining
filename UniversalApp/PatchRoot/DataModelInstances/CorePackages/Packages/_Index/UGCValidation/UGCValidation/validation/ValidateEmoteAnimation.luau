local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local util = parent.util
local _ = require(util.Types)
local createEmoteSchemaModule = require(util.createEmoteSchema)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local pcallDeferredModule = require(util.pcallDeferred)
local validation = parent.validation
local validateSingleInstanceModule = require(validation.validateSingleInstance)
local validateInstanceTreeModule = require(validation.validateInstanceTree)
local validateTagsModule = require(validation.validateTags)
local validateAttributesModule = require(validation.validateAttributes)
local validateDependenciesModule = require(validation.validateDependencies)
local validateModerationModule = require(validation.validateModeration)
local validateCurveAnimationModule = require(validation.ValidateCurveAnimation)
local validatePropertiesSensibleModule = require(validation.ValidatePropertiesSensible)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local t = {
	validateStructure = function(p0) --[[ line: 49 ]]
		-- upvalues: validateSingleInstanceModule (ref), validateInstanceTreeModule (ref), createEmoteSchemaModule (ref)
		local var18, var19 = validateSingleInstanceModule(p0.instances or {}, p0)
		
		if not var18 then
			return false, var19
		end
		local var20 = p0.instances[1]
		local var21, var22 = validateInstanceTreeModule(createEmoteSchemaModule(), var20, p0)
		
		if var21 then
			return true, nil, var20
		end
		return false, var22
	end
}

local function reportError(p1, p2, p3) --[[ line: 34 ]]
	-- upvalues: analyticsModule (ref)
	if p3.isServer ~= nil and p3.isServer then
		error(p1)
	end
	analyticsModule.reportFailure(p2, nil, p3)
	
	return false, { p1 }
end

function t.validate(p4) --[[ line: 70 ]]
	-- upvalues: t (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateCurveAnimModule (ref), pcallDeferredModule (ref), reportError (ref), analyticsModule (ref), validateCurveAnimationModule (ref), validateModerationModule (ref)
	local _ = nil
	local var23, var24, var25 = t.validateStructure(p4)
	
	if not var23 then
		return false, var24
	end
	local var26 = var25
	
	if getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var27, var28 = validatePropertiesSensibleModule.validate(var26, p4)
		
		if not var27 then
			return false, var28
		end
	end
	local var29, var30 = validateDependenciesModule(var26, p4, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
	if not var29 then
		return false, var30
	end
	local var31 = failureReasonsAccumulatorModule.new()
	var31:updateReasons(validateTagsModule(var26, p4))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		var31:updateReasons(validateAttributesModule(var26, p4))
	end
	if not getFFlagUGCValidateMigrateCurveAnimModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local var32 = nil
		local var33, var34 = pcallDeferredModule(function() --[[ line: 109 ]]
			-- upvalues: var26 (write)
			return game:GetObjectsAllOrNone(var26.AnimationId)
		end, p4)
		
		if not var33 or not var34 then
			return reportError("Could not download Curve animation.", analyticsModule.ErrorType.validateEmoteAnimation_FailedToDownloadCurveAnimation, p4)
		elseif #var34 == 1 then
			var32 = var34[1]
		else
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, p4)
			
			return false, {
				"Downloaded Curve animation did not have exactly one root. Please fix the animation."
			}
		end
		var31:updateReasons(validateCurveAnimationModule.validate(var32, p4))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		var31:updateReasons(validateModerationModule(var26, p4.restrictedUserIds, p4))
	end
	return var31:getFinalResults()
end

return t