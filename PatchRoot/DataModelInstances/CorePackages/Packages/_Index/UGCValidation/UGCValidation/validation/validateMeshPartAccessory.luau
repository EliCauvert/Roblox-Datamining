-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

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
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local getFFlagUGCValidateMigrateMeshGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry)
local meshpartAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("MeshpartAccessoryCheckAvatarPartScaleType", false)

return function(p0) --[[ line: 59 | named "validateMeshPartAccessory" ]]
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), createMeshPartAccessorySchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), getExpectedPartSizeModule (ref), getAttachmentModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), validateThumbnailConfigurationModule (ref), validateModerationModule (ref), meshpartAccessoryCheckAvatarPartScaleType (ref), getAccessoryScaleModule (ref), getFFlagUGCValidateMigrateMeshGeometryModule (ref), validateTotalSurfaceAreaModule (ref), validateMeshSizePropertyModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), validateSurfaceAppearancesModule (ref), validateSurfaceAppearanceTextureSizeModule (ref), validateSurfaceAppearanceTransparencyModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), getEngineFeatureEngineUGCValidateRigidNonSkinnedModule (ref), validateRigidMeshNotSkinnedModule (ref), validateScaleTypeModule (ref)
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
	local var46 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	local _ = nil
	local _ = nil
	local var47, var48 = validateSingleInstanceModule(instances, p0)
	
	if not var47 then
		return false, var48
	end
	local var49 = instances[1]
	local var50, var51 = validateInstanceTreeModule(createMeshPartAccessorySchemaModule(var46.attachmentNames), var49, p0)
	local var52 = var51
	
	if not var50 then
		return false, var52
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var53, var54 = validatePropertiesSensibleModule.validate(var49, p0)
		local var55 = var54
		
		if not var53 then
			return false, var55
		end
	end
	local var56, var57 = validateDependenciesModule(var49, p0, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
	if not var56 then
		return false, var57
	end
	local handle = var49:FindFirstChild("Handle")
	local t = {
		fieldName = "MeshId",
		fullName = handle:GetFullName(),
		contentId = handle.MeshId,
		context = var49.Name
	}
	local var60 = failureReasonsAccumulatorModule.new()
	
	if handle.DoubleSided then
		var60:updateReasons(false, {
			string.format("MeshPart '%s' is double-sided. Double-sided meshes are not allowed in rigid accessories.", handle:GetFullName())
		})
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_DoubleSided, nil, p0)
	end
	local var61 = t.contentId ~= nil and t.contentId ~= ""
	local var62, var63 = getEditableMeshFromContextModule(handle, "MeshId", p0)
	
	if not var62 then
		if t.contentId then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p0)
			
			return false, {
				string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", var49.Name)
			}
		end
		var61 = false
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_NoMeshId, nil, p0)
		var60:updateReasons(false, {
			string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", handle:GetFullName())
		})
	end
	t.editableMesh = var63
	var61 = true
	local t_1 = {
		fieldName = "TextureID",
		fullName = handle:GetFullName(),
		contentId = handle.TextureID
	}
	local _, var65 = getEditableImageFromContextModule(handle, "TextureID", p0)
	t_1.editableImage = var65
	local var66, var67 = pcallDeferredModule(function() --[[ line: 183 ]]
		-- upvalues: getMeshSizeModule (copy), t (ref)
		return getMeshSizeModule(t)
	end, p0)
	
	if not var66 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p0)
		
		return false, {
			string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", var49.Name)
		}
	end
	local var68 = getExpectedPartSizeModule(handle, p0) / var67
	local var69 = getAttachmentModule(handle, var46.attachmentNames)
	assert(var69)
	local var70 = assert(var46.bounds[var69.Name], "Could not find bounds for " .. var69.Name)
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		var60:updateReasons(validateMaterialsModule(var49, p0))
		var60:updateReasons(validatePropertyRequirementsModule(var49, nil, p0))
	end
	var60:updateReasons(validateTagsModule(var49, p0))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		var60:updateReasons(validateAttributesModule(var49, p0))
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		var60:updateReasons(validateTextureSizeModule(t_1, true, p0, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, handle, t_1.fieldName) else nil))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		var60:updateReasons(validateThumbnailConfigurationModule(var49, handle, t, var68, p0))
	end
	if (not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule()) and (if allowUnreviewedAssets then false else not isServer) then
		var60:updateReasons(validateModerationModule(var49, {}, p0))
	end
	if meshpartAccessoryCheckAvatarPartScaleType and handle:FindFirstChild("AvatarPartScaleType") then
		local var71 = getAccessoryScaleModule(handle, var69)
		var70 = {
			size = var70.size / var71,
			offset = if var70.offset then var70.offset / var71 else nil
		}
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var60:updateReasons(validateTotalSurfaceAreaModule(t, var68, p0))
	end
	var60:updateReasons(validateMeshSizePropertyModule.validateSingleMeshPart(handle, p0))
	
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var60:updateReasons(validateMeshBoundsModule(handle, var69, t, var68, var70, assetTypeEnum.Name, p0))
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var60:updateReasons(validateMeshTrianglesModule(t, nil, p0))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var60:updateReasons(validateMeshVertColorsModule(t, false, p0))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var60:updateReasons(validateCoplanarIntersectionModule(t, var68, p0))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		var60:updateReasons(validateSurfaceAppearancesModule(var49, p0))
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		var60:updateReasons(validateSurfaceAppearanceTextureSizeModule(var49, p0))
		var60:updateReasons(validateSurfaceAppearanceTransparencyModule(var49, p0))
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
		var60:updateReasons(validateTexturePackModule.validate(var49, false, p0))
	end
	if getEngineFeatureEngineUGCValidateRigidNonSkinnedModule() and not p0.allowEditableInstances then
		var60:updateReasons(validateRigidMeshNotSkinnedModule(t.contentId, p0))
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
		
		if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
			var60:updateReasons(validateScaleTypeModule(avatarPartScaleType, p0))
		end
	end
	return var60:getFinalResults()
end