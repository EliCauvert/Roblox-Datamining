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
local validateScaleTypeModule = require(parent.validation.validateScaleType)
local validateTotalSurfaceAreaModule = require(parent.validation.validateTotalSurfaceArea)
local validateRigidMeshNotSkinnedModule = require(parent.validation.validateRigidMeshNotSkinned)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local rigidOrLayeredAllowedModule = require(parent.util.RigidOrLayeredAllowed)
local createAccessorySchemaModule = require(parent.util.createAccessorySchema)
local getAttachmentModule = require(parent.util.getAttachment)
local getAccessoryScaleModule = require(parent.util.getAccessoryScale)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local getEngineFeatureEngineUGCValidateRigidNonSkinnedModule = require(parent.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateAccessoryAssetTextureLimitModule = require(parent.flags.getFFlagUGCValidateAccessoryAssetTextureLimit)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local getFFlagUGCValidateMigrateMeshGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry)
local legacyAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("LegacyAccessoryCheckAvatarPartScaleType", false)

return function(p0) --[[ line: 49 | named "validateLegacyAccessory" ]]
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), createAccessorySchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), getAttachmentModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), validateScaleTypeModule (ref), validateThumbnailConfigurationModule (ref), validateModerationModule (ref), getFFlagUGCValidateMigrateMeshGeometryModule (ref), validateTotalSurfaceAreaModule (ref), legacyAccessoryCheckAvatarPartScaleType (ref), getAccessoryScaleModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), getEngineFeatureEngineUGCValidateRigidNonSkinnedModule (ref), validateRigidMeshNotSkinnedModule (ref)
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
	local var35 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	local _ = nil
	local _ = nil
	local var36, var37 = validateSingleInstanceModule(instances, p0)
	
	if not var36 then
		return false, var37
	end
	local var38 = instances[1]
	local var39, var40 = validateInstanceTreeModule(createAccessorySchemaModule(var35.attachmentNames), var38, p0)
	local var41 = var40
	
	if not var39 then
		return false, var41
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var42, var43 = validatePropertiesSensibleModule.validate(var38, p0)
		local var44 = var43
		
		if not var42 then
			return false, var44
		end
	end
	local var45, var46 = validateDependenciesModule(var38, p0, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var45 then
		return false, var46
	end
	local handle = var38:FindFirstChild("Handle")
	local specialMesh = handle:FindFirstChildOfClass("SpecialMesh")
	local t = {
		fieldName = "MeshId",
		fullName = specialMesh:GetFullName(),
		contentId = specialMesh.MeshId,
		context = var38.Name
	}
	local scale = specialMesh.Scale
	local var50 = getAttachmentModule(handle, var35.attachmentNames)
	local var51 = assert(var35.bounds[var50.Name], "Could not find bounds for " .. var50.Name)
	local var52 = true
	local t_1 = {}
	local var54 = t.contentId ~= nil and t.contentId ~= ""
	local var55, var56 = getEditableMeshFromContextModule(specialMesh, "MeshId", p0)
	
	if not var55 then
		if t.contentId then
			return false, {
				string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", var38.Name)
			}
		end
		var54 = false
		var52 = false
		table.insert(t_1, {
			string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", var38.Name)
		})
	end
	t.editableMesh = var56
	var54 = true
	local t_2 = {
		fieldName = "TextureId",
		fullName = specialMesh:GetFullName(),
		contentId = specialMesh.TextureId
	}
	local var58, var59 = getEditableImageFromContextModule(specialMesh, "TextureId", p0)
	
	if not var58 then
		return false, {
			string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", var38.Name)
		}
	end
	t_2.editableImage = var59
	local _ = {}
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var60, var61 = validateMaterialsModule(var38, p0)
		
		if not var60 then
			table.insert(t_1, table.concat(var61, "\n"))
			var52 = false
		end
		local var62, var63 = validatePropertyRequirementsModule(var38, nil, p0)
		local var64 = var63
		
		if not var62 then
			table.insert(t_1, table.concat(var64, "\n"))
			var52 = false
		end
	end
	local var65, var66 = validateTagsModule(var38, p0)
	local var67 = var66
	
	if not var65 then
		table.insert(t_1, table.concat(var67, "\n"))
		var52 = false
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var68, var69 = validateAttributesModule(var38, p0)
		local var70 = var69
		
		if not var68 then
			table.insert(t_1, table.concat(var70, "\n"))
			var52 = false
		end
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		local var71, var72 = validateTextureSizeModule(t_2, nil, p0, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, specialMesh, t_2.fieldName) else nil)
		local var73 = var72
		
		if not var71 then
			table.insert(t_1, table.concat(var73, "\n"))
			var52 = false
		end
	end
	local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
	
	if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
		local var75, var76 = validateScaleTypeModule(avatarPartScaleType, p0)
		local var77 = var76
		
		if not var75 then
			table.insert(t_1, table.concat(var77, "\n"))
			var52 = false
		end
	end
	local var81
	local var78, var79 = validateThumbnailConfigurationModule(var38, handle, t, scale, p0)
	local var80 = var79
	
	if not var78 then
		table.insert(t_1, table.concat(var80, "\n"))
		var81 = false
		var81 = var52
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
		local var82, var83 = validateModerationModule(var38, {}, p0)
		local var84 = var83
		
		if not var82 then
			table.insert(t_1, table.concat(var84, "\n"))
			var81 = false
		end
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var85, var86 = validateTotalSurfaceAreaModule(t, scale, p0)
		local var87 = var86
		
		if not var85 then
			table.insert(t_1, table.concat(var87, "\n"))
			var81 = false
		end
	end
	if legacyAccessoryCheckAvatarPartScaleType and handle:FindFirstChild("AvatarPartScaleType") then
		local var88 = getAccessoryScaleModule(handle, var50)
		var51 = {
			size = var51.size / var88,
			offset = if var51.offset then var51.offset / var88 else nil
		}
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var89, var90 = validateMeshBoundsModule(handle, var50, t, scale, var51, assetTypeEnum.Name, p0)
		local var91 = var90
		
		if not var89 then
			table.insert(t_1, table.concat(var91, "\n"))
			var81 = false
		end
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var92, var93 = validateMeshTrianglesModule(t, nil, p0)
		local var94 = var93
		
		if not var92 then
			table.insert(t_1, table.concat(var94, "\n"))
			var81 = false
		end
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		local var95, var96 = validateMeshVertColorsModule(t, false, p0)
		local var97 = var96
		
		if not var95 then
			table.insert(t_1, table.concat(var97, "\n"))
			var81 = false
		end
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		local var98, var99 = validateCoplanarIntersectionModule(t, scale, p0)
		local var100 = var99
		
		if not var98 then
			table.insert(t_1, table.concat(var100, "\n"))
			var81 = false
		end
	end
	if getEngineFeatureEngineUGCValidateRigidNonSkinnedModule() then
		local var101, var102 = validateRigidMeshNotSkinnedModule(t.contentId, p0)
		local var103 = var102
		
		if not var101 then
			table.insert(t_1, table.concat(var103, "\n"))
			var81 = false
		end
	end
	return var81, t_1
end