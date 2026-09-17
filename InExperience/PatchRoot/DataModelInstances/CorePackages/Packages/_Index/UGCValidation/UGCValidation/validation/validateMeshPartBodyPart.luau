local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local getFFlagDebugUGCDisableSurfaceAppearanceTestsModule = require(parent.flags.getFFlagDebugUGCDisableSurfaceAppearanceTests)
local validateAccurateBoundingBoxRasterMethodModule = require(parent.validation.validateAccurateBoundingBoxRasterMethod)
local validateBodyPartChildAttachmentBoundsModule = require(parent.validation.validateBodyPartChildAttachmentBounds)
local validateBodyPartChildAttachmentOrientationsModule = require(parent.validation.validateBodyPartChildAttachmentOrientations)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local validateDescendantMeshMetricsModule = require(parent.validation.validateDescendantMeshMetrics)
local validateSurfaceAppearancesModule = require(parent.validation.validateSurfaceAppearances)
local validateMaterialsModule = require(parent.validation.validateMaterials)
local validateTagsModule = require(parent.validation.validateTags)
local validatePropertyRequirementsModule = require(parent.validation.validatePropertyRequirements)
local validateAttributesModule = require(parent.validation.validateAttributes)
local validateHSRModule = require(parent.validation.validateHSR)
local validateBodyPartCollisionFidelityModule = require(parent.validation.validateBodyPartCollisionFidelity)
local validateModerationModule = require(parent.validation.validateModeration)
local validatePoseModule = require(parent.validation.validatePose)
local validateBodyBlockingTestsModule = require(parent.util.ValidateBodyBlockingTests)
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
local getFFlagUGCValidateMigratePoseBlockingModule = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)

return function(p1, p2, p3)
	-- upvalues: validateWithSchemaModule (ref), analyticsModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), getFFlagDebugUGCDisableSurfaceAppearanceTestsModule (ref), validateSurfaceAppearancesModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), resetPhysicsDataModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigratePoseBlockingModule (ref), validateBodyBlockingTestsModule (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), validateBodyPartChildAttachmentBoundsModule (ref), validateBodyPartChildAttachmentOrientationsModule (ref), validatePoseModule (ref), validateLegsSeparationModule (ref), validateAccurateBoundingBoxRasterMethodModule (ref), bodyAssetMasksRendererModule (ref), validateDescendantMeshMetricsModule (ref), validateHSRModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateBodyPartCollisionFidelityModule (ref), validateAttributesModule (ref), validateTagsModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), validateMeshPartOnlySkinnedToR15Module (ref), validateModerationModule (ref)
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
			end
		end
		local var12 = failureReasonsAccumulatorModule.new()
		
		if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
			var12:updateReasons(validateTexturePackModule.validate(p1, true, p3))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var12:updateReasons(validateBodyPartChildAttachmentBoundsModule(p1, p3))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var12:updateReasons(validateBodyPartChildAttachmentOrientationsModule.runValidation(p1, p3))
		end
		if not getFFlagUGCValidateMigratePoseBlockingModule() then
			var12:updateReasons(validatePoseModule(p1, p3))
		end
		if not getFFlagUGCValidateMigratePoseBlockingModule() then
			var12:updateReasons(validateLegsSeparationModule.validateAsset(p1, p3))
		end
		if not getFFlagUGCValidateMigratePoseBlockingModule() then
			local _ = nil
			local var13, var14 = bodyAssetMasksRendererModule.new(p1, validateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(assetTypeEnum), p3)
			local var15 = var13
			local var16 = var14
			
			if var15 then
				var12:updateReasons(validateAccurateBoundingBoxRasterMethodModule.validate(p1, var16, p3))
			else
				var12:updateReasons(var15, var16)
			end
		end
		var12:updateReasons(validateDescendantMeshMetricsModule(p1, p3))
		
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var12:updateReasons(validateHSRModule(p1, p3))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
			var12:updateReasons(validateMaterialsModule(p1, p3))
			var12:updateReasons(validatePropertyRequirementsModule(p1, assetTypeEnum, p3))
			var12:updateReasons(validateBodyPartCollisionFidelityModule(p1, p3))
			var12:updateReasons(validateAttributesModule(p1, p3))
		end
		var12:updateReasons(validateTagsModule(p1, p3))
		
		if not getFFlagUGCValidationEnableR15plusSkinningModule() and assetTypeEnum ~= Enum.AssetType.DynamicHead then
			var12:updateReasons(validateMeshPartOnlySkinnedToR15Module.validateBodyParts(p1, p3))
		end
		if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
			var12:updateReasons(validateModerationModule(p1, restrictedUserIds, p3))
		end
		return var12:getFinalResults()
	end
end