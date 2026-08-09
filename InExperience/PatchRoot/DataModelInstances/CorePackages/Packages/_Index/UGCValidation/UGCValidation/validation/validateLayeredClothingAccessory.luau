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
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateCageGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateCageGeometry)

return function(p0) --[[ line: 66 | named "validateLayeredClothingAccessory" ]]
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (ref), createEyebrowEyelashSchemaModule (ref), createLayeredClothingSchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref), validateDependenciesModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), getExpectedPartSizeModule (ref), getFIntUGCValidationLCHandleScaleOffsetMaximumModule (ref), getAttachmentModule (ref), validateMaterialsModule (ref), validatePropertyRequirementsModule (ref), validateTagsModule (ref), validateAttributesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), getFFlagUGCValidateAccessoryAssetTextureLimitModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule (ref), validateSurfaceAppearanceTextureSizeModule (ref), validateScaleTypeModule (ref), validateThumbnailConfigurationModule (ref), validateHSRModule (ref), validateHSRDataModule (ref), validateModerationModule (ref), validateTotalSurfaceAreaModule (ref), validateMeshSizePropertyModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), validateMaxCubeDensityModule (ref), validateLCCageQualityModule (ref), getFFlagUGCValidateMigrateCageGeometryModule (ref), validateLayeredClothingInRenderBoundsModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), validateSkinningTransferModule (ref), validateMeshPartOnlySkinnedToR15Module (ref)
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
	local var50 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	local _ = nil
	local _ = nil
	local var51, var52 = validateSingleInstanceModule(instances, p0)
	
	if not var51 then
		return false, var52
	end
	local var54
	local var53 = instances[1]
	
	if getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then
		var54 = true
		
		if assetTypeEnum ~= Enum.AssetType.EyebrowAccessory then
			local _ = assetTypeEnum == Enum.AssetType.EyelashAccessory
		end
	else
		var54 = false
	end
	local var55, var56 = validateInstanceTreeModule(if var54 then createEyebrowEyelashSchemaModule(var50.attachmentNames) else createLayeredClothingSchemaModule(var50.attachmentNames), var53, p0)
	local var57 = var56
	
	if not var55 then
		return false, var57
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var58, var59 = validatePropertiesSensibleModule.validate(var53, p0)
		local var60 = var59
		
		if not var58 then
			return false, var60
		end
	end
	local var61, var62 = validateDependenciesModule(var53, p0, {
		skipExistenceCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule(),
		skipOwnershipCheck = getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidationCombineEntrypointResultsModule()
	})
	
	if not var61 then
		return false, var62
	end
	local var63 = true
	local t = {}
	local handle = var53:FindFirstChild("Handle")
	local t_1 = {
		fieldName = "MeshId",
		fullName = handle:GetFullName(),
		contentId = handle.MeshId,
		context = var53.Name
	}
	local var67 = t_1.contentId ~= nil and t_1.contentId ~= ""
	local var68, var69 = getEditableMeshFromContextModule(handle, "MeshId", p0)
	
	if not var68 then
		if t_1.contentId then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p0)
			
			return false, {
				string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", var53.Name)
			}
		end
		var67 = false
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_NoMeshId, nil, p0)
		var63 = false
		table.insert(t, {
			string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", var53.Name)
		})
	end
	t_1.editableMesh = var69
	var67 = true
	local textureID = handle.TextureID
	local t_2 = {
		fieldName = "TextureID",
		fullName = handle:GetFullName(),
		contentId = textureID
	}
	local _ = nil
	local _ = nil
	
	if textureID ~= "" then
		local var71, var72 = getEditableImageFromContextModule(handle, "TextureID", p0)
		local var73 = var72
		
		if not var71 then
			return false, {
				string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", var53.Name)
			}
		end
		t_2.editableImage = var73
	end
	local var74, var75 = pcallDeferredModule(function() --[[ line: 200 ]]
		-- upvalues: getMeshSizeModule (copy), t_1 (ref)
		return getMeshSizeModule(t_1)
	end, p0)
	
	if not var74 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p0)
		
		return false, {
			string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", var53.Name)
		}
	end
	local var76 = getExpectedPartSizeModule(handle, p0) / var75
	
	if not var76:FuzzyEq(Vector3.new(1, 1, 1), getFIntUGCValidationLCHandleScaleOffsetMaximumModule() / 1000) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_HandleIsScaled, nil, p0)
		table.insert(t, string.format("%s has been scaled, but mesh parts with wrap layers do not support scaling. You need to change the Size property to match the MeshSize property.", handle.Name))
		var63 = false
	end
	local var77 = getAttachmentModule(handle, var50.attachmentNames)
	local name = var50.bounds[var77.Name]
	local _ = {}
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local var78, var79 = validateMaterialsModule(var53, p0)
		
		if not var78 then
			table.insert(t, table.concat(var79, "\n"))
			var63 = false
		end
		local var80, var81 = validatePropertyRequirementsModule(var53, nil, p0)
		local var82 = var81
		
		if not var80 then
			table.insert(t, table.concat(var82, "\n"))
			var63 = false
		end
	end
	local var83, var84 = validateTagsModule(var53, p0)
	local var85 = var84
	
	if not var83 then
		table.insert(t, table.concat(var85, "\n"))
		var63 = false
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local var86, var87 = validateAttributesModule(var53, p0)
		local var88 = var87
		
		if not var86 then
			table.insert(t, table.concat(var88, "\n"))
			var63 = false
		end
	end
	if not getFFlagUGCValidateMigrateTextureTransparencyModule() then
		local var89, var90 = validateTextureSizeModule(t_2, true, p0, if getFFlagUGCValidateAccessoryAssetTextureLimitModule() then constantsInterfaceModule.getTextureLimit(assetTypeEnum, handle, t_2.fieldName) else nil)
		local var91 = var90
		
		if not var89 then
			table.insert(t, table.concat(var91, "\n"))
			var63 = false
		end
		if getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimitsModule() then
			local var92, var93 = validateSurfaceAppearanceTextureSizeModule(var53, p0)
			local var94 = var93
			
			if not var92 then
				table.insert(t, table.concat(var94, "\n"))
				var63 = false
			end
		end
	end
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
		
		if avatarPartScaleType and avatarPartScaleType:IsA("StringValue") then
			local var96, var97 = validateScaleTypeModule(avatarPartScaleType, p0)
			local var98 = var97
			
			if not var96 then
				table.insert(t, table.concat(var98, "\n"))
				var63 = false
			end
		end
	end
	if (not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule()) and not var54 then
		local var99, var100 = validateThumbnailConfigurationModule(var53, handle, t_1, var76, p0)
		local var101 = var100
		
		if not var99 then
			table.insert(t, table.concat(var101, "\n"))
			var63 = false
		end
	end
	local var103
	local wrapLayer = handle:FindFirstChildOfClass("WrapLayer")
	
	if wrapLayer == nil then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, p0)
		table.insert(t, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", var53.Name))
		var103 = false
	elseif not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		local var104, var105 = validateHSRModule(wrapLayer, p0)
		local var106 = var105
		
		if not var104 then
			table.insert(t, table.concat(var106, "\n"))
			var63 = false
		end
	end
	if getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		if not getFFlagUGCValidationCombineEntrypointResultsModule() then
			if not p0.allowEditableInstances then
				local var107, var108 = validateHSRDataModule.validate(wrapLayer, p0)
				local var109 = var108
				
				if not var107 then
					table.insert(t, table.concat(var109, "\n"))
					var103 = false
					var103 = var63
				end
				var103 = var63
			end
			var103 = var63
		end
	end
	if (not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule()) and (if allowUnreviewedAssets then false else not isServer) then
		local var110, var111 = validateModerationModule(var53, {}, p0)
		local var112 = var111
		
		if not var110 then
			table.insert(t, table.concat(var112, "\n"))
			var103 = false
		end
	end
	local var113, var114 = validateTotalSurfaceAreaModule(t_1, var76, p0)
	
	if not var113 then
		table.insert(t, table.concat(var114, "\n"))
		var103 = false
	end
	local var115, var116 = validateMeshSizePropertyModule.validateSingleMeshPart(handle, p0)
	
	if not var115 then
		table.insert(t, table.concat(var116, "\n"))
		var103 = false
	end
	local var117, var118 = validateMeshBoundsModule(handle, var77, t_1, var76, name, assetTypeEnum.Name, p0)
	
	if not var117 then
		table.insert(t, table.concat(var118, "\n"))
		var103 = false
	end
	local var119, var120 = validateMeshTrianglesModule(t_1, nil, p0)
	
	if not var119 then
		table.insert(t, table.concat(var120, "\n"))
		var103 = false
	end
	local var121, var122 = validateMeshVertColorsModule(t_1, false, p0)
	
	if not var121 then
		table.insert(t, table.concat(var122, "\n"))
		var103 = false
	end
	local var123, var124 = validateCoplanarIntersectionModule(t_1, var76, p0)
	local var125 = var124
	
	if not var123 then
		table.insert(t, table.concat(var125, "\n"))
		var103 = false
	end
	local var126, var127 = validateMaxCubeDensityModule(t_1, p0, var76)
	
	if not var126 then
		table.insert(t, table.concat(var127, "\n"))
		var103 = false
	end
	local var128, var129 = validateLCCageQualityModule(var53, t_1, p0)
	local var130 = var129
	
	if not var128 then
		for i, v in var130 do
			table.insert(t, v)
		end
		var103 = false
	end
	if not getFFlagUGCValidateMigrateCageGeometryModule() then
		local var131, var132 = validateLayeredClothingInRenderBoundsModule(var53, p0)
		local var133 = var132
		
		if not var131 then
			table.insert(t, table.concat(var133, "\n"))
			var103 = false
		end
	end
	if getFFlagUGCValidateTexturePackModule() then
		local var134, var135 = validateTexturePackModule.validate(var53, false, p0)
		local var136 = var135
		
		if not var134 then
			table.insert(t, table.concat(var136, "\n"))
			var103 = false
		end
	end
	if not getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
		local var137, var138 = validateSkinningTransferModule(handle, p0)
		local var139 = var138
		
		if not var137 then
			table.insert(t, table.concat(var139, "\n"))
			var103 = false
		end
		if not constantsModule.SkinningTransferRequiredTypes[assetTypeEnum] then
			local var140, var141 = validateMeshPartOnlySkinnedToR15Module.validateMeshPart(handle, p0)
			local var142 = var141
			
			if not var140 then
				table.insert(t, table.concat(var142, "\n"))
				var103 = false
			end
		end
	end
	return var103, t
end