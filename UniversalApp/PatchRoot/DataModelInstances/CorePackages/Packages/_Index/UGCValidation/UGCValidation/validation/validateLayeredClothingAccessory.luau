local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local validateLCCageQualityModule = require(parent.validation.validateLCCageQuality)
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
local validateHSRModule = require(parent.validation.validateHSR)
local validateThumbnailConfigurationModule = require(parent.validation.validateThumbnailConfiguration)
local validateScaleTypeModule = require(parent.validation.validateScaleType)
local validateLayeredClothingInRenderBoundsModule = require(parent.validation.validateLayeredClothingInRenderBounds)
local validateMeshSizePropertyModule = require(parent.validation.ValidateMeshSizeProperty)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local validateSkinningTransferModule = require(parent.validation.validateSkinningTransfer)
local validateTotalSurfaceAreaModule = require(parent.validation.validateTotalSurfaceArea)
local validateCoplanarIntersectionModule = require(parent.validation.validateCoplanarIntersection)
local validateMaxCubeDensityModule = require(parent.validation.validateMaxCubeDensity)
local validateHSRDataModule = require(parent.validation.ValidateHSRData)
local validateSurfaceAppearanceTextureSizeModule = require(parent.validation.validateSurfaceAppearanceTextureSize)
local validateTexturePackModule = require(parent.validation.ValidateTexturePack)
local rigidOrLayeredAllowedModule = require(parent.util.RigidOrLayeredAllowed)
local createLayeredClothingSchemaModule = require(parent.util.createLayeredClothingSchema)
local createEyebrowEyelashSchemaModule = require(parent.util.createEyebrowEyelashSchema)
local getAttachmentModule = require(parent.util.getAttachment)
local getMeshSizeModule = require(parent.util.getMeshSize)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFIntUGCValidationLCHandleScaleOffsetMaximumModule = require(parent.flags.getFIntUGCValidationLCHandleScaleOffsetMaximum)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateAccessoryAssetTextureLimitModule = require(parent.flags.getFFlagUGCValidateAccessoryAssetTextureLimit)
local getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule = require(parent.flags.getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimits)
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)
local getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule = require(parent.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema)
local validateMeshPartOnlySkinnedToR15Module = require(parent.validation.ValidateMeshPartOnlySkinnedToR15)
local getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateCageGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateCageGeometry)

return function(p1)
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (ref), createEyebrowEyelashSchemaModule (ref), createLayeredClothingSchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), getExpectedPartSizeModule (ref), getFIntUGCValidationLCHandleScaleOffsetMaximumModule (ref), getAttachmentModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule (ref), validateSurfaceAppearanceTextureSizeModule (ref), validateScaleTypeModule (ref), validateThumbnailConfigurationModule (ref), validateHSRModule (ref), validateHSRDataModule (ref), validateModerationModule (ref), validateTotalSurfaceAreaModule (ref), validateMeshSizePropertyModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), validateMaxCubeDensityModule (ref), validateLCCageQualityModule (ref), getFFlagUGCValidateMigrateCageGeometryModule (ref), validateLayeredClothingInRenderBoundsModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), validateSkinningTransferModule (ref), validateMeshPartOnlySkinnedToR15Module (ref)
	local instances = p1.instances
	local assetTypeEnum = p1.assetTypeEnum
	local isServer = p1.isServer
	local allowUnreviewedAssets = p1.allowUnreviewedAssets
	
	if not rigidOrLayeredAllowedModule.isLayeredClothingAllowed(assetTypeEnum) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing, nil, p1)
		
		return false, {
			string.format("Asset type '%s' is not a layered clothing category. It can only be used with rigid accessories.", assetTypeEnum.Name)
		}
	end
	local var1 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	local _ = nil
	local _ = nil
	local var2, var3 = validateSingleInstanceModule(instances, p1)
	
	if not var2 then
		return false, var3
	end
	local var4
	local var5 = instances[1]
	
	if getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then
		var4 = true
		
		if assetTypeEnum ~= Enum.AssetType.EyebrowAccessory then
			local _ = assetTypeEnum == Enum.AssetType.EyelashAccessory
		end
	else
		var4 = false
	end
	local var6, var7 = validateInstanceTreeModule(if var4 then createEyebrowEyelashSchemaModule(var1.attachmentNames) else createLayeredClothingSchemaModule(var1.attachmentNames), var5, p1)
	local var8 = var7
	
	if not var6 then
		return false, var8
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var9, var10 = validatePropertiesSensibleModule.validate(var5, p1)
		local var11 = var10
		
		if not var9 then
			return false, var11
		end
	end
	local var12, var13 = validateDependenciesModule(var5, p1, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var12 then
		return false, var13
	end
	local var14 = true
	local t = {}
	local handle = var5:FindFirstChild("Handle")
	local t_1 = {
		fieldName = "MeshId",
		fullName = handle:GetFullName(),
		contentId = handle.MeshId,
		context = var5.Name
	}
	local var15 = t_1.contentId ~= nil and t_1.contentId ~= ""
	local var16, var17 = getEditableMeshFromContextModule(handle, "MeshId", p1)
	
	if not var16 then
		if t_1.contentId then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p1)
			
			return false, {
				string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", var5.Name)
			}
		end
		var15 = false
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_NoMeshId, nil, p1)
		var14 = false
		table.insert(t, {
			string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", var5.Name)
		})
	end
	t_1.editableMesh = var17
	var15 = true
	local textureID = handle.TextureID
	local t_2 = {
		fieldName = "TextureID",
		fullName = handle:GetFullName(),
		contentId = textureID
	}
	local _ = nil
	local _ = nil
	
	if textureID ~= "" then
		local var18, var19 = getEditableImageFromContextModule(handle, "TextureID", p1)
		local var20 = var19
		
		if not var18 then
			return false, {
				string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", var5.Name)
			}
		end
		t_2.editableImage = var20
	end
	local var21, var22 = pcallDeferredModule(function()
		-- upvalues: getMeshSizeModule (copy), t_1 (ref)
		return getMeshSizeModule(t_1)
	end, p1)
	
	if not var21 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p1)
		
		return false, {
			string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", var5.Name)
		}
	end
	local var23 = getExpectedPartSizeModule(handle, p1) / var22
	
	if not var23:FuzzyEq(Vector3.new(1, 1, 1), getFIntUGCValidationLCHandleScaleOffsetMaximumModule() / 1000) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_HandleIsScaled, nil, p1)
		table.insert(t, string.format("%s has been scaled, but mesh parts with wrap layers do not support scaling. You need to change the Size property to match the MeshSize property.", handle.Name))
		var14 = false
	end
	local var24 = getAttachmentModule(handle, var1.attachmentNames)
	local name = var1.bounds[var24.Name]
	local _ = {}
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var25, var26 = validateMaterialsModule(var5, p1)
		
		if not var25 then
			table.insert(t, table.concat(var26, "\n"))
			var14 = false
		end
		local var27, var28 = validatePropertyRequirementsModule(var5, nil, p1)
		local var29 = var28
		
		if not var27 then
			table.insert(t, table.concat(var29, "\n"))
			var14 = false
		end
	end
	local var30, var31 = validateTagsModule(var5, p1)
	local var32 = var31
	
	if not var30 then
		table.insert(t, table.concat(var32, "\n"))
		var14 = false
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var33, var34 = validateAttributesModule(var5, p1)
		local var35 = var34
		
		if not var33 then
			table.insert(t, table.concat(var35, "\n"))
			var14 = false
		end
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		local var36, var37 = validateTextureSizeModule(t_2, true, p1, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, handle, t_2.fieldName) else nil)
		local var38 = var37
		
		if not var36 then
			table.insert(t, table.concat(var38, "\n"))
			var14 = false
		end
		if getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule() then
			local var39, var40 = validateSurfaceAppearanceTextureSizeModule(var5, p1)
			local var41 = var40
			
			if not var39 then
				table.insert(t, table.concat(var41, "\n"))
				var14 = false
			end
		end
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
		
		if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
			local var42, var43 = validateScaleTypeModule(avatarPartScaleType, p1)
			local var44 = var43
			
			if not var42 then
				table.insert(t, table.concat(var44, "\n"))
				var14 = false
			end
		end
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and not var4 then
		local var45, var46 = validateThumbnailConfigurationModule(var5, handle, t_1, var23, p1)
		local var47 = var46
		
		if not var45 then
			table.insert(t, table.concat(var47, "\n"))
			var14 = false
		end
	end
	local var48
	local wrapLayer = handle:FindFirstChildOfClass("WrapLayer")
	
	if wrapLayer == nil then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, p1)
		table.insert(t, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", var5.Name))
		var48 = false
	elseif not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var49, var50 = validateHSRModule(wrapLayer, p1)
		local var51 = var50
		
		if not var49 then
			table.insert(t, table.concat(var51, "\n"))
			var14 = false
		end
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		if not p1.allowEditableInstances then
			local var52, var53 = validateHSRDataModule.validate(wrapLayer, p1)
			local var54 = var53
			
			if not var52 then
				table.insert(t, table.concat(var54, "\n"))
				var48 = false
				var48 = var14
			end
			var48 = var14
		end
		var48 = var14
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
		local var55, var56 = validateModerationModule(var5, {}, p1)
		local var57 = var56
		
		if not var55 then
			table.insert(t, table.concat(var57, "\n"))
			var48 = false
		end
	end
	local var58, var59 = validateTotalSurfaceAreaModule(t_1, var23, p1)
	
	if not var58 then
		table.insert(t, table.concat(var59, "\n"))
		var48 = false
	end
	local var60, var61 = validateMeshSizePropertyModule.validateSingleMeshPart(handle, p1)
	
	if not var60 then
		table.insert(t, table.concat(var61, "\n"))
		var48 = false
	end
	local var62, var63 = validateMeshBoundsModule(handle, var24, t_1, var23, name, assetTypeEnum.Name, p1)
	
	if not var62 then
		table.insert(t, table.concat(var63, "\n"))
		var48 = false
	end
	local var64, var65 = validateMeshTrianglesModule(t_1, nil, p1)
	
	if not var64 then
		table.insert(t, table.concat(var65, "\n"))
		var48 = false
	end
	local var66, var67 = validateMeshVertColorsModule(t_1, false, p1)
	
	if not var66 then
		table.insert(t, table.concat(var67, "\n"))
		var48 = false
	end
	local var68, var69 = validateCoplanarIntersectionModule(t_1, var23, p1)
	local var70 = var69
	
	if not var68 then
		table.insert(t, table.concat(var70, "\n"))
		var48 = false
	end
	local var71, var72 = validateMaxCubeDensityModule(t_1, p1, var23)
	
	if not var71 then
		table.insert(t, table.concat(var72, "\n"))
		var48 = false
	end
	local var73, var74 = validateLCCageQualityModule(var5, t_1, p1)
	local var75 = var74
	
	if not var73 then
		for i, v in var75 do
			table.insert(t, v)
		end
		var48 = false
	end
	if not getFFlagUGCValidateMigrateCageGeometryModule() then
		local var76, var77 = validateLayeredClothingInRenderBoundsModule(var5, p1)
		local var78 = var77
		
		if not var76 then
			table.insert(t, table.concat(var78, "\n"))
			var48 = false
		end
	end
	if getFFlagUGCValidateTexturePackModule() then
		local var79, var80 = validateTexturePackModule.validate(var5, false, p1)
		local var81 = var80
		
		if not var79 then
			table.insert(t, table.concat(var81, "\n"))
			var48 = false
		end
	end
	if not getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
		local var82, var83 = validateSkinningTransferModule(handle, p1)
		local var84 = var83
		
		if not var82 then
			table.insert(t, table.concat(var84, "\n"))
			var48 = false
		end
		if not constantsModule.SkinningTransferRequiredTypes[assetTypeEnum] then
			local var85, var86 = validateMeshPartOnlySkinnedToR15Module.validateMeshPart(handle, p1)
			local var87 = var86
			
			if not var85 then
				table.insert(t, table.concat(var87, "\n"))
				var48 = false
			end
		end
	end
	return var48, t
end