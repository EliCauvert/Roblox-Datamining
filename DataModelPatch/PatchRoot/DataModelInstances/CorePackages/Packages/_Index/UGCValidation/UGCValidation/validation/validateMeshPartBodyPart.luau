local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local GetFFlagDebugUGCDisableSurfaceAppearanceTestsModule = require(Parent.flags.getFFlagDebugUGCDisableSurfaceAppearanceTests)
local ValidateBodyPartMeshBoundsModule = require(Parent.validation.validateBodyPartMeshBounds)
local ValidateAssetBoundsModule = require(Parent.validation.validateAssetBounds)
local ValidateAccurateBoundingBoxRasterMethodModule = require(Parent.validation.validateAccurateBoundingBoxRasterMethod)
local ValidateBodyPartChildAttachmentBoundsModule = require(Parent.validation.validateBodyPartChildAttachmentBounds)
local ValidateBodyPartChildAttachmentOrientationsModule = require(Parent.validation.validateBodyPartChildAttachmentOrientations)
local ValidateBodyPartExtentsRelativeToParentModule = require(Parent.validation.validateBodyPartExtentsRelativeToParent)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local ValidateDescendantMeshMetricsModule = require(Parent.validation.validateDescendantMeshMetrics)
local ValidateDescendantTextureMetricsModule = require(Parent.validation.validateDescendantTextureMetrics)
local ValidateSurfaceAppearancesModule = require(Parent.validation.validateSurfaceAppearances)
local ValidateMaterialsModule = require(Parent.validation.validateMaterials)
local ValidateTagsModule = require(Parent.validation.validateTags)
local ValidatePropertyRequirementsModule = require(Parent.validation.validatePropertyRequirements)
local ValidateAttributesModule = require(Parent.validation.validateAttributes)
local ValidateHSRModule = require(Parent.validation.validateHSR)
local ValidateBodyPartCollisionFidelityModule = require(Parent.validation.validateBodyPartCollisionFidelity)
local ValidateModerationModule = require(Parent.validation.validateModeration)
local ValidateAssetTransparencyModule = require(Parent.validation.validateAssetTransparency)
local ValidatePoseModule = require(Parent.validation.validatePose)
local ValidateBodyBlockingTestsModule = require(Parent.util.ValidateBodyBlockingTests)
local ValidateMeshSizePropertyModule = require(Parent.validation.ValidateMeshSizeProperty)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local ValidateLegsSeparationModule = require(Parent.validation.ValidateLegsSeparation)
local ValidateTexturePackModule = require(Parent.validation.ValidateTexturePack)
local ValidateWithSchemaModule = require(Parent.util.validateWithSchema)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ValidateMeshPartOnlySkinnedToR15Module = require(Parent.validation.ValidateMeshPartOnlySkinnedToR15)
local BodyAssetMasksRendererModule = require(Parent.util.bodyAssetMasksRenderer)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidateTexturePackModule = require(Parent.flags.getFFlagUGCValidateTexturePack)
local GetFFlagUGCValidationEnableR15plusSkinningModule = require(Parent.flags.getFFlagUGCValidationEnableR15plusSkinning)
local ResetPhysicsDataModule = require(Parent.util.resetPhysicsData)
local _ = require(Parent.util.Types)
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local GetFFlagUGCValidationCombineEntrypointResultsModule = require(Parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local GetFFlagUGCValidateMigrateTextureTransparencyModule = require(Parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local GetFFlagUGCValidateMigrateBodyPartBoundsModule = require(Parent.flags.getFFlagUGCValidateMigrateBodyPartBounds)
local GetFFlagUGCValidateMigratePoseBlockingModule = require(Parent.flags.getFFlagUGCValidateMigratePoseBlocking)
local GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(Parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)

return function(p1, p2, p3)
	-- upvalues: ValidateWithSchemaModule (copy), AnalyticsModule (copy), GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (copy), GetFFlagDebugUGCDisableSurfaceAppearanceTestsModule (copy), ValidateSurfaceAppearancesModule (copy), GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), GetFFlagUGCValidationCombineEntrypointResultsModule (copy), ValidateDependenciesModule (copy), ResetPhysicsDataModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), GetFFlagUGCValidateMigratePoseBlockingModule (copy), ValidateBodyBlockingTestsModule (copy), GetFFlagUGCValidateMigrateBodyPartBoundsModule (copy), ValidateMeshSizePropertyModule (copy), FailureReasonsAccumulatorModule (copy), ValidateBodyPartMeshBoundsModule (copy), GetFFlagUGCValidateTexturePackModule (copy), ValidateTexturePackModule (copy), ValidateBodyPartChildAttachmentBoundsModule (copy), ValidateBodyPartExtentsRelativeToParentModule (copy), ValidateBodyPartChildAttachmentOrientationsModule (copy), ValidatePoseModule (copy), ValidateAssetBoundsModule (copy), ValidateLegsSeparationModule (copy), ValidateAccurateBoundingBoxRasterMethodModule (copy), BodyAssetMasksRendererModule (copy), ValidateDescendantMeshMetricsModule (copy), GetFFlagUGCValidateMigrateTextureTransparencyModule (copy), ValidateDescendantTextureMetricsModule (copy), ValidateHSRModule (copy), ValidateAssetTransparencyModule (copy), ValidateMaterialsModule (copy), ValidatePropertyRequirementsModule (copy), ValidateBodyPartCollisionFidelityModule (copy), ValidateAttributesModule (copy), ValidateTagsModule (copy), GetFFlagUGCValidationEnableR15plusSkinningModule (copy), ValidateMeshPartOnlySkinnedToR15Module (copy), ValidateModerationModule (copy)
	local IsServer = p3.isServer
	local AssetTypeEnum = p3.assetTypeEnum
	local AllowUnreviewedAssets = p3.allowUnreviewedAssets
	local RestrictedUserIds = p3.restrictedUserIds
	local ValidateWithSchemaModuleResult = ValidateWithSchemaModule(p2, p1, p3)
	
	if not ValidateWithSchemaModuleResult.success then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, p3)
		
		return false, {
			string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", p1.Name),
			ValidateWithSchemaModuleResult.message
		}
	end
	if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and not GetFFlagDebugUGCDisableSurfaceAppearanceTestsModule() then
		local ValidateSurfaceAppearancesModuleResult, ValidateSurfaceAppearancesModuleResult2 = ValidateSurfaceAppearancesModule(p1, p3)
		
		if not ValidateSurfaceAppearancesModuleResult then
			return ValidateSurfaceAppearancesModuleResult, ValidateSurfaceAppearancesModuleResult2
		end
	end
	local ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2 = ValidateDependenciesModule(p1, p3, {
		skipExistenceCheck = GetFFlagUGCValidateMigrateSchemaPropertiesModule() and GetFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = GetFFlagUGCValidateMigrateSchemaPropertiesModule() and GetFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
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
	if not GetFFlagUGCValidateMigratePoseBlockingModule() then
		local ValidateResult1, ValidateResult2_1 = ValidateBodyBlockingTestsModule.validate(p1, p3)
		
		if not ValidateResult1 then
			return false, ValidateResult2_1
		end
	end
	if not GetFFlagUGCValidateMigrateBodyPartBoundsModule() then
		local ValidateBodyAssetResult, ValidateBodyAssetResult2 = ValidateMeshSizePropertyModule.validateBodyAsset(p1, p3)
		
		if not ValidateBodyAssetResult then
			return false, ValidateBodyAssetResult2
		end
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if not GetFFlagUGCValidateMigrateBodyPartBoundsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateBodyPartMeshBoundsModule(p1, p3))
	end
	if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and GetFFlagUGCValidateTexturePackModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateTexturePackModule.validate(p1, true, p3))
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateBodyPartChildAttachmentBoundsModule(p1, p3))
	end
	if not GetFFlagUGCValidateMigrateBodyPartBoundsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateBodyPartExtentsRelativeToParentModule.runValidation(p1, p3))
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateBodyPartChildAttachmentOrientationsModule.runValidation(p1, p3))
	end
	if not GetFFlagUGCValidateMigratePoseBlockingModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidatePoseModule(p1, p3))
	end
	if not GetFFlagUGCValidateMigrateBodyPartBoundsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateAssetBoundsModule(nil, p1, p3))
	end
	if not GetFFlagUGCValidateMigratePoseBlockingModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateLegsSeparationModule.validateAsset(p1, p3))
	end
	if not GetFFlagUGCValidateMigratePoseBlockingModule() then
		local NewBodyAssetMasksRenderer, NewBodyAssetMasksRenderer2 = BodyAssetMasksRendererModule.new(p1, ValidateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(AssetTypeEnum), p3)
		
		if NewBodyAssetMasksRenderer then
			NewFailureReasonsAccumulator:updateReasons(ValidateAccurateBoundingBoxRasterMethodModule.validate(p1, NewBodyAssetMasksRenderer2, p3))
		else
			NewFailureReasonsAccumulator:updateReasons(NewBodyAssetMasksRenderer, NewBodyAssetMasksRenderer2)
		end
	end
	NewFailureReasonsAccumulator:updateReasons(ValidateDescendantMeshMetricsModule(p1, p3))
	
	if not GetFFlagUGCValidateMigrateTextureTransparencyModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateDescendantTextureMetricsModule(p1, p3))
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateHSRModule(p1, p3))
	end
	if not GetFFlagUGCValidateMigrateTextureTransparencyModule() then
		local CurrentTime = tick()
		NewFailureReasonsAccumulator:updateReasons(ValidateAssetTransparencyModule(p1, p3))
		AnalyticsModule.recordScriptTime("validateAssetTransparency", CurrentTime, p3)
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateMaterialsModule(p1, p3))
		NewFailureReasonsAccumulator:updateReasons(ValidatePropertyRequirementsModule(p1, AssetTypeEnum, p3))
		NewFailureReasonsAccumulator:updateReasons(ValidateBodyPartCollisionFidelityModule(p1, p3))
		NewFailureReasonsAccumulator:updateReasons(ValidateAttributesModule(p1, p3))
	end
	NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(p1, p3))
	
	if not GetFFlagUGCValidationEnableR15plusSkinningModule() and AssetTypeEnum ~= Enum.AssetType.DynamicHead then
		NewFailureReasonsAccumulator:updateReasons(ValidateMeshPartOnlySkinnedToR15Module.validateBodyParts(p1, p3))
	end
	if (not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule()) and (not AllowUnreviewedAssets and not IsServer) then
		NewFailureReasonsAccumulator:updateReasons(ValidateModerationModule(p1, RestrictedUserIds, p3))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end