local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local ValidateDescendantMeshMetricsModule = require(Parent.validation.validateDescendantMeshMetrics)
local ValidateTagsModule = require(Parent.validation.validateTags)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local ValidateWithSchemaModule = require(Parent.util.validateWithSchema)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ValidateMeshPartOnlySkinnedToR15Module = require(Parent.validation.ValidateMeshPartOnlySkinnedToR15)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidationEnableR15plusSkinningModule = require(Parent.flags.getFFlagUGCValidationEnableR15plusSkinning)
local ResetPhysicsDataModule = require(Parent.util.resetPhysicsData)
local _ = require(Parent.util.Types)

return function(p1, p2, p3)
	-- upvalues: ValidateWithSchemaModule (copy), AnalyticsModule (copy), ValidateDependenciesModule (copy), ResetPhysicsDataModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), FailureReasonsAccumulatorModule (copy), ValidateDescendantMeshMetricsModule (copy), ValidateTagsModule (copy), GetFFlagUGCValidationEnableR15plusSkinningModule (copy), ValidateMeshPartOnlySkinnedToR15Module (copy)
	local AssetTypeEnum = p3.assetTypeEnum
	local ValidateWithSchemaModuleResult = ValidateWithSchemaModule(p2, p1, p3)
	
	if not ValidateWithSchemaModuleResult.success then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, p3)
		
		return false, {
			string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", p1.Name),
			ValidateWithSchemaModuleResult.message
		}
	end
	local ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2 = ValidateDependenciesModule(p1, p3, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
	if not ValidateDependenciesModuleResult then
		return ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2
	end
	local ResetPhysicsDataModuleResult, ResetPhysicsDataModuleResult2 = ResetPhysicsDataModule({ p1 }, p3)
	
	if not ResetPhysicsDataModuleResult then
		return false, { ResetPhysicsDataModuleResult2 }
	end
	if GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local ValidateResult, ValidateResult2 = ValidatePropertiesSensibleModule.validate(p1, p3)
		
		if not ValidateResult then
			return false, ValidateResult2
		end
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	NewFailureReasonsAccumulator:updateReasons(ValidateDescendantMeshMetricsModule(p1, p3))
	NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(p1, p3))
	
	if not GetFFlagUGCValidationEnableR15plusSkinningModule() and AssetTypeEnum ~= Enum.AssetType.DynamicHead then
		NewFailureReasonsAccumulator:updateReasons(ValidateMeshPartOnlySkinnedToR15Module.validateBodyParts(p1, p3))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end