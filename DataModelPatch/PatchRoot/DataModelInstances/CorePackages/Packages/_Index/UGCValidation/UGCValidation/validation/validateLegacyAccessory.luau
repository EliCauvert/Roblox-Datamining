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
local ValidateScaleTypeModule = require(Parent.validation.validateScaleType)
local ValidateTotalSurfaceAreaModule = require(Parent.validation.validateTotalSurfaceArea)
local ValidateRigidMeshNotSkinnedModule = require(Parent.validation.validateRigidMeshNotSkinned)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local RigidOrLayeredAllowedModule = require(Parent.util.RigidOrLayeredAllowed)
local CreateAccessorySchemaModule = require(Parent.util.createAccessorySchema)
local GetAttachmentModule = require(Parent.util.getAttachment)
local GetAccessoryScaleModule = require(Parent.util.getAccessoryScale)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local GetEngineFeatureEngineUGCValidateRigidNonSkinnedModule = require(Parent.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidateAccessoryAssetTextureLimitModule = require(Parent.flags.getFFlagUGCValidateAccessoryAssetTextureLimit)
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local GetFFlagUGCValidationCombineEntrypointResultsModule = require(Parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local GetFFlagUGCValidateMigrateTextureTransparencyModule = require(Parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(Parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local GetFFlagUGCValidateMigrateMeshGeometryModule = require(Parent.flags.getFFlagUGCValidateMigrateMeshGeometry)
local LegacyAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("LegacyAccessoryCheckAvatarPartScaleType", false)

return function(p1)
	-- upvalues: RigidOrLayeredAllowedModule (copy), AnalyticsModule (copy), ConstantsModule (copy), ValidateSingleInstanceModule (copy), CreateAccessorySchemaModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), GetFFlagUGCValidationCombineEntrypointResultsModule (copy), ValidateDependenciesModule (copy), GetAttachmentModule (copy), GetEditableMeshFromContextModule (copy), GetEditableImageFromContextModule (copy), ValidateMaterialsModule (copy), ValidatePropertyRequirementsModule (copy), ValidateTagsModule (copy), ValidateAttributesModule (copy), GetFFlagUGCValidateMigrateTextureTransparencyModule (copy), GetFFlagUGCValidateAccessoryAssetTextureLimitModule (copy), ConstantsInterfaceModule (copy), ValidateTextureSizeModule (copy), ValidateScaleTypeModule (copy), ValidateThumbnailConfigurationModule (copy), ValidateModerationModule (copy), GetFFlagUGCValidateMigrateMeshGeometryModule (copy), ValidateTotalSurfaceAreaModule (copy), LegacyAccessoryCheckAvatarPartScaleType (copy), GetAccessoryScaleModule (copy), ValidateMeshBoundsModule (copy), ValidateMeshTrianglesModule (copy), GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (copy), ValidateMeshVertColorsModule (copy), ValidateCoplanarIntersectionModule (copy), GetEngineFeatureEngineUGCValidateRigidNonSkinnedModule (copy), ValidateRigidMeshNotSkinnedModule (copy)
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
	local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(CreateAccessorySchemaModule(ASSETTYPE.attachmentNames), InstancesEntry, p1)
	
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
	local SpecialMesh = Handle:FindFirstChildOfClass("SpecialMesh")
	local config = {
		fieldName = "MeshId",
		fullName = SpecialMesh:GetFullName(),
		contentId = SpecialMesh.MeshId,
		context = InstancesEntry.Name
	}
	local Scale = SpecialMesh.Scale
	local AttachmentModule = GetAttachmentModule(Handle, ASSETTYPE.attachmentNames)
	local v1 = assert(ASSETTYPE.bounds[AttachmentModule.Name], "Could not find bounds for " .. AttachmentModule.Name)
	local Flag = true
	local List = {}
	
	if config.contentId == nil or config.contentId == "" then
	end
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(SpecialMesh, "MeshId", p1)
	
	if not MeshId then
		if config.contentId then
			return false, {
				string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
			}
		end
		Flag = false
		table.insert(List, {
			string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", InstancesEntry.Name)
		})
	end
	config.editableMesh = MeshId2
	local v2 = true
	local config1 = {
		fieldName = "TextureId",
		fullName = SpecialMesh:GetFullName(),
		contentId = SpecialMesh.TextureId
	}
	local TextureId, TextureId2 = GetEditableImageFromContextModule(SpecialMesh, "TextureId", p1)
	
	if not TextureId then
		return false, {
			string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", InstancesEntry.Name)
		}
	end
	config1.editableImage = TextureId2
	
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
		local ValidateTextureSizeModuleResult, ValidateTextureSizeModuleResult2 = ValidateTextureSizeModule(config1, nil, p1, if GetFFlagUGCValidateAccessoryAssetTextureLimitModule() then ConstantsInterfaceModule.getTextureLimit(AssetTypeEnum, SpecialMesh, config1.fieldName) else nil)
		
		if not ValidateTextureSizeModuleResult then
			table.insert(List, table.concat(ValidateTextureSizeModuleResult2, "\n"))
			Flag = false
		end
	end
	local AvatarPartScaleType = Handle:FindFirstChild("AvatarPartScaleType")
	
	if AvatarPartScaleType and AvatarPartScaleType:IsA("StringValue") then
		local ValidateScaleTypeModuleResult, ValidateScaleTypeModuleResult2 = ValidateScaleTypeModule(AvatarPartScaleType, p1)
		
		if not ValidateScaleTypeModuleResult then
			table.insert(List, table.concat(ValidateScaleTypeModuleResult2, "\n"))
			Flag = false
		end
	end
	local ValidateThumbnailConfigurationModuleResult, ValidateThumbnailConfigurationModuleResult2 = ValidateThumbnailConfigurationModule(InstancesEntry, Handle, config, Scale, p1)
	
	if not ValidateThumbnailConfigurationModuleResult then
		table.insert(List, table.concat(ValidateThumbnailConfigurationModuleResult2, "\n"))
		Flag = false
	end
	if (not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule()) and (not AllowUnreviewedAssets and not IsServer) then
		local ValidateModerationModuleResult, ValidateModerationModuleResult2 = ValidateModerationModule(InstancesEntry, {}, p1)
		
		if not ValidateModerationModuleResult then
			table.insert(List, table.concat(ValidateModerationModuleResult2, "\n"))
			Flag = false
		end
	end
	if v2 then
		if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
			local ValidateTotalSurfaceAreaModuleResult, ValidateTotalSurfaceAreaModuleResult2 = ValidateTotalSurfaceAreaModule(config, Scale, p1)
			
			if not ValidateTotalSurfaceAreaModuleResult then
				table.insert(List, table.concat(ValidateTotalSurfaceAreaModuleResult2, "\n"))
				Flag = false
			end
		end
		if LegacyAccessoryCheckAvatarPartScaleType and Handle:FindFirstChild("AvatarPartScaleType") then
			local AccessoryScaleModule = GetAccessoryScaleModule(Handle, AttachmentModule)
			v1 = {
				size = v1.size / AccessoryScaleModule,
				offset = if v1.offset then v1.offset / AccessoryScaleModule else nil
			}
		end
		if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
			local ValidateMeshBoundsModuleResult, ValidateMeshBoundsModuleResult2 = ValidateMeshBoundsModule(Handle, AttachmentModule, config, Scale, v1, AssetTypeEnum.Name, p1)
			
			if not ValidateMeshBoundsModuleResult then
				table.insert(List, table.concat(ValidateMeshBoundsModuleResult2, "\n"))
				Flag = false
			end
		end
		if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
			local ValidateMeshTrianglesModuleResult, ValidateMeshTrianglesModuleResult2 = ValidateMeshTrianglesModule(config, nil, p1)
			
			if not ValidateMeshTrianglesModuleResult then
				table.insert(List, table.concat(ValidateMeshTrianglesModuleResult2, "\n"))
				Flag = false
			end
		end
		if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
			local ValidateMeshVertColorsModuleResult, ValidateMeshVertColorsModuleResult2 = ValidateMeshVertColorsModule(config, false, p1)
			
			if not ValidateMeshVertColorsModuleResult then
				table.insert(List, table.concat(ValidateMeshVertColorsModuleResult2, "\n"))
				Flag = false
			end
		end
		if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
			local ValidateCoplanarIntersectionModuleResult, ValidateCoplanarIntersectionModuleResult2 = ValidateCoplanarIntersectionModule(config, Scale, p1)
			
			if not ValidateCoplanarIntersectionModuleResult then
				table.insert(List, table.concat(ValidateCoplanarIntersectionModuleResult2, "\n"))
				Flag = false
			end
		end
		if GetEngineFeatureEngineUGCValidateRigidNonSkinnedModule() then
			local ValidateRigidMeshNotSkinnedModuleResult, ValidateRigidMeshNotSkinnedModuleResult2 = ValidateRigidMeshNotSkinnedModule(config.contentId, p1)
			
			if not ValidateRigidMeshNotSkinnedModuleResult then
				table.insert(List, table.concat(ValidateRigidMeshNotSkinnedModuleResult2, "\n"))
				Flag = false
			end
		end
	end
	return Flag, List
end