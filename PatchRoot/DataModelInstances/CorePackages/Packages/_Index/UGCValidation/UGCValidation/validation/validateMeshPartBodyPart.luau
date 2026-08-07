-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

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
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateBodyPartBoundsModule = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds)
local getFFlagUGCValidateMigratePoseBlockingModule = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)

return function(p0, p1, p2) --[[ line: 58 | named "validateMeshPartBodyPart" ]]
	-- upvalues: validateWithSchemaModule (ref), analyticsModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), getFFlagDebugUGCDisableSurfaceAppearanceTestsModule (ref), validateSurfaceAppearancesModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref), validateDependenciesModule (ref), resetPhysicsDataModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigratePoseBlockingModule (ref), validateBodyBlockingTestsModule (ref), getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), validateMeshSizePropertyModule (ref), failureReasonsAccumulatorModule (ref), validateBodyPartMeshBoundsModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), validateBodyPartChildAttachmentBoundsModule (ref), validateBodyPartExtentsRelativeToParentModule (ref), validateBodyPartChildAttachmentOrientationsModule (ref), validatePoseModule (ref), validateAssetBoundsModule (ref), validateLegsSeparationModule (ref), validateAccurateBoundingBoxRasterMethodModule (ref), bodyAssetMasksRendererModule (ref), validateDescendantMeshMetricsModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), validateDescendantTextureMetricsModule (ref), validateHSRModule (ref), validateAssetTransparencyModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateBodyPartCollisionFidelityModule (ref), validateAttributesModule (ref), validateTagsModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), validateMeshPartOnlySkinnedToR15Module (ref), validateModerationModule (ref)
	local isServer = p2.isServer
	local assetTypeEnum = p2.assetTypeEnum
	local allowUnreviewedAssets = p2.allowUnreviewedAssets
	local restrictedUserIds = p2.restrictedUserIds
	local var40 = validateWithSchemaModule(p1, p0, p2)
	
	if not var40.success then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, p2)
		
		return false, {
			string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", p0.Name),
			var40.message
		}
	elseif not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and not getFFlagDebugUGCDisableSurfaceAppearanceTestsModule() then
		local var41, var42 = validateSurfaceAppearancesModule(p0, p2)
		
		if not var41 then
			return var41, var42
		end
	end
	local var43, var44 = validateDependenciesModule(p0, p2, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
	if not var43 then
		return var43, var44
	end
	local var45, var46 = resetPhysicsDataModule({ p0 }, p2)
	
	if not var45 then
		return false, { var46 }
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var47, var48 = validatePropertiesSensibleModule.validate(p0, p2)
		
		if not var47 then
			return false, var48
		elseif not getFFlagUGCValidateMigratePoseBlockingModule() then
			local var49, var50 = validateBodyBlockingTestsModule.validate(p0, p2)
			
			if not var49 then
				return false, var50
			elseif not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				local var51, var52 = validateMeshSizePropertyModule.validateBodyAsset(p0, p2)
				
				if not var51 then
					return false, var52
				end
			end
			local var53 = failureReasonsAccumulatorModule.new()
			
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var53:updateReasons(validateBodyPartMeshBoundsModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
				var53:updateReasons(validateTexturePackModule.validate(p0, true, p2))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
				var53:updateReasons(validateBodyPartChildAttachmentBoundsModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var53:updateReasons(validateBodyPartExtentsRelativeToParentModule.runValidation(p0, p2))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
				var53:updateReasons(validateBodyPartChildAttachmentOrientationsModule.runValidation(p0, p2))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				var53:updateReasons(validatePoseModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
				var53:updateReasons(validateAssetBoundsModule(nil, p0, p2))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				var53:updateReasons(validateLegsSeparationModule.validateAsset(p0, p2))
			end
			if not getFFlagUGCValidateMigratePoseBlockingModule() then
				local _ = nil
				local var54, var55 = bodyAssetMasksRendererModule.new(p0, validateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(assetTypeEnum), p2)
				local var56 = var54
				local var57 = var55
				
				if var56 then
					var53:updateReasons(validateAccurateBoundingBoxRasterMethodModule.validate(p0, var57, p2))
				else
					var53:updateReasons(var56, var57)
				end
			end
			var53:updateReasons(validateDescendantMeshMetricsModule(p0, p2))
			
			if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
				var53:updateReasons(validateDescendantTextureMetricsModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
				var53:updateReasons(validateHSRModule(p0, p2))
			end
			if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
				local currentTime = tick()
				var53:updateReasons(validateAssetTransparencyModule(p0, p2))
				analyticsModule.recordScriptTime("validateAssetTransparency", currentTime, p2)
			end
			if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
				var53:updateReasons(validateMaterialsModule(p0, p2))
				var53:updateReasons(validatePropertyRequirementsModule(p0, assetTypeEnum, p2))
				var53:updateReasons(validateBodyPartCollisionFidelityModule(p0, p2))
				var53:updateReasons(validateAttributesModule(p0, p2))
			end
			var53:updateReasons(validateTagsModule(p0, p2))
			
			if not getFFlagUGCValidationEnableR15plusSkinningModule() and assetTypeEnum ~= Enum.AssetType.DynamicHead then
				var53:updateReasons(validateMeshPartOnlySkinnedToR15Module.validateBodyParts(p0, p2))
			end
			if (not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule()) and (if allowUnreviewedAssets then false else not isServer) then
				var53:updateReasons(validateModerationModule(p0, restrictedUserIds, p2))
			end
			return var53:getFinalResults()
		end
	end
end