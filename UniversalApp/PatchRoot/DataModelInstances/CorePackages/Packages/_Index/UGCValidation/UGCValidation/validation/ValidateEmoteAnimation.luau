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
local t = {
	validateStructure = function(p0)
		-- upvalues: validateSingleInstanceModule (ref), validateInstanceTreeModule (ref), createEmoteSchemaModule (ref)
		local var17, var18 = validateSingleInstanceModule(p0.instances or {}, p0)
		
		if not var17 then
			return false, var18
		end
		local var19 = p0.instances[1]
		local var20, var21 = validateInstanceTreeModule(createEmoteSchemaModule(), var19, p0)
		
		if var20 then
			return true, nil, var19
		end
		return false, var21
	end
}

local function reportError(p1, p2, p3)
	-- upvalues: analyticsModule (ref)
	if p3.isServer ~= nil and p3.isServer then
		error(p1)
	end
	analyticsModule.reportFailure(p2, nil, p3)
	
	return false, { p1 }
end

function t.validate(p4)
	-- upvalues: t (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateCurveAnimModule (ref), pcallDeferredModule (ref), reportError (ref), analyticsModule (ref), validateCurveAnimationModule (ref), validateModerationModule (ref)
	local _ = nil
	local var22, var23, var24 = t.validateStructure(p4)
	
	if not var22 then
		return false, var23
	end
	local var25 = var24
	
	if getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var26, var27 = validatePropertiesSensibleModule.validate(var25, p4)
		
		if not var26 then
			return false, var27
		end
	end
	local var28, var29 = validateDependenciesModule(var25, p4, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var28 then
		return false, var29
	end
	local var30 = failureReasonsAccumulatorModule.new()
	var30:updateReasons(validateTagsModule(var25, p4))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var30:updateReasons(validateAttributesModule(var25, p4))
	end
	if not getFFlagUGCValidateMigrateCurveAnimModule() then
		local var31 = nil
		local var32, var33 = pcallDeferredModule(function()
			-- upvalues: var25 (write)
			return game:GetObjectsAllOrNone(var25.AnimationId)
		end, p4)
		
		if not var32 or not var33 then
			return reportError("Could not download Curve animation.", analyticsModule.ErrorType.validateEmoteAnimation_FailedToDownloadCurveAnimation, p4)
		elseif #var33 == 1 then
			var31 = var33[1]
		else
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, p4)
			
			return false, {
				"Downloaded Curve animation did not have exactly one root. Please fix the animation."
			}
		end
		var30:updateReasons(validateCurveAnimationModule.validate(var31, p4))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var30:updateReasons(validateModerationModule(var25, p4.restrictedUserIds, p4))
	end
	return var30:getFinalResults()
end

return t