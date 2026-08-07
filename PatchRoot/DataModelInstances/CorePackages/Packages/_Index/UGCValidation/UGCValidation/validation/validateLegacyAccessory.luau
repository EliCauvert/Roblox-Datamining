-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:43 2026 Pacific Standard Time.

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
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local getFFlagUGCValidateMigrateMeshGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry)
local legacyAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("LegacyAccessoryCheckAvatarPartScaleType", false)

return function(p0) --[[ line: 50 | named "validateLegacyAccessory" ]]
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), createAccessorySchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref), validateDependenciesModule (ref), getAttachmentModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), validateScaleTypeModule (ref), validateThumbnailConfigurationModule (ref), validateModerationModule (ref), getFFlagUGCValidateMigrateMeshGeometryModule (ref), validateTotalSurfaceAreaModule (ref), legacyAccessoryCheckAvatarPartScaleType (ref), getAccessoryScaleModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), getEngineFeatureEngineUGCValidateRigidNonSkinnedModule (ref), validateRigidMeshNotSkinnedModule (ref)
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
	local var36 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	local _ = nil
	local _ = nil
	local var37, var38 = validateSingleInstanceModule(instances, p0)
	
	if not var37 then
		return false, var38
	end
	local var39 = instances[1]
	local var40, var41 = validateInstanceTreeModule(createAccessorySchemaModule(var36.attachmentNames), var39, p0)
	local var42 = var41
	
	if not var40 then
		return false, var42
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var43, var44 = validatePropertiesSensibleModule.validate(var39, p0)
		local var45 = var44
		
		if not var43 then
			return false, var45
		end
	end
	local var46, var47 = validateDependenciesModule(var39, p0, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
	if not var46 then
		return false, var47
	end
	local handle = var39:FindFirstChild("Handle")
	local specialMesh = handle:FindFirstChildOfClass("SpecialMesh")
	local t = {
		fieldName = "MeshId",
		fullName = specialMesh:GetFullName(),
		contentId = specialMesh.MeshId,
		context = var39.Name
	}
	local scale = specialMesh.Scale
	local var51 = getAttachmentModule(handle, var36.attachmentNames)
	local var52 = assert(var36.bounds[var51.Name], "Could not find bounds for " .. var51.Name)
	local var53 = true
	local t_1 = {}
	local var55 = t.contentId ~= nil and t.contentId ~= ""
	local var56, var57 = getEditableMeshFromContextModule(specialMesh, "MeshId", p0)
	
	if not var56 then
		if t.contentId then
			return false, {
				string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", var39.Name)
			}
		end
		var55 = false
		var53 = false
		table.insert(t_1, {
			string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", var39.Name)
		})
	end
	t.editableMesh = var57
	var55 = true
	local t_2 = {
		fieldName = "TextureId",
		fullName = specialMesh:GetFullName(),
		contentId = specialMesh.TextureId
	}
	local var59, var60 = getEditableImageFromContextModule(specialMesh, "TextureId", p0)
	
	if not var59 then
		return false, {
			string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", var39.Name)
		}
	end
	t_2.editableImage = var60
	local _ = {}
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local var61, var62 = validateMaterialsModule(var39, p0)
		
		if not var61 then
			table.insert(t_1, table.concat(var62, "\n"))
			var53 = false
		end
		local var63, var64 = validatePropertyRequirementsModule(var39, nil, p0)
		local var65 = var64
		
		if not var63 then
			table.insert(t_1, table.concat(var65, "\n"))
			var53 = false
		end
	end
	local var66, var67 = validateTagsModule(var39, p0)
	local var68 = var67
	
	if not var66 then
		table.insert(t_1, table.concat(var68, "\n"))
		var53 = false
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local var69, var70 = validateAttributesModule(var39, p0)
		local var71 = var70
		
		if not var69 then
			table.insert(t_1, table.concat(var71, "\n"))
			var53 = false
		end
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		local var72, var73 = validateTextureSizeModule(t_2, nil, p0, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, specialMesh, t_2.fieldName) else nil)
		local var74 = var73
		
		if not var72 then
			table.insert(t_1, table.concat(var74, "\n"))
			var53 = false
		end
	end
	local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
	
	if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
		local var76, var77 = validateScaleTypeModule(avatarPartScaleType, p0)
		local var78 = var77
		
		if not var76 then
			table.insert(t_1, table.concat(var78, "\n"))
			var53 = false
		end
	end
	local var82
	local var79, var80 = validateThumbnailConfigurationModule(var39, handle, t, scale, p0)
	local var81 = var80
	
	if not var79 then
		table.insert(t_1, table.concat(var81, "\n"))
		var82 = false
		var82 = var53
	end
	if (not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule()) and (if allowUnreviewedAssets then false else not isServer) then
		local var83, var84 = validateModerationModule(var39, {}, p0)
		local var85 = var84
		
		if not var83 then
			table.insert(t_1, table.concat(var85, "\n"))
			var82 = false
		end
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var86, var87 = validateTotalSurfaceAreaModule(t, scale, p0)
		local var88 = var87
		
		if not var86 then
			table.insert(t_1, table.concat(var88, "\n"))
			var82 = false
		end
	end
	if legacyAccessoryCheckAvatarPartScaleType and handle:FindFirstChild("AvatarPartScaleType") then
		local var89 = getAccessoryScaleModule(handle, var51)
		var52 = {
			size = var52.size / var89,
			offset = if var52.offset then var52.offset / var89 else nil
		}
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var90, var91 = validateMeshBoundsModule(handle, var51, t, scale, var52, assetTypeEnum.Name, p0)
		local var92 = var91
		
		if not var90 then
			table.insert(t_1, table.concat(var92, "\n"))
			var82 = false
		end
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var93, var94 = validateMeshTrianglesModule(t, nil, p0)
		local var95 = var94
		
		if not var93 then
			table.insert(t_1, table.concat(var95, "\n"))
			var82 = false
		end
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		local var96, var97 = validateMeshVertColorsModule(t, false, p0)
		local var98 = var97
		
		if not var96 then
			table.insert(t_1, table.concat(var98, "\n"))
			var82 = false
		end
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		local var99, var100 = validateCoplanarIntersectionModule(t, scale, p0)
		local var101 = var100
		
		if not var99 then
			table.insert(t_1, table.concat(var101, "\n"))
			var82 = false
		end
	end
	if getEngineFeatureEngineUGCValidateRigidNonSkinnedModule() then
		local var102, var103 = validateRigidMeshNotSkinnedModule(t.contentId, p0)
		local var104 = var103
		
		if not var102 then
			table.insert(t_1, table.concat(var104, "\n"))
			var82 = false
		end
	end
	return var82, t_1
end