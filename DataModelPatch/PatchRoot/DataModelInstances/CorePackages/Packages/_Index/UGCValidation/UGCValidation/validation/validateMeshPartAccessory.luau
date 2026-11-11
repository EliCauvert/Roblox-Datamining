local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local ValidateCoplanarIntersectionModule = require(Parent.validation.validateCoplanarIntersection)
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
local ValidateThumbnailConfigurationModule = require(Parent.validation.validateThumbnailConfiguration)
local ValidateSurfaceAppearancesModule = require(Parent.validation.validateSurfaceAppearances)
local ValidateSurfaceAppearanceTextureSizeModule = require(Parent.validation.validateSurfaceAppearanceTextureSize)
local ValidateTexturePackModule = require(Parent.validation.ValidateTexturePack)
local ValidateSurfaceAppearanceTransparencyModule = require(Parent.validation.validateSurfaceAppearanceTransparency)
local ValidateScaleTypeModule = require(Parent.validation.validateScaleType)
local ValidateTotalSurfaceAreaModule = require(Parent.validation.validateTotalSurfaceArea)
local ValidateRigidMeshNotSkinnedModule = require(Parent.validation.validateRigidMeshNotSkinned)
local ValidateMeshSizePropertyModule = require(Parent.validation.ValidateMeshSizeProperty)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local CreateMeshPartAccessorySchemaModule = require(Parent.util.createMeshPartAccessorySchema)
local GetAttachmentModule = require(Parent.util.getAttachment)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetAccessoryScaleModule = require(Parent.util.getAccessoryScale)
local RigidOrLayeredAllowedModule = require(Parent.util.RigidOrLayeredAllowed)
local GetEngineFeatureEngineUGCValidateRigidNonSkinnedModule = require(Parent.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidateAccessoryAssetTextureLimitModule = require(Parent.flags.getFFlagUGCValidateAccessoryAssetTextureLimit)
local GetFFlagUGCValidateTexturePackModule = require(Parent.flags.getFFlagUGCValidateTexturePack)
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local GetFFlagUGCValidationCombineEntrypointResultsModule = require(Parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local GetFFlagUGCValidateMigrateTextureTransparencyModule = require(Parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(Parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local GetFFlagUGCValidateMigrateMeshGeometryModule = require(Parent.flags.getFFlagUGCValidateMigrateMeshGeometry)
local MeshpartAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("MeshpartAccessoryCheckAvatarPartScaleType", false)

return function(p1)
	-- upvalues: RigidOrLayeredAllowedModule (copy), AnalyticsModule (copy), ConstantsModule (copy), ValidateSingleInstanceModule (copy), CreateMeshPartAccessorySchemaModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), GetFFlagUGCValidationCombineEntrypointResultsModule (copy), ValidateDependenciesModule (copy), FailureReasonsAccumulatorModule (copy), GetEditableMeshFromContextModule (copy), GetEditableImageFromContextModule (copy), PcallDeferredModule (copy), GetMeshSizeModule (copy), GetExpectedPartSizeModule (copy), GetAttachmentModule (copy), ValidateMaterialsModule (copy), ValidatePropertyRequirementsModule (copy), ValidateTagsModule (copy), ValidateAttributesModule (copy), GetFFlagUGCValidateMigrateTextureTransparencyModule (copy), GetFFlagUGCValidateAccessoryAssetTextureLimitModule (copy), ConstantsInterfaceModule (copy), ValidateTextureSizeModule (copy), ValidateThumbnailConfigurationModule (copy), ValidateModerationModule (copy), MeshpartAccessoryCheckAvatarPartScaleType (copy), GetAccessoryScaleModule (copy), GetFFlagUGCValidateMigrateMeshGeometryModule (copy), ValidateTotalSurfaceAreaModule (copy), ValidateMeshSizePropertyModule (copy), ValidateMeshBoundsModule (copy), ValidateMeshTrianglesModule (copy), GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (copy), ValidateMeshVertColorsModule (copy), ValidateCoplanarIntersectionModule (copy), ValidateSurfaceAppearancesModule (copy), ValidateSurfaceAppearanceTextureSizeModule (copy), ValidateSurfaceAppearanceTransparencyModule (copy), GetFFlagUGCValidateTexturePackModule (copy), ValidateTexturePackModule (copy), GetEngineFeatureEngineUGCValidateRigidNonSkinnedModule (copy), ValidateRigidMeshNotSkinnedModule (copy), ValidateScaleTypeModule (copy)
	assert(p1.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAccessory")
	local Instances = p1.instances
	local AssetTypeEnum = p1.assetTypeEnum
	local IsServer = p1.isServer
	local AllowUnreviewedAssets = p1.allowUnreviewedAssets
	
	if not RigidOrLayeredAllowedModule.isRigidAccessoryAllowed(AssetTypeEnum) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory, nil, p1)
		
		return false, {
			string.format("Asset type '%s' is not a rigid accessory category. It can only be used with layered clothing.", AssetTypeEnum.Name)
		}
	end
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum]
	local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
	
	if not ValidateSingleInstanceModuleResult then
		return false, ValidateSingleInstanceModuleResult2
	end
	local InstancesEntry = Instances[1]
	local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(CreateMeshPartAccessorySchemaModule(ASSETTYPE.attachmentNames), InstancesEntry, p1)
	
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
	local Handle = InstancesEntry:FindFirstChild("Handle")
	local config = {
		fieldName = "MeshId",
		fullName = Handle:GetFullName(),
		contentId = Handle.MeshId,
		context = InstancesEntry.Name
	}
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if Handle.DoubleSided then
		NewFailureReasonsAccumulator:updateReasons(false, {
			string.format("MeshPart '%s' is double-sided. Double-sided meshes are not allowed in rigid accessories.", Handle:GetFullName())
		})
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartAccessory_DoubleSided, nil, p1)
	end
	if config.contentId == nil or config.contentId == "" then
	end
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(Handle, "MeshId", p1)
	
	if not MeshId then
		if config.contentId then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p1)
			
			return false, {
				string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
			}
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartAccessory_NoMeshId, nil, p1)
		NewFailureReasonsAccumulator:updateReasons(false, {
			string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", Handle:GetFullName())
		})
	end
	config.editableMesh = MeshId2
	local v1 = true
	local TextureID = Handle.TextureID
	local FullName = Handle:GetFullName()
	local _, TextureID2 = GetEditableImageFromContextModule(Handle, "TextureID", p1)
	local config1 = {
		fieldName = "TextureID",
		fullName = FullName,
		contentId = TextureID,
		editableImage = TextureID2
	}
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: GetMeshSizeModule (upval), config (copy)
		return GetMeshSizeModule(config)
	end, p1)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p1)
		
		return false, {
			string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
		}
	end
	local ExpectedPartSizeModuleRatio = GetExpectedPartSizeModule(Handle, p1) / PcallDeferredModuleResult2
	local AttachmentModule = GetAttachmentModule(Handle, ASSETTYPE.attachmentNames)
	assert(AttachmentModule)
	local v2 = assert(ASSETTYPE.bounds[AttachmentModule.Name], "Could not find bounds for " .. AttachmentModule.Name)
	
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateMaterialsModule(InstancesEntry, p1))
		NewFailureReasonsAccumulator:updateReasons(ValidatePropertyRequirementsModule(InstancesEntry, nil, p1))
	end
	NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(InstancesEntry, p1))
	
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateAttributesModule(InstancesEntry, p1))
	end
	if not GetFFlagUGCValidateMigrateTextureTransparencyModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateTextureSizeModule(config1, true, p1, if GetFFlagUGCValidateAccessoryAssetTextureLimitModule() then ConstantsInterfaceModule.getTextureLimit(AssetTypeEnum, Handle, config1.fieldName) else nil))
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateThumbnailConfigurationModule(InstancesEntry, Handle, config, ExpectedPartSizeModuleRatio, p1))
	end
	if (not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule()) and (not AllowUnreviewedAssets and not IsServer) then
		NewFailureReasonsAccumulator:updateReasons(ValidateModerationModule(InstancesEntry, {}, p1))
	end
	if MeshpartAccessoryCheckAvatarPartScaleType and Handle:FindFirstChild("AvatarPartScaleType") then
		local AccessoryScaleModule = GetAccessoryScaleModule(Handle, AttachmentModule)
		v2 = {
			size = v2.size / AccessoryScaleModule,
			offset = if v2.offset then v2.offset / AccessoryScaleModule else nil
		}
	end
	if v1 then
		if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateTotalSurfaceAreaModule(config, ExpectedPartSizeModuleRatio, p1))
		end
		NewFailureReasonsAccumulator:updateReasons(ValidateMeshSizePropertyModule.validateSingleMeshPart(Handle, p1))
		
		if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateMeshBoundsModule(Handle, AttachmentModule, config, ExpectedPartSizeModuleRatio, v2, AssetTypeEnum.Name, p1))
		end
		if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateMeshTrianglesModule(config, nil, p1))
		end
		if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateMeshVertColorsModule(config, false, p1))
		end
		if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateCoplanarIntersectionModule(config, ExpectedPartSizeModuleRatio, p1))
		end
	end
	if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateSurfaceAppearancesModule(InstancesEntry, p1))
	end
	if not GetFFlagUGCValidateMigrateTextureTransparencyModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateSurfaceAppearanceTextureSizeModule(InstancesEntry, p1))
		NewFailureReasonsAccumulator:updateReasons(ValidateSurfaceAppearanceTransparencyModule(InstancesEntry, p1))
	end
	if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and GetFFlagUGCValidateTexturePackModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateTexturePackModule.validate(InstancesEntry, false, p1))
	end
	if GetEngineFeatureEngineUGCValidateRigidNonSkinnedModule() and not p1.allowEditableInstances then
		NewFailureReasonsAccumulator:updateReasons(ValidateRigidMeshNotSkinnedModule(config.contentId, p1))
	end
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		local AvatarPartScaleType = Handle:FindFirstChild("AvatarPartScaleType")
		
		if AvatarPartScaleType and AvatarPartScaleType:IsA("StringValue") then
			NewFailureReasonsAccumulator:updateReasons(ValidateScaleTypeModule(AvatarPartScaleType, p1))
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end