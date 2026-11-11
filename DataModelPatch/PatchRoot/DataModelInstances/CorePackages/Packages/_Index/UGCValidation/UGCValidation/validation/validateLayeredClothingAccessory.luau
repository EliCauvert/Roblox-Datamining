local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local ValidateLCCageQualityModule = require(Parent.validation.validateLCCageQuality)
local ValidateInstanceTreeModule = require(Parent.validation.validateInstanceTree)
local ValidateMeshTrianglesModule = require(Parent.validation.validateMeshTriangles)
local ValidateModerationModule = require(Parent.validation.validateModeration)
local ValidateMaterialsModule = require(Parent.validation.validateMaterials)
local ValidateTagsModule = require(Parent.validation.validateTags)
local ValidateMeshBoundsModule = require(Parent.validation.validateMeshBounds)
local ValidateTextureSizeModule = require(Parent.validation.validateTextureSize)
local ValidatePropertyRequirementsModule = require(Parent.validation.validatePropertyRequirements)
local ValidateAttributesModule = require(Parent.validation.validateAttributes)
local ValidateMeshVertColorsModule = require(Parent.validation.validateMeshVertColors)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateHSRModule = require(Parent.validation.validateHSR)
local ValidateThumbnailConfigurationModule = require(Parent.validation.validateThumbnailConfiguration)
local ValidateScaleTypeModule = require(Parent.validation.validateScaleType)
local ValidateLayeredClothingInRenderBoundsModule = require(Parent.validation.validateLayeredClothingInRenderBounds)
local ValidateMeshSizePropertyModule = require(Parent.validation.ValidateMeshSizeProperty)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local ValidateSkinningTransferModule = require(Parent.validation.validateSkinningTransfer)
local ValidateTotalSurfaceAreaModule = require(Parent.validation.validateTotalSurfaceArea)
local ValidateCoplanarIntersectionModule = require(Parent.validation.validateCoplanarIntersection)
local ValidateMaxCubeDensityModule = require(Parent.validation.validateMaxCubeDensity)
local ValidateHSRDataModule = require(Parent.validation.ValidateHSRData)
local ValidateSurfaceAppearanceTextureSizeModule = require(Parent.validation.validateSurfaceAppearanceTextureSize)
local ValidateTexturePackModule = require(Parent.validation.ValidateTexturePack)
local RigidOrLayeredAllowedModule = require(Parent.util.RigidOrLayeredAllowed)
local CreateLayeredClothingSchemaModule = require(Parent.util.createLayeredClothingSchema)
local CreateEyebrowEyelashSchemaModule = require(Parent.util.createEyebrowEyelashSchema)
local GetAttachmentModule = require(Parent.util.getAttachment)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFIntUGCValidationLCHandleScaleOffsetMaximumModule = require(Parent.flags.getFIntUGCValidationLCHandleScaleOffsetMaximum)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidateAccessoryAssetTextureLimitModule = require(Parent.flags.getFFlagUGCValidateAccessoryAssetTextureLimit)
local GetFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule = require(Parent.flags.getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimits)
local GetFFlagUGCValidateTexturePackModule = require(Parent.flags.getFFlagUGCValidateTexturePack)
local GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule = require(Parent.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema)
local ValidateMeshPartOnlySkinnedToR15Module = require(Parent.validation.ValidateMeshPartOnlySkinnedToR15)
local GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(Parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local GetFFlagUGCValidationCombineEntrypointResultsModule = require(Parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local GetFFlagUGCValidateMigrateTextureTransparencyModule = require(Parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local GetFFlagUGCValidateMigrateCageGeometryModule = require(Parent.flags.getFFlagUGCValidateMigrateCageGeometry)

return function(p1)
	-- upvalues: RigidOrLayeredAllowedModule (copy), AnalyticsModule (copy), ConstantsModule (copy), ValidateSingleInstanceModule (copy), GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (copy), CreateEyebrowEyelashSchemaModule (copy), CreateLayeredClothingSchemaModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), GetFFlagUGCValidationCombineEntrypointResultsModule (copy), ValidateDependenciesModule (copy), GetEditableMeshFromContextModule (copy), GetEditableImageFromContextModule (copy), PcallDeferredModule (copy), GetMeshSizeModule (copy), GetExpectedPartSizeModule (copy), GetFIntUGCValidationLCHandleScaleOffsetMaximumModule (copy), GetAttachmentModule (copy), ValidateMaterialsModule (copy), ValidatePropertyRequirementsModule (copy), ValidateTagsModule (copy), ValidateAttributesModule (copy), GetFFlagUGCValidateMigrateTextureTransparencyModule (copy), GetFFlagUGCValidateAccessoryAssetTextureLimitModule (copy), ConstantsInterfaceModule (copy), ValidateTextureSizeModule (copy), GetFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule (copy), ValidateSurfaceAppearanceTextureSizeModule (copy), ValidateScaleTypeModule (copy), ValidateThumbnailConfigurationModule (copy), ValidateHSRModule (copy), ValidateHSRDataModule (copy), ValidateModerationModule (copy), ValidateTotalSurfaceAreaModule (copy), ValidateMeshSizePropertyModule (copy), ValidateMeshBoundsModule (copy), ValidateMeshTrianglesModule (copy), ValidateMeshVertColorsModule (copy), ValidateCoplanarIntersectionModule (copy), ValidateMaxCubeDensityModule (copy), ValidateLCCageQualityModule (copy), GetFFlagUGCValidateMigrateCageGeometryModule (copy), ValidateLayeredClothingInRenderBoundsModule (copy), GetFFlagUGCValidateTexturePackModule (copy), ValidateTexturePackModule (copy), GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (copy), ValidateSkinningTransferModule (copy), ValidateMeshPartOnlySkinnedToR15Module (copy)
	local Instances = p1.instances
	local AssetTypeEnum = p1.assetTypeEnum
	local IsServer = p1.isServer
	local AllowUnreviewedAssets = p1.allowUnreviewedAssets
	
	if not RigidOrLayeredAllowedModule.isLayeredClothingAllowed(AssetTypeEnum) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing, nil, p1)
		
		return false, {
			string.format("Asset type '%s' is not a layered clothing category. It can only be used with rigid accessories.", AssetTypeEnum.Name)
		}
	end
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum]
	local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
	
	if not ValidateSingleInstanceModuleResult then
		return false, ValidateSingleInstanceModuleResult2
	end
	local InstancesEntry = Instances[1]
	local IsAssetTypeEnumMatch: boolean = if GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then AssetTypeEnum == Enum.AssetType.EyebrowAccessory or AssetTypeEnum == Enum.AssetType.EyelashAccessory else false
	local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(if IsAssetTypeEnumMatch then CreateEyebrowEyelashSchemaModule(ASSETTYPE.attachmentNames) else CreateLayeredClothingSchemaModule(ASSETTYPE.attachmentNames), InstancesEntry, p1)
	
	if not ValidateInstanceTreeModuleResult then
		return false, ValidateInstanceTreeModuleResult2
	end
	if GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local ValidateResult, ValidateResult2 = ValidatePropertiesSensibleModule.validate(InstancesEntry, p1)
		
		if not ValidateResult then
			return false, ValidateResult2
		end
	end
	local ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2 = ValidateDependenciesModule(InstancesEntry, p1, {
		skipExistenceCheck = GetFFlagUGCValidateMigrateSchemaPropertiesModule() and GetFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = GetFFlagUGCValidateMigrateSchemaPropertiesModule() and GetFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
	if not ValidateDependenciesModuleResult then
		return false, ValidateDependenciesModuleResult2
	end
	local Flag = true
	local List = {}
	local Handle = InstancesEntry:FindFirstChild("Handle")
	local config = {
		fieldName = "MeshId",
		fullName = Handle:GetFullName(),
		contentId = Handle.MeshId,
		context = InstancesEntry.Name
	}
	
	if config.contentId == nil or config.contentId == "" then
	end
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(Handle, "MeshId", p1)
	
	if not MeshId then
		if config.contentId then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p1)
			
			return false, {
				string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
			}
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_NoMeshId, nil, p1)
		Flag = false
		table.insert(List, {
			string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", InstancesEntry.Name)
		})
	end
	config.editableMesh = MeshId2
	local v1 = true
	local TextureID = Handle.TextureID
	local config1 = {
		fieldName = "TextureID",
		fullName = Handle:GetFullName(),
		contentId = TextureID
	}
	
	if TextureID ~= "" then
		local TextureID1, TextureID2 = GetEditableImageFromContextModule(Handle, "TextureID", p1)
		
		if not TextureID1 then
			return false, {
				string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", InstancesEntry.Name)
			}
		end
		config1.editableImage = TextureID2
	end
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: GetMeshSizeModule (upval), config (copy)
		return GetMeshSizeModule(config)
	end, p1)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p1)
		
		return false, {
			string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
		}
	end
	local ExpectedPartSizeModuleRatio = GetExpectedPartSizeModule(Handle, p1) / PcallDeferredModuleResult2
	
	if not ExpectedPartSizeModuleRatio:FuzzyEq(vector.create(1, 1, 1), GetFIntUGCValidationLCHandleScaleOffsetMaximumModule() / 1000) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_HandleIsScaled, nil, p1)
		table.insert(List, string.format("%s has been scaled, but mesh parts with wrap layers do not support scaling. You need to change the Size property to match the MeshSize property.", Handle.Name))
		Flag = false
	end
	local AttachmentModule = GetAttachmentModule(Handle, ASSETTYPE.attachmentNames)
	local Bound = ASSETTYPE.bounds[AttachmentModule.Name]
	
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		local ValidateMaterialsModuleResult, ValidateMaterialsModuleResult2 = ValidateMaterialsModule(InstancesEntry, p1)
		
		if not ValidateMaterialsModuleResult then
			table.insert(List, table.concat(ValidateMaterialsModuleResult2, "\n"))
			Flag = false
		end
		local ValidatePropertyRequirementsModuleResult, ValidatePropertyRequirementsModuleResult2 = ValidatePropertyRequirementsModule(InstancesEntry, nil, p1)
		
		if not ValidatePropertyRequirementsModuleResult then
			table.insert(List, table.concat(ValidatePropertyRequirementsModuleResult2, "\n"))
			Flag = false
		end
	end
	local ValidateTagsModuleResult, ValidateTagsModuleResult2 = ValidateTagsModule(InstancesEntry, p1)
	
	if not ValidateTagsModuleResult then
		table.insert(List, table.concat(ValidateTagsModuleResult2, "\n"))
		Flag = false
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		local ValidateAttributesModuleResult, ValidateAttributesModuleResult2 = ValidateAttributesModule(InstancesEntry, p1)
		
		if not ValidateAttributesModuleResult then
			table.insert(List, table.concat(ValidateAttributesModuleResult2, "\n"))
			Flag = false
		end
	end
	if not GetFFlagUGCValidateMigrateTextureTransparencyModule() then
		local ValidateTextureSizeModuleResult, ValidateTextureSizeModuleResult2 = ValidateTextureSizeModule(config1, true, p1, if GetFFlagUGCValidateAccessoryAssetTextureLimitModule() then ConstantsInterfaceModule.getTextureLimit(AssetTypeEnum, Handle, config1.fieldName) else nil)
		
		if not ValidateTextureSizeModuleResult then
			table.insert(List, table.concat(ValidateTextureSizeModuleResult2, "\n"))
			Flag = false
		end
		if GetFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule() then
			local ValidateSurfaceAppearanceTextureSizeModuleResult, ValidateSurfaceAppearanceTextureSizeModuleResult2 = ValidateSurfaceAppearanceTextureSizeModule(InstancesEntry, p1)
			
			if not ValidateSurfaceAppearanceTextureSizeModuleResult then
				table.insert(List, table.concat(ValidateSurfaceAppearanceTextureSizeModuleResult2, "\n"))
				Flag = false
			end
		end
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		local AvatarPartScaleType = Handle:FindFirstChild("AvatarPartScaleType")
		
		if AvatarPartScaleType and AvatarPartScaleType:IsA("StringValue") then
			local ValidateScaleTypeModuleResult, ValidateScaleTypeModuleResult2 = ValidateScaleTypeModule(AvatarPartScaleType, p1)
			
			if not ValidateScaleTypeModuleResult then
				table.insert(List, table.concat(ValidateScaleTypeModuleResult2, "\n"))
				Flag = false
			end
		end
	end
	if (not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule()) and not IsAssetTypeEnumMatch then
		local ValidateThumbnailConfigurationModuleResult, ValidateThumbnailConfigurationModuleResult2 = ValidateThumbnailConfigurationModule(InstancesEntry, Handle, config, ExpectedPartSizeModuleRatio, p1)
		
		if not ValidateThumbnailConfigurationModuleResult then
			table.insert(List, table.concat(ValidateThumbnailConfigurationModuleResult2, "\n"))
			Flag = false
		end
	end
	local WrapLayer = Handle:FindFirstChildOfClass("WrapLayer")
	
	if WrapLayer == nil then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, p1)
		table.insert(List, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", InstancesEntry.Name))
		Flag = false
	else
		if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
			local ValidateHSRModuleResult, ValidateHSRModuleResult2 = ValidateHSRModule(WrapLayer, p1)
			
			if not ValidateHSRModuleResult then
				table.insert(List, table.concat(ValidateHSRModuleResult2, "\n"))
				Flag = false
			end
		end
		if (not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule()) and not p1.allowEditableInstances then
			local ValidateResult3, ValidateResult2_2 = ValidateHSRDataModule.validate(WrapLayer, p1)
			
			if not ValidateResult3 then
				table.insert(List, table.concat(ValidateResult2_2, "\n"))
				Flag = false
			end
		end
	end
	if (not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule()) and (not AllowUnreviewedAssets and not IsServer) then
		local ValidateModerationModuleResult, ValidateModerationModuleResult2 = ValidateModerationModule(InstancesEntry, {}, p1)
		
		if not ValidateModerationModuleResult then
			table.insert(List, table.concat(ValidateModerationModuleResult2, "\n"))
			Flag = false
		end
	end
	if v1 then
		local ValidateTotalSurfaceAreaModuleResult, ValidateTotalSurfaceAreaModuleResult2 = ValidateTotalSurfaceAreaModule(config, ExpectedPartSizeModuleRatio, p1)
		
		if not ValidateTotalSurfaceAreaModuleResult then
			table.insert(List, table.concat(ValidateTotalSurfaceAreaModuleResult2, "\n"))
			Flag = false
		end
		local ValidateSingleMeshPartResult, ValidateSingleMeshPartResult2 = ValidateMeshSizePropertyModule.validateSingleMeshPart(Handle, p1)
		
		if not ValidateSingleMeshPartResult then
			table.insert(List, table.concat(ValidateSingleMeshPartResult2, "\n"))
			Flag = false
		end
		local ValidateMeshBoundsModuleResult, ValidateMeshBoundsModuleResult2 = ValidateMeshBoundsModule(Handle, AttachmentModule, config, ExpectedPartSizeModuleRatio, Bound, AssetTypeEnum.Name, p1)
		
		if not ValidateMeshBoundsModuleResult then
			table.insert(List, table.concat(ValidateMeshBoundsModuleResult2, "\n"))
			Flag = false
		end
		local ValidateMeshTrianglesModuleResult, ValidateMeshTrianglesModuleResult2 = ValidateMeshTrianglesModule(config, nil, p1)
		
		if not ValidateMeshTrianglesModuleResult then
			table.insert(List, table.concat(ValidateMeshTrianglesModuleResult2, "\n"))
			Flag = false
		end
		local ValidateMeshVertColorsModuleResult, ValidateMeshVertColorsModuleResult2 = ValidateMeshVertColorsModule(config, false, p1)
		
		if not ValidateMeshVertColorsModuleResult then
			table.insert(List, table.concat(ValidateMeshVertColorsModuleResult2, "\n"))
			Flag = false
		end
		local ValidateCoplanarIntersectionModuleResult, ValidateCoplanarIntersectionModuleResult2 = ValidateCoplanarIntersectionModule(config, ExpectedPartSizeModuleRatio, p1)
		
		if not ValidateCoplanarIntersectionModuleResult then
			table.insert(List, table.concat(ValidateCoplanarIntersectionModuleResult2, "\n"))
			Flag = false
		end
	end
	local ValidateMaxCubeDensityModuleResult, ValidateMaxCubeDensityModuleResult2 = ValidateMaxCubeDensityModule(config, p1, ExpectedPartSizeModuleRatio)
	
	if not ValidateMaxCubeDensityModuleResult then
		table.insert(List, table.concat(ValidateMaxCubeDensityModuleResult2, "\n"))
		Flag = false
	end
	local ValidateLCCageQualityModuleResult, ValidateLCCageQualityModuleResult2 = ValidateLCCageQualityModule(InstancesEntry, config, p1)
	
	if not ValidateLCCageQualityModuleResult then
		for _, value in ValidateLCCageQualityModuleResult2 do
			table.insert(List, value)
		end
		Flag = false
	end
	if not GetFFlagUGCValidateMigrateCageGeometryModule() then
		local ValidateLayeredClothingInRenderBoundsModuleResult, ValidateLayeredClothingInRenderBoundsModuleResult2 = ValidateLayeredClothingInRenderBoundsModule(InstancesEntry, p1)
		
		if not ValidateLayeredClothingInRenderBoundsModuleResult then
			table.insert(List, table.concat(ValidateLayeredClothingInRenderBoundsModuleResult2, "\n"))
			Flag = false
		end
	end
	if GetFFlagUGCValidateTexturePackModule() then
		local ValidateResult1, ValidateResult2_1 = ValidateTexturePackModule.validate(InstancesEntry, false, p1)
		
		if not ValidateResult1 then
			table.insert(List, table.concat(ValidateResult2_1, "\n"))
			Flag = false
		end
	end
	if not GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
		local ValidateSkinningTransferModuleResult, ValidateSkinningTransferModuleResult2 = ValidateSkinningTransferModule(Handle, p1)
		
		if not ValidateSkinningTransferModuleResult then
			table.insert(List, table.concat(ValidateSkinningTransferModuleResult2, "\n"))
			Flag = false
		end
		if not ConstantsModule.SkinningTransferRequiredTypes[AssetTypeEnum] then
			local ValidateMeshPartResult, ValidateMeshPartResult2 = ValidateMeshPartOnlySkinnedToR15Module.validateMeshPart(Handle, p1)
			
			if not ValidateMeshPartResult then
				table.insert(List, table.concat(ValidateMeshPartResult2, "\n"))
				Flag = false
			end
		end
	end
	return Flag, List
end