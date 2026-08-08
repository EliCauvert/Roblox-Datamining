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

return function(p0, p1, p2) --[[ line: 57 | named "validateMeshPartBodyPart" ]]
	-- upvalues: validateWithSchemaModule (ref), analyticsModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), getFFlagDebugUGCDisableSurfaceAppearanceTestsModule (ref), validateSurfaceAppearancesModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), resetPhysicsDataModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigratePoseBlockingModule (ref), validateBodyBlockingTestsModule (ref), getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), validateMeshSizePropertyModule (ref), failureReasonsAccumulatorModule (ref), validateBodyPartMeshBoundsModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), validateBodyPartChildAttachmentBoundsModule (ref), validateBodyPartExtentsRelativeToParentModule (ref), validateBodyPartChildAttachmentOrientationsModule (ref), validatePoseModule (ref), validateAssetBoundsModule (ref), validateLegsSeparationModule (ref), validateAccurateBoundingBoxRasterMethodModule (ref), bodyAssetMasksRendererModule (ref), validateDescendantMeshMetricsModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), validateDescendantTextureMetricsModule (ref), validateHSRModule (ref), validateAssetTransparencyModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateBodyPartCollisionFidelityModule (ref), validateAttributesModule (ref), validateTagsModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), validateMeshPartOnlySkinnedToR15Module (ref), validateModerationModule (ref)
	local isServer = p2.isServer
	local assetTypeEnum = p2.assetTypeEnum
	local allowUnreviewedAssets = p2.allowUnreviewedAssets
	local restrictedUserIds = p2.restrictedUserIds
	local var39 = validateWithSchemaModule(p1, p0, p2)
	
	if not var39.success then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, p2)
		
		return false, {
			string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", p0.Name),
			var39.message
		}
	elseif not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and not getFFlagDebugUGCDisableSurfaceAppearanceTestsModule() then
		local var40, var41 = validateSurfaceAppearancesModule(p0, p2)
		
		if not var40 then
			return var40, var41
		end
	end
	local var42, var43 = validateDependenciesModule(p0, p2, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var42 then
		return var42, var43
	end
	local var44, var45 = resetPhysicsDataModule({ p0 }, p2)
	
	if not var44 then
		return false, { var45 }
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var46, var47 = validatePropertiesSensibleModule.validate(p0, p2)
		
		if not var46 then
			return false, var47
		elseif not getFFlagUGCValidateMigratePoseBlockingModule() then
			local var48, var49 = validateBodyBlockingTestsModule.validate(p0, p2)
			
			if not var48 then
				return false, var49
			elseif not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				local var50, var51 = validateMeshSizePropertyModule.validateBodyAsset(p0, p2)
				
				if not var50 then
					return false, var51
				end
			end
			local var52 = failureReasonsAccumulatorModule.new()
			
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var52:updateReasons(validateBodyPartMeshBoundsModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
				var52:updateReasons(validateTexturePackModule.validate(p0, true, p2))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
				var52:updateReasons(validateBodyPartChildAttachmentBoundsModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var52:updateReasons(validateBodyPartExtentsRelativeToParentModule.runValidation(p0, p2))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
				var52:updateReasons(validateBodyPartChildAttachmentOrientationsModule.runValidation(p0, p2))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				var52:updateReasons(validatePoseModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var52:updateReasons(validateAssetBoundsModule(nil, p0, p2))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				var52:updateReasons(validateLegsSeparationModule.validateAsset(p0, p2))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				local _ = nil
				local var53, var54 = bodyAssetMasksRendererModule.new(p0, validateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(assetTypeEnum), p2)
				local var55 = var53
				local var56 = var54
				
				if var55 then
					var52:updateReasons(validateAccurateBoundingBoxRasterMethodModule.validate(p0, var56, p2))
				else
					var52:updateReasons(var55, var56)
				end
			end
			var52:updateReasons(validateDescendantMeshMetricsModule(p0, p2))
			
			if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
				var52:updateReasons(validateDescendantTextureMetricsModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
				var52:updateReasons(validateHSRModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
				local currentTime = tick()
				var52:updateReasons(validateAssetTransparencyModule(p0, p2))
				analyticsModule.recordScriptTime("validateAssetTransparency", currentTime, p2)
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
				var52:updateReasons(validateMaterialsModule(p0, p2))
				var52:updateReasons(validatePropertyRequirementsModule(p0, assetTypeEnum, p2))
				var52:updateReasons(validateBodyPartCollisionFidelityModule(p0, p2))
				var52:updateReasons(validateAttributesModule(p0, p2))
			end
			var52:updateReasons(validateTagsModule(p0, p2))
			
			if not getFFlagUGCValidationEnableR15plusSkinningModule() and assetTypeEnum ~= Enum.AssetType.DynamicHead then
				var52:updateReasons(validateMeshPartOnlySkinnedToR15Module.validateBodyParts(p0, p2))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
				var52:updateReasons(validateModerationModule(p0, restrictedUserIds, p2))
			end
			return var52:getFinalResults()
		end
	end
end