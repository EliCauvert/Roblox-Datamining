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

return function(p1)
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), createMeshPartAccessorySchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), getExpectedPartSizeModule (ref), getAttachmentModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), validateThumbnailConfigurationModule (ref), validateModerationModule (ref), meshpartAccessoryCheckAvatarPartScaleType (ref), getAccessoryScaleModule (ref), getFFlagUGCValidateMigrateMeshGeometryModule (ref), validateTotalSurfaceAreaModule (ref), validateMeshSizePropertyModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), validateSurfaceAppearancesModule (ref), validateSurfaceAppearanceTextureSizeModule (ref), validateSurfaceAppearanceTransparencyModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), getEngineFeatureEngineUGCValidateRigidNonSkinnedModule (ref), validateRigidMeshNotSkinnedModule (ref), validateScaleTypeModule (ref)
	assert(p1.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAccessory")
	local instances = p1.instances
	local assetTypeEnum = p1.assetTypeEnum
	local isServer = p1.isServer
	local allowUnreviewedAssets = p1.allowUnreviewedAssets
	
	if not rigidOrLayeredAllowedModule.isRigidAccessoryAllowed(assetTypeEnum) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory, nil, p1)
		
		return false, {
			string.format("Asset type '%s' is not a rigid accessory category. It can only be used with layered clothing.", assetTypeEnum.Name)
		}
	end
	local var1 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	local _ = nil
	local _ = nil
	local var2, var3 = validateSingleInstanceModule(instances, p1)
	
	if not var2 then
		return false, var3
	end
	local var4 = instances[1]
	local var5, var6 = validateInstanceTreeModule(createMeshPartAccessorySchemaModule(var1.attachmentNames), var4, p1)
	local var7 = var6
	
	if not var5 then
		return false, var7
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var8, var9 = validatePropertiesSensibleModule.validate(var4, p1)
		local var10 = var9
		
		if not var8 then
			return false, var10
		end
	end
	local var11, var12 = validateDependenciesModule(var4, p1, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var11 then
		return false, var12
	end
	local handle = var4:FindFirstChild("Handle")
	local t = {
		fieldName = "MeshId",
		fullName = handle:GetFullName(),
		contentId = handle.MeshId,
		context = var4.Name
	}
	local var13 = failureReasonsAccumulatorModule.new()
	
	if handle.DoubleSided then
		var13:updateReasons(false, {
			string.format("MeshPart '%s' is double-sided. Double-sided meshes are not allowed in rigid accessories.", handle:GetFullName())
		})
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_DoubleSided, nil, p1)
	end
	local var14 = t.contentId ~= nil and t.contentId ~= ""
	local var15, var16 = getEditableMeshFromContextModule(handle, "MeshId", p1)
	
	if not var15 then
		if t.contentId then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p1)
			
			return false, {
				string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", var4.Name)
			}
		end
		var14 = false
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_NoMeshId, nil, p1)
		var13:updateReasons(false, {
			string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", handle:GetFullName())
		})
	end
	t.editableMesh = var16
	var14 = true
	local t_1 = {
		fieldName = "TextureID",
		fullName = handle:GetFullName(),
		contentId = handle.TextureID
	}
	local _, var17 = getEditableImageFromContextModule(handle, "TextureID", p1)
	t_1.editableImage = var17
	local var18, var19 = pcallDeferredModule(function()
		-- upvalues: getMeshSizeModule (copy), t (ref)
		return getMeshSizeModule(t)
	end, p1)
	
	if not var18 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p1)
		
		return false, {
			string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", var4.Name)
		}
	end
	local var20 = getExpectedPartSizeModule(handle, p1) / var19
	local var21 = getAttachmentModule(handle, var1.attachmentNames)
	assert(var21)
	local var22 = assert(var1.bounds[var21.Name], "Could not find bounds for " .. var68.Name)
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var13:updateReasons(validateMaterialsModule(var4, p1))
		var13:updateReasons(validatePropertyRequirementsModule(var4, nil, p1))
	end
	var13:updateReasons(validateTagsModule(var4, p1))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var13:updateReasons(validateAttributesModule(var4, p1))
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		var13:updateReasons(validateTextureSizeModule(t_1, true, p1, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, handle, t_1.fieldName) else nil))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var13:updateReasons(validateThumbnailConfigurationModule(var4, handle, t, var20, p1))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
		var13:updateReasons(validateModerationModule(var4, {}, p1))
	end
	if meshpartAccessoryCheckAvatarPartScaleType and handle:FindFirstChild("AvatarPartScaleType") then
		local var23 = getAccessoryScaleModule(handle, var21)
		var22 = {
			size = var22.size / var23,
			offset = if var22.offset then var22.offset / var23 else nil
		}
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var13:updateReasons(validateTotalSurfaceAreaModule(t, var20, p1))
	end
	var13:updateReasons(validateMeshSizePropertyModule.validateSingleMeshPart(handle, p1))
	
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var13:updateReasons(validateMeshBoundsModule(handle, var21, t, var20, var22, assetTypeEnum.Name, p1))
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var13:updateReasons(validateMeshTrianglesModule(t, nil, p1))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var13:updateReasons(validateMeshVertColorsModule(t, false, p1))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var13:updateReasons(validateCoplanarIntersectionModule(t, var20, p1))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var13:updateReasons(validateSurfaceAppearancesModule(var4, p1))
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		var13:updateReasons(validateSurfaceAppearanceTextureSizeModule(var4, p1))
		var13:updateReasons(validateSurfaceAppearanceTransparencyModule(var4, p1))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
		var13:updateReasons(validateTexturePackModule.validate(var4, false, p1))
	end
	if getEngineFeatureEngineUGCValidateRigidNonSkinnedModule() and not p1.allowEditableInstances then
		var13:updateReasons(validateRigidMeshNotSkinnedModule(t.contentId, p1))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
		
		if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
			var13:updateReasons(validateScaleTypeModule(avatarPartScaleType, p1))
		end
	end
	return var13:getFinalResults()
end