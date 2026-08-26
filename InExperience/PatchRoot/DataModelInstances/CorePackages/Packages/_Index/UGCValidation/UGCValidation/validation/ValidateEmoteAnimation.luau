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
	validateStructure = function(p1)
		-- upvalues: validateSingleInstanceModule (ref), validateInstanceTreeModule (ref), createEmoteSchemaModule (ref)
		local var1, var2 = validateSingleInstanceModule(p1.instances or {}, p1)
		
		if not var1 then
			return false, var2
		end
		local var3 = p1.instances[1]
		local var4, var5 = validateInstanceTreeModule(createEmoteSchemaModule(), var3, p1)
		
		if var4 then
			return true, nil, var3
		end
		return false, var5
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

function t.validate(p1)
	-- upvalues: t (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateCurveAnimModule (ref), pcallDeferredModule (ref), reportError (ref), analyticsModule (ref), validateCurveAnimationModule (ref), validateModerationModule (ref)
	local _ = nil
	local var1, var2, var3 = t.validateStructure(p1)
	
	if not var1 then
		return false, var2
	end
	local var4 = var3
	
	if getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var5, var6 = validatePropertiesSensibleModule.validate(var4, p1)
		
		if not var5 then
			return false, var6
		end
	end
	local var7, var8 = validateDependenciesModule(var4, p1, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var7 then
		return false, var8
	end
	local var9 = failureReasonsAccumulatorModule.new()
	var9:updateReasons(validateTagsModule(var4, p1))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var9:updateReasons(validateAttributesModule(var4, p1))
	end
	if not getFFlagUGCValidateMigrateCurveAnimModule() then
		local var10 = nil
		local var11, var12 = pcallDeferredModule(function()
			-- upvalues: var4 (write)
			return game:GetObjectsAllOrNone(var4.AnimationId)
		end, p1)
		
		if not var11 or not var12 then
			return reportError("Could not download Curve animation.", analyticsModule.ErrorType.validateEmoteAnimation_FailedToDownloadCurveAnimation, p1)
		elseif #var12 == 1 then
			var10 = var12[1]
		else
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, p1)
			
			return false, {
				"Downloaded Curve animation did not have exactly one root. Please fix the animation."
			}
		end
		var9:updateReasons(validateCurveAnimationModule.validate(var10, p1))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var9:updateReasons(validateModerationModule(var4, p1.restrictedUserIds, p1))
	end
	return var9:getFinalResults()
end

return t