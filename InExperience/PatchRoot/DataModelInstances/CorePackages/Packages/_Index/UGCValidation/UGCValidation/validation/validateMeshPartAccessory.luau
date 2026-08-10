local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local validateCoplanarIntersectionModule = require(parent.validation.validateCoplanarIntersection)
local validateInstanceTreeModule = require(parent.validation.validateInstanceTree)
local validateMeshTrianglesModule = require(parent.validation.validateMeshTriangles)
local validateModerationModule = require(parent.validation.validateModeration)
local validateMaterialsModule = require(parent.validation.validateMaterials)
local validateTagsModule = require(parent.validation.validateTags)
local validateMeshBoundsModule = require(parent.validation.validateMeshBounds)
local validateTextureSizeModule = require(parent.validation.validateTextureSize)
local validatePropertyRequirementsModule = require(parent.validation.validatePropertyRequirements)
local validateAttributesModule = require(parent.validation.validateAttributes)
local validateMeshVertColorsModule = require(parent.validation.validateMeshVertColors)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateThumbnailConfigurationModule = require(parent.validation.validateThumbnailConfiguration)
local validateSurfaceAppearancesModule = require(parent.validation.validateSurfaceAppearances)
local validateSurfaceAppearanceTextureSizeModule = require(parent.validation.validateSurfaceAppearanceTextureSize)
local validateTexturePackModule = require(parent.validation.ValidateTexturePack)
local validateSurfaceAppearanceTransparencyModule = require(parent.validation.validateSurfaceAppearanceTransparency)
local validateScaleTypeModule = require(parent.validation.validateScaleType)
local validateTotalSurfaceAreaModule = require(parent.validation.validateTotalSurfaceArea)
local validateRigidMeshNotSkinnedModule = require(parent.validation.validateRigidMeshNotSkinned)
local validateMeshSizePropertyModule = require(parent.validation.ValidateMeshSizeProperty)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local createMeshPartAccessorySchemaModule = require(parent.util.createMeshPartAccessorySchema)
local getAttachmentModule = require(parent.util.getAttachment)
local getMeshSizeModule = require(parent.util.getMeshSize)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getAccessoryScaleModule = require(parent.util.getAccessoryScale)
local rigidOrLayeredAllowedModule = require(parent.util.RigidOrLayeredAllowed)
local getEngineFeatureEngineUGCValidateRigidNonSkinnedModule = require(parent.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateAccessoryAssetTextureLimitModule = require(parent.flags.getFFlagUGCValidateAccessoryAssetTextureLimit)
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local getFFlagUGCValidateMigrateMeshGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry)
local meshpartAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("MeshpartAccessoryCheckAvatarPartScaleType", false)

return function(p0) --[[ line: 58 | named "validateMeshPartAccessory" ]]
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), createMeshPartAccessorySchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), getExpectedPartSizeModule (ref), getAttachmentModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), validateThumbnailConfigurationModule (ref), validateModerationModule (ref), meshpartAccessoryCheckAvatarPartScaleType (ref), getAccessoryScaleModule (ref), getFFlagUGCValidateMigrateMeshGeometryModule (ref), validateTotalSurfaceAreaModule (ref), validateMeshSizePropertyModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), validateSurfaceAppearancesModule (ref), validateSurfaceAppearanceTextureSizeModule (ref), validateSurfaceAppearanceTransparencyModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), getEngineFeatureEngineUGCValidateRigidNonSkinnedModule (ref), validateRigidMeshNotSkinnedModule (ref), validateScaleTypeModule (ref)
	assert(p0.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAccessory")
	local instances = p0.instances
	local assetTypeEnum = p0.assetTypeEnum
	local isServer = p0.isServer
	local allowUnreviewedAssets = p0.allowUnreviewedAssets
	
	if not rigidOrLayeredAllowedModule.isRigidAccessoryAllowed(assetTypeEnum) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory, nil, p0)
		
		return false, {
			string.format("Asset type '%s' is not a rigid accessory category. It can only be used with layered clothing.", assetTypeEnum.Name)
		}
	end
	local var45 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	local _ = nil
	local _ = nil
	local var46, var47 = validateSingleInstanceModule(instances, p0)
	
	if not var46 then
		return false, var47
	end
	local var48 = instances[1]
	local var49, var50 = validateInstanceTreeModule(createMeshPartAccessorySchemaModule(var45.attachmentNames), var48, p0)
	local var51 = var50
	
	if not var49 then
		return false, var51
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var52, var53 = validatePropertiesSensibleModule.validate(var48, p0)
		local var54 = var53
		
		if not var52 then
			return false, var54
		end
	end
	local var55, var56 = validateDependenciesModule(var48, p0, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var55 then
		return false, var56
	end
	local handle = var48:FindFirstChild("Handle")
	local t = {
		fieldName = "MeshId",
		fullName = handle:GetFullName(),
		contentId = handle.MeshId,
		context = var48.Name
	}
	local var59 = failureReasonsAccumulatorModule.new()
	
	if handle.DoubleSided then
		var59:updateReasons(false, {
			string.format("MeshPart '%s' is double-sided. Double-sided meshes are not allowed in rigid accessories.", handle:GetFullName())
		})
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_DoubleSided, nil, p0)
	end
	local var60 = t.contentId ~= nil and t.contentId ~= ""
	local var61, var62 = getEditableMeshFromContextModule(handle, "MeshId", p0)
	
	if not var61 then
		if t.contentId then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p0)
			
			return false, {
				string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", var48.Name)
			}
		end
		var60 = false
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_NoMeshId, nil, p0)
		var59:updateReasons(false, {
			string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", handle:GetFullName())
		})
	end
	t.editableMesh = var62
	var60 = true
	local t_1 = {
		fieldName = "TextureID",
		fullName = handle:GetFullName(),
		contentId = handle.TextureID
	}
	local _, var64 = getEditableImageFromContextModule(handle, "TextureID", p0)
	t_1.editableImage = var64
	local var65, var66 = pcallDeferredModule(function() --[[ line: 180 ]]
		-- upvalues: getMeshSizeModule (copy), t (ref)
		return getMeshSizeModule(t)
	end, p0)
	
	if not var65 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p0)
		
		return false, {
			string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", var48.Name)
		}
	end
	local var67 = getExpectedPartSizeModule(handle, p0) / var66
	local var68 = getAttachmentModule(handle, var45.attachmentNames)
	assert(var68)
	local var69 = assert(var45.bounds[var68.Name], "Could not find bounds for " .. var68.Name)
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var59:updateReasons(validateMaterialsModule(var48, p0))
		var59:updateReasons(validatePropertyRequirementsModule(var48, nil, p0))
	end
	var59:updateReasons(validateTagsModule(var48, p0))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var59:updateReasons(validateAttributesModule(var48, p0))
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		var59:updateReasons(validateTextureSizeModule(t_1, true, p0, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, handle, t_1.fieldName) else nil))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var59:updateReasons(validateThumbnailConfigurationModule(var48, handle, t, var67, p0))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
		var59:updateReasons(validateModerationModule(var48, {}, p0))
	end
	if meshpartAccessoryCheckAvatarPartScaleType and handle:FindFirstChild("AvatarPartScaleType") then
		local var70 = getAccessoryScaleModule(handle, var68)
		var69 = {
			size = var69.size / var70,
			offset = if var69.offset then var69.offset / var70 else nil
		}
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var59:updateReasons(validateTotalSurfaceAreaModule(t, var67, p0))
	end
	var59:updateReasons(validateMeshSizePropertyModule.validateSingleMeshPart(handle, p0))
	
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var59:updateReasons(validateMeshBoundsModule(handle, var68, t, var67, var69, assetTypeEnum.Name, p0))
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var59:updateReasons(validateMeshTrianglesModule(t, nil, p0))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var59:updateReasons(validateMeshVertColorsModule(t, false, p0))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var59:updateReasons(validateCoplanarIntersectionModule(t, var67, p0))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var59:updateReasons(validateSurfaceAppearancesModule(var48, p0))
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		var59:updateReasons(validateSurfaceAppearanceTextureSizeModule(var48, p0))
		var59:updateReasons(validateSurfaceAppearanceTransparencyModule(var48, p0))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
		var59:updateReasons(validateTexturePackModule.validate(var48, false, p0))
	end
	if getEngineFeatureEngineUGCValidateRigidNonSkinnedModule() and not p0.allowEditableInstances then
		var59:updateReasons(validateRigidMeshNotSkinnedModule(t.contentId, p0))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
		
		if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
			var59:updateReasons(validateScaleTypeModule(avatarPartScaleType, p0))
		end
	end
	return var59:getFinalResults()
end