local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local Util = Parent.util
local _ = require(Util.Types)
local CreateEmoteSchemaModule = require(Util.createEmoteSchema)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local PcallDeferredModule = require(Util.pcallDeferred)
local Validation = Parent.validation
local ValidateSingleInstanceModule = require(Validation.validateSingleInstance)
local ValidateInstanceTreeModule = require(Validation.validateInstanceTree)
local ValidateTagsModule = require(Validation.validateTags)
local ValidateAttributesModule = require(Validation.validateAttributes)
local ValidateDependenciesModule = require(Validation.validateDependencies)
local ValidateModerationModule = require(Validation.validateModeration)
local ValidateCurveAnimationModule = require(Validation.ValidateCurveAnimation)
local ValidatePropertiesSensibleModule = require(Validation.ValidatePropertiesSensible)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local GetFFlagUGCValidationCombineEntrypointResultsModule = require(Parent.flags.getFFlagUGCValidationCombineEntrypointResults)

local function reportError(p1, ValidateEmoteAnimationFailedToDownloadCurveAnimation, p2)
	-- upvalues: AnalyticsModule (copy)
	if p2.isServer ~= nil and p2.isServer then
		error(p1)
	end
	AnalyticsModule.reportFailure(ValidateEmoteAnimationFailedToDownloadCurveAnimation, nil, p2)
	
	return false, { p1 }
end

local ValidateEmoteAnimationModule = {
	validateStructure = function(p1)
		-- upvalues: ValidateSingleInstanceModule (copy), ValidateInstanceTreeModule (copy), CreateEmoteSchemaModule (copy)
		local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(p1.instances or {}, p1)
		
		if not ValidateSingleInstanceModuleResult then
			return false, ValidateSingleInstanceModuleResult2
		end
		local InstancesEntry = p1.instances[1]
		local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(CreateEmoteSchemaModule(), InstancesEntry, p1)
		
		if ValidateInstanceTreeModuleResult then
			return true, nil, InstancesEntry
		else
			return false, ValidateInstanceTreeModuleResult2
		end
	end
}

function ValidateEmoteAnimationModule.validate(Animation)
	-- upvalues: ValidateEmoteAnimationModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), GetFFlagUGCValidationCombineEntrypointResultsModule (copy), ValidateDependenciesModule (copy), FailureReasonsAccumulatorModule (copy), ValidateTagsModule (copy), ValidateAttributesModule (copy), GetFFlagUGCValidateMigrateCurveAnimModule (copy), PcallDeferredModule (copy), reportError (copy), AnalyticsModule (copy), ValidateCurveAnimationModule (copy), ValidateModerationModule (copy)
	local Animation1 = nil
	local ValidateStructureResult, ValidateStructureResult2, ValidateStructureResult3 = ValidateEmoteAnimationModule.validateStructure(Animation)
	
	if not ValidateStructureResult then
		return false, ValidateStructureResult2
	end
	Animation1 = ValidateStructureResult3
	
	if GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local ValidateResult, ValidateResult2 = ValidatePropertiesSensibleModule.validate(Animation1, Animation)
		
		if not ValidateResult then
			return false, ValidateResult2
		end
	end
	local ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2 = ValidateDependenciesModule(Animation1, Animation, {
		skipExistenceCheck = GetFFlagUGCValidateMigrateSchemaPropertiesModule() and GetFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = GetFFlagUGCValidateMigrateSchemaPropertiesModule() and GetFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
	if not ValidateDependenciesModuleResult then
		return false, ValidateDependenciesModuleResult2
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(Animation1, Animation))
	
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateAttributesModule(Animation1, Animation))
	end
	if not GetFFlagUGCValidateMigrateCurveAnimModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		local v1 = nil
		local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
			-- upvalues: Animation1 (ref)
			return (game:GetObjectsAllOrNone(Animation1.AnimationId))
		end, Animation)
		
		if not PcallDeferredModuleResult or not PcallDeferredModuleResult2 then
			return reportError("Could not download Curve animation.", AnalyticsModule.ErrorType.validateEmoteAnimation_FailedToDownloadCurveAnimation, Animation)
		end
		if #PcallDeferredModuleResult2 ~= 1 then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, Animation)
			
			return false, {
				"Downloaded Curve animation did not have exactly one root. Please fix the animation."
			}
		end
		v1 = PcallDeferredModuleResult2[1]
		NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validate(v1, Animation))
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateModerationModule(Animation1, Animation.restrictedUserIds, Animation))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

return ValidateEmoteAnimationModule