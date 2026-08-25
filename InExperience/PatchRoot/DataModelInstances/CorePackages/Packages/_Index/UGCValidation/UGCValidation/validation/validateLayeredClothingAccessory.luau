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

return function(p0)
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (ref), createEyebrowEyelashSchemaModule (ref), createLayeredClothingSchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateDependenciesModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), getExpectedPartSizeModule (ref), getFIntUGCValidationLCHandleScaleOffsetMaximumModule (ref), getAttachmentModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule (ref), validateSurfaceAppearanceTextureSizeModule (ref), validateScaleTypeModule (ref), validateThumbnailConfigurationModule (ref), validateHSRModule (ref), validateHSRDataModule (ref), validateModerationModule (ref), validateTotalSurfaceAreaModule (ref), validateMeshSizePropertyModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), validateMaxCubeDensityModule (ref), validateLCCageQualityModule (ref), getFFlagUGCValidateMigrateCageGeometryModule (ref), validateLayeredClothingInRenderBoundsModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), validateSkinningTransferModule (ref), validateMeshPartOnlySkinnedToR15Module (ref)
	local instances = p0.instances
	local assetTypeEnum = p0.assetTypeEnum
	local isServer = p0.isServer
	local allowUnreviewedAssets = p0.allowUnreviewedAssets
	
	if not rigidOrLayeredAllowedModule.isLayeredClothingAllowed(assetTypeEnum) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing, nil, p0)
		
		return false, {
			string.format("Asset type '%s' is not a layered clothing category. It can only be used with rigid accessories.", assetTypeEnum.Name)
		}
	end
	local var49 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	local _ = nil
	local _ = nil
	local var50, var51 = validateSingleInstanceModule(instances, p0)
	
	if not var50 then
		return false, var51
	end
	local var53
	local var52 = instances[1]
	
	if getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then
		var53 = true
		
		if assetTypeEnum ~= Enum.AssetType.EyebrowAccessory then
			local _ = assetTypeEnum == Enum.AssetType.EyelashAccessory
		end
	else
		var53 = false
	end
	local var54, var55 = validateInstanceTreeModule(if var53 then createEyebrowEyelashSchemaModule(var49.attachmentNames) else createLayeredClothingSchemaModule(var49.attachmentNames), var52, p0)
	local var56 = var55
	
	if not var54 then
		return false, var56
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var57, var58 = validatePropertiesSensibleModule.validate(var52, p0)
		local var59 = var58
		
		if not var57 then
			return false, var59
		end
	end
	local var60, var61 = validateDependenciesModule(var52, p0, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule()
	})
	
	if not var60 then
		return false, var61
	end
	local var62 = true
	local t = {}
	local handle = var52:FindFirstChild("Handle")
	local t_1 = {
		fieldName = "MeshId",
		fullName = handle:GetFullName(),
		contentId = handle.MeshId,
		context = var52.Name
	}
	local var66 = t_1.contentId ~= nil and t_1.contentId ~= ""
	local var67, var68 = getEditableMeshFromContextModule(handle, "MeshId", p0)
	
	if not var67 then
		if t_1.contentId then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p0)
			
			return false, {
				string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", var52.Name)
			}
		end
		var66 = false
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_NoMeshId, nil, p0)
		var62 = false
		table.insert(t, {
			string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", var52.Name)
		})
	end
	t_1.editableMesh = var68
	var66 = true
	local textureID = handle.TextureID
	local t_2 = {
		fieldName = "TextureID",
		fullName = handle:GetFullName(),
		contentId = textureID
	}
	local _ = nil
	local _ = nil
	
	if textureID ~= "" then
		local var70, var71 = getEditableImageFromContextModule(handle, "TextureID", p0)
		local var72 = var71
		
		if not var70 then
			return false, {
				string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", var52.Name)
			}
		end
		t_2.editableImage = var72
	end
	local var73, var74 = pcallDeferredModule(function()
		-- upvalues: getMeshSizeModule (copy), t_1 (ref)
		return getMeshSizeModule(t_1)
	end, p0)
	
	if not var73 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p0)
		
		return false, {
			string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", var52.Name)
		}
	end
	local var75 = getExpectedPartSizeModule(handle, p0) / var74
	
	if not var75:FuzzyEq(Vector3.new(1, 1, 1), getFIntUGCValidationLCHandleScaleOffsetMaximumModule() / 1000) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_HandleIsScaled, nil, p0)
		table.insert(t, string.format("%s has been scaled, but mesh parts with wrap layers do not support scaling. You need to change the Size property to match the MeshSize property.", handle.Name))
		var62 = false
	end
	local var76 = getAttachmentModule(handle, var49.attachmentNames)
	local name = var49.bounds[var76.Name]
	local _ = {}
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var77, var78 = validateMaterialsModule(var52, p0)
		
		if not var77 then
			table.insert(t, table.concat(var78, "\n"))
			var62 = false
		end
		local var79, var80 = validatePropertyRequirementsModule(var52, nil, p0)
		local var81 = var80
		
		if not var79 then
			table.insert(t, table.concat(var81, "\n"))
			var62 = false
		end
	end
	local var82, var83 = validateTagsModule(var52, p0)
	local var84 = var83
	
	if not var82 then
		table.insert(t, table.concat(var84, "\n"))
		var62 = false
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var85, var86 = validateAttributesModule(var52, p0)
		local var87 = var86
		
		if not var85 then
			table.insert(t, table.concat(var87, "\n"))
			var62 = false
		end
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		local var88, var89 = validateTextureSizeModule(t_2, true, p0, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, handle, t_2.fieldName) else nil)
		local var90 = var89
		
		if not var88 then
			table.insert(t, table.concat(var90, "\n"))
			var62 = false
		end
		if getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule() then
			local var91, var92 = validateSurfaceAppearanceTextureSizeModule(var52, p0)
			local var93 = var92
			
			if not var91 then
				table.insert(t, table.concat(var93, "\n"))
				var62 = false
			end
		end
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
		
		if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
			local var95, var96 = validateScaleTypeModule(avatarPartScaleType, p0)
			local var97 = var96
			
			if not var95 then
				table.insert(t, table.concat(var97, "\n"))
				var62 = false
			end
		end
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and not var53 then
		local var98, var99 = validateThumbnailConfigurationModule(var52, handle, t_1, var75, p0)
		local var100 = var99
		
		if not var98 then
			table.insert(t, table.concat(var100, "\n"))
			var62 = false
		end
	end
	local var102
	local wrapLayer = handle:FindFirstChildOfClass("WrapLayer")
	
	if wrapLayer == nil then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, p0)
		table.insert(t, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", var52.Name))
		var102 = false
	elseif not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		local var103, var104 = validateHSRModule(wrapLayer, p0)
		local var105 = var104
		
		if not var103 then
			table.insert(t, table.concat(var105, "\n"))
			var62 = false
		end
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		if not p0.allowEditableInstances then
			local var106, var107 = validateHSRDataModule.validate(wrapLayer, p0)
			local var108 = var107
			
			if not var106 then
				table.insert(t, table.concat(var108, "\n"))
				var102 = false
				var102 = var62
			end
			var102 = var62
		end
		var102 = var62
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() and (if allowUnreviewedAssets then false else not isServer) then
		local var109, var110 = validateModerationModule(var52, {}, p0)
		local var111 = var110
		
		if not var109 then
			table.insert(t, table.concat(var111, "\n"))
			var102 = false
		end
	end
	local var112, var113 = validateTotalSurfaceAreaModule(t_1, var75, p0)
	
	if not var112 then
		table.insert(t, table.concat(var113, "\n"))
		var102 = false
	end
	local var114, var115 = validateMeshSizePropertyModule.validateSingleMeshPart(handle, p0)
	
	if not var114 then
		table.insert(t, table.concat(var115, "\n"))
		var102 = false
	end
	local var116, var117 = validateMeshBoundsModule(handle, var76, t_1, var75, name, assetTypeEnum.Name, p0)
	
	if not var116 then
		table.insert(t, table.concat(var117, "\n"))
		var102 = false
	end
	local var118, var119 = validateMeshTrianglesModule(t_1, nil, p0)
	
	if not var118 then
		table.insert(t, table.concat(var119, "\n"))
		var102 = false
	end
	local var120, var121 = validateMeshVertColorsModule(t_1, false, p0)
	
	if not var120 then
		table.insert(t, table.concat(var121, "\n"))
		var102 = false
	end
	local var122, var123 = validateCoplanarIntersectionModule(t_1, var75, p0)
	local var124 = var123
	
	if not var122 then
		table.insert(t, table.concat(var124, "\n"))
		var102 = false
	end
	local var125, var126 = validateMaxCubeDensityModule(t_1, p0, var75)
	
	if not var125 then
		table.insert(t, table.concat(var126, "\n"))
		var102 = false
	end
	local var127, var128 = validateLCCageQualityModule(var52, t_1, p0)
	local var129 = var128
	
	if not var127 then
		for i, v in var129 do
			table.insert(t, v)
		end
		var102 = false
	end
	if not getFFlagUGCValidateMigrateCageGeometryModule() then
		local var130, var131 = validateLayeredClothingInRenderBoundsModule(var52, p0)
		local var132 = var131
		
		if not var130 then
			table.insert(t, table.concat(var132, "\n"))
			var102 = false
		end
	end
	if getFFlagUGCValidateTexturePackModule() then
		local var133, var134 = validateTexturePackModule.validate(var52, false, p0)
		local var135 = var134
		
		if not var133 then
			table.insert(t, table.concat(var135, "\n"))
			var102 = false
		end
	end
	if not getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
		local var136, var137 = validateSkinningTransferModule(handle, p0)
		local var138 = var137
		
		if not var136 then
			table.insert(t, table.concat(var138, "\n"))
			var102 = false
		end
		if not constantsModule.SkinningTransferRequiredTypes[assetTypeEnum] then
			local var139, var140 = validateMeshPartOnlySkinnedToR15Module.validateMeshPart(handle, p0)
			local var141 = var140
			
			if not var139 then
				table.insert(t, table.concat(var141, "\n"))
				var102 = false
			end
		end
	end
	return var102, t
end