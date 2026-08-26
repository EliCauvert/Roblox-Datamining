local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local getFFlagDebugUGCDisableSurfaceAppearanceTestsModule = require(parent.flags.getFFlagDebugUGCDisableSurfaceAppearanceTests)
local validateBodyPartMeshBoundsModule = require(parent.validation.validateBodyPartMeshBounds)
local validateAssetBoundsModule = require(parent.validation.validateAssetBounds)
local validateAccurateBoundingBoxRasterMethodModule = require(parent.validation.validateAccurateBoundingBoxRasterMethod)
local validateBodyPartChildAttachmentBoundsModule = require(parent.validation.validateBodyPartChildAttachmentBounds)
local validateBodyPartChildAttachmentOrientationsModule = require(parent.validation.validateBodyPartChildAttachmentOrientations)
local validateBodyPartExtentsRelativeToParentModule = require(parent.validation.validateBodyPartExtentsRelativeToParent)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local validateDescendantMeshMetricsModule = require(parent.validation.validateDescendantMeshMetrics)
local validateDescendantTextureMetricsModule = require(parent.validation.validateDescendantTextureMetrics)
local validateSurfaceAppearancesModule = require(parent.validation.validateSurfaceAppearances)
local validateMaterialsModule = require(parent.validation.validateMaterials)
local validateTagsModule = require(parent.validation.validateTags)
local validatePropertyRequirementsModule = require(parent.validation.validatePropertyRequirements)
local validateAttributesModule = require(parent.validation.validateAttributes)
local validateHSRModule = require(parent.validation.validateHSR)
local validateBodyPartCollisionFidelityModule = require(parent.validation.validateBodyPartCollisionFidelity)
local validateModerationModule = require(parent.validation.validateModeration)
local validateAssetTransparencyModule = require(parent.validation.validateAssetTransparency)
local validatePoseModule = require(parent.validation.validatePose)
local validateBodyBlockingTestsModule = require(parent.util.ValidateBodyBlockingTests)
local validateMeshSizePropertyModule = require(parent.validation.ValidateMeshSizeProperty)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local validateLegsSeparationModule = require(parent.validation.ValidateLegsSeparation)
local validateTexturePackModule = require(parent.validation.ValidateTexturePack)
local validateWithSchemaModule = require(parent.util.validateWithSchema)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateMeshPartOnlySkinnedToR15Module = require(parent.validation.ValidateMeshPartOnlySkinnedToR15)
local bodyAssetMasksRendererModule = require(parent.util.bodyAssetMasksRenderer)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)
local getFFlagUGCValidationEnableR15plusSkinningModule = require(parent.flags.getFFlagUGCValidationEnableR15plusSkinning)
local resetPhysicsDataModule = require(parent.util.resetPhysicsData)
local _ = require(parent.util.Types)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateBodyPartBoundsModule = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds)
local getFFlagUGCValidateMigratePoseBlockingModule = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)

return function(p1, p2, p3)
	-- upvalues: validateWithSchemaModule (ref), analyticsModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), getFFlagDebugUGCDisableSurfaceAppearanceTestsModule (ref), validateSurfaceAppearancesModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), resetPhysicsDataModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigratePoseBlockingModule (ref), validateBodyBlockingTestsModule (ref), getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), validateMeshSizePropertyModule (ref), failureReasonsAccumulatorModule (ref), validateBodyPartMeshBoundsModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), validateBodyPartChildAttachmentBoundsModule (ref), validateBodyPartExtentsRelativeToParentModule (ref), validateBodyPartChildAttachmentOrientationsModule (ref), validatePoseModule (ref), validateAssetBoundsModule (ref), validateLegsSeparationModule (ref), validateAccurateBoundingBoxRasterMethodModule (ref), bodyAssetMasksRendererModule (ref), validateDescendantMeshMetricsModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), validateDescendantTextureMetricsModule (ref), validateHSRModule (ref), validateAssetTransparencyModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateBodyPartCollisionFidelityModule (ref), validateAttributesModule (ref), validateTagsModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), validateMeshPartOnlySkinnedToR15Module (ref), validateModerationModule (ref)
	local isServer = p3.isServer
	local assetTypeEnum = p3.assetTypeEnum
	local allowUnreviewedAssets = p3.allowUnreviewedAssets
	local restrictedUserIds = p3.restrictedUserIds
	local var1 = validateWithSchemaModule(p2, p1, p3)
	
	if not var1.success then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, p3)
		
		return false, {
			string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", p1.Name),
			var1.message
		}
	elseif not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and not getFFlagDebugUGCDisableSurfaceAppearanceTestsModule() then
		local var2, var3 = validateSurfaceAppearancesModule(p1, p3)
		
		if not var2 then
			return var2, var3
		end
	end
	local var4, var5 = validateDependenciesModule(p1, p3, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var4 then
		return var4, var5
	end
	local var6, var7 = resetPhysicsDataModule({ p1 }, p3)
	
	if not var6 then
		return false, { var7 }
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var8, var9 = validatePropertiesSensibleModule.validate(p1, p3)
		
		if not var8 then
			return false, var9
		elseif not getFFlagUGCValidateMigratePoseBlockingModule() then
			local var10, var11 = validateBodyBlockingTestsModule.validate(p1, p3)
			
			if not var10 then
				return false, var11
			elseif not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				local var12, var13 = validateMeshSizePropertyModule.validateBodyAsset(p1, p3)
				
				if not var12 then
					return false, var13
				end
			end
			local var14 = failureReasonsAccumulatorModule.new()
			
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var14:updateReasons(validateBodyPartMeshBoundsModule(p1, p3))
			end
			if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
				var14:updateReasons(validateTexturePackModule.validate(p1, true, p3))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
				var14:updateReasons(validateBodyPartChildAttachmentBoundsModule(p1, p3))
			end
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var14:updateReasons(validateBodyPartExtentsRelativeToParentModule.runValidation(p1, p3))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
				var14:updateReasons(validateBodyPartChildAttachmentOrientationsModule.runValidation(p1, p3))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				var14:updateReasons(validatePoseModule(p1, p3))
			end
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var14:updateReasons(validateAssetBoundsModule(nil, p1, p3))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				var14:updateReasons(validateLegsSeparationModule.validateAsset(p1, p3))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				local _ = nil
				local var15, var16 = bodyAssetMasksRendererModule.new(p1, validateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(assetTypeEnum), p3)
				local var17 = var15
				local var18 = var16
				
				if var17 then
					var14:updateReasons(validateAccurateBoundingBoxRasterMethodModule.validate(p1, var18, p3))
				else
					var14:updateReasons(var17, var18)
				end
			end
			var14:updateReasons(validateDescendantMeshMetricsModule(p1, p3))
			
			if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
				var14:updateReasons(validateDescendantTextureMetricsModule(p1, p3))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
				var14:updateReasons(validateHSRModule(p1, p3))
			end
			if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
				local currentTime = tick()
				var14:updateReasons(validateAssetTransparencyModule(p1, p3))
				analyticsModule.recordScriptTime("validateAssetTransparency", currentTime, p3)
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
				var14:updateReasons(validateMaterialsModule(p1, p3))
				var14:updateReasons(validatePropertyRequirementsModule(p1, assetTypeEnum, p3))
				var14:updateReasons(validateBodyPartCollisionFidelityModule(p1, p3))
				var14:updateReasons(validateAttributesModule(p1, p3))
			end
			var14:updateReasons(validateTagsModule(p1, p3))
			
			if not getFFlagUGCValidationEnableR15plusSkinningModule() and assetTypeEnum ~= Enum.AssetType.DynamicHead then
				var14:updateReasons(validateMeshPartOnlySkinnedToR15Module.validateBodyParts(p1, p3))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
				var14:updateReasons(validateModerationModule(p1, restrictedUserIds, p3))
			end
			return var14:getFinalResults()
		end
	end
end