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

return function(p1)
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), createAccessorySchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), getAttachmentModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), validateScaleTypeModule (ref), validateThumbnailConfigurationModule (ref), validateModerationModule (ref), getFFlagUGCValidateMigrateMeshGeometryModule (ref), validateTotalSurfaceAreaModule (ref), legacyAccessoryCheckAvatarPartScaleType (ref), getAccessoryScaleModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), getEngineFeatureEngineUGCValidateRigidNonSkinnedModule (ref), validateRigidMeshNotSkinnedModule (ref)
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
	local var5, var6 = validateInstanceTreeModule(createAccessorySchemaModule(var1.attachmentNames), var4, p1)
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
	local specialMesh = handle:FindFirstChildOfClass("SpecialMesh")
	local t = {
		fieldName = "MeshId",
		fullName = specialMesh:GetFullName(),
		contentId = specialMesh.MeshId,
		context = var4.Name
	}
	local scale = specialMesh.Scale
	local var13 = getAttachmentModule(handle, var1.attachmentNames)
	local var14 = assert(var1.bounds[var13.Name], "Could not find bounds for " .. var50.Name)
	local var15 = true
	local t_1 = {}
	local var16 = t.contentId ~= nil and t.contentId ~= ""
	local var17, var18 = getEditableMeshFromContextModule(specialMesh, "MeshId", p1)
	
	if not var17 then
		if t.contentId then
			return false, {
				string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", var4.Name)
			}
		end
		var16 = false
		var15 = false
		table.insert(t_1, {
			string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", var4.Name)
		})
	end
	t.editableMesh = var18
	var16 = true
	local t_2 = {
		fieldName = "TextureId",
		fullName = specialMesh:GetFullName(),
		contentId = specialMesh.TextureId
	}
	local var19, var20 = getEditableImageFromContextModule(specialMesh, "TextureId", p1)
	
	if not var19 then
		return false, {
			string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", var4.Name)
		}
	end
	t_2.editableImage = var20
	local _ = {}
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var21, var22 = validateMaterialsModule(var4, p1)
		
		if not var21 then
			table.insert(t_1, table.concat(var22, "\n"))
			var15 = false
		end
		local var23, var24 = validatePropertyRequirementsModule(var4, nil, p1)
		local var25 = var24
		
		if not var23 then
			table.insert(t_1, table.concat(var25, "\n"))
			var15 = false
		end
	end
	local var26, var27 = validateTagsModule(var4, p1)
	local var28 = var27
	
	if not var26 then
		table.insert(t_1, table.concat(var28, "\n"))
		var15 = false
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var29, var30 = validateAttributesModule(var4, p1)
		local var31 = var30
		
		if not var29 then
			table.insert(t_1, table.concat(var31, "\n"))
			var15 = false
		end
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		local var32, var33 = validateTextureSizeModule(t_2, nil, p1, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, specialMesh, t_2.fieldName) else nil)
		local var34 = var33
		
		if not var32 then
			table.insert(t_1, table.concat(var34, "\n"))
			var15 = false
		end
	end
	local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
	
	if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
		local var35, var36 = validateScaleTypeModule(avatarPartScaleType, p1)
		local var37 = var36
		
		if not var35 then
			table.insert(t_1, table.concat(var37, "\n"))
			var15 = false
		end
	end
	local var38
	local var39, var40 = validateThumbnailConfigurationModule(var4, handle, t, scale, p1)
	local var41 = var40
	
	if not var39 then
		table.insert(t_1, table.concat(var41, "\n"))
		var38 = false
		var38 = var15
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
		local var42, var43 = validateModerationModule(var4, {}, p1)
		local var44 = var43
		
		if not var42 then
			table.insert(t_1, table.concat(var44, "\n"))
			var38 = false
		end
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var45, var46 = validateTotalSurfaceAreaModule(t, scale, p1)
		local var47 = var46
		
		if not var45 then
			table.insert(t_1, table.concat(var47, "\n"))
			var38 = false
		end
	end
	if legacyAccessoryCheckAvatarPartScaleType and handle:FindFirstChild("AvatarPartScaleType") then
		local var48 = getAccessoryScaleModule(handle, var13)
		var14 = {
			size = var14.size / var48,
			offset = if var14.offset then var14.offset / var48 else nil
		}
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var49, var50 = validateMeshBoundsModule(handle, var13, t, scale, var14, assetTypeEnum.Name, p1)
		local var51 = var50
		
		if not var49 then
			table.insert(t_1, table.concat(var51, "\n"))
			var38 = false
		end
	end
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		local var52, var53 = validateMeshTrianglesModule(t, nil, p1)
		local var54 = var53
		
		if not var52 then
			table.insert(t_1, table.concat(var54, "\n"))
			var38 = false
		end
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		local var55, var56 = validateMeshVertColorsModule(t, false, p1)
		local var57 = var56
		
		if not var55 then
			table.insert(t_1, table.concat(var57, "\n"))
			var38 = false
		end
	end
	if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
		local var58, var59 = validateCoplanarIntersectionModule(t, scale, p1)
		local var60 = var59
		
		if not var58 then
			table.insert(t_1, table.concat(var60, "\n"))
			var38 = false
		end
	end
	if getEngineFeatureEngineUGCValidateRigidNonSkinnedModule() then
		local var61, var62 = validateRigidMeshNotSkinnedModule(t.contentId, p1)
		local var63 = var62
		
		if not var61 then
			table.insert(t_1, table.concat(var63, "\n"))
			var38 = false
		end
	end
	return var38, t_1
end