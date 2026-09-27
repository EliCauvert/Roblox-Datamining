local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local validateLCCageQualityModule = require(parent.validation.validateLCCageQuality)
local validateInstanceTreeModule = require(parent.validation.validateInstanceTree)
local validateMeshTrianglesModule = require(parent.validation.validateMeshTriangles)
local validateTagsModule = require(parent.validation.validateTags)
local validateMeshBoundsModule = require(parent.validation.validateMeshBounds)
local validateMeshVertColorsModule = require(parent.validation.validateMeshVertColors)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateMeshSizePropertyModule = require(parent.validation.ValidateMeshSizeProperty)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local validateSkinningTransferModule = require(parent.validation.validateSkinningTransfer)
local validateTotalSurfaceAreaModule = require(parent.validation.validateTotalSurfaceArea)
local validateCoplanarIntersectionModule = require(parent.validation.validateCoplanarIntersection)
local validateMaxCubeDensityModule = require(parent.validation.validateMaxCubeDensity)
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
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)
local getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule = require(parent.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema)
local validateMeshPartOnlySkinnedToR15Module = require(parent.validation.ValidateMeshPartOnlySkinnedToR15)
local getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)

return function(p1)
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (ref), createEyebrowEyelashSchemaModule (ref), createLayeredClothingSchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), validateDependenciesModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), getExpectedPartSizeModule (ref), getFIntUGCValidationLCHandleScaleOffsetMaximumModule (ref), getAttachmentModule (ref), validateTagsModule (ref), validateTotalSurfaceAreaModule (ref), validateMeshSizePropertyModule (ref), validateMeshBoundsModule (ref), validateMeshTrianglesModule (ref), validateMeshVertColorsModule (ref), validateCoplanarIntersectionModule (ref), validateMaxCubeDensityModule (ref), validateLCCageQualityModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), validateSkinningTransferModule (ref), validateMeshPartOnlySkinnedToR15Module (ref)
	local instances = p1.instances
	local assetTypeEnum = p1.assetTypeEnum
	
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
	local var12, var13 = validateDependenciesModule(var5, p1, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
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
	local var24
	local var25 = getAttachmentModule(handle, var1.attachmentNames)
	local name = var1.bounds[var25.Name]
	local _ = {}
	local var26, var27 = validateTagsModule(var5, p1)
	local var28 = var27
	
	if not var26 then
		table.insert(t, table.concat(var28, "\n"))
		var24 = false
		var24 = var14
	end
	if handle:FindFirstChildOfClass("WrapLayer") == nil then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, p1)
		table.insert(t, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", var5.Name))
		var24 = false
	end
	local var29, var30 = validateTotalSurfaceAreaModule(t_1, var23, p1)
	
	if not var29 then
		table.insert(t, table.concat(var30, "\n"))
		var24 = false
	end
	local var31, var32 = validateMeshSizePropertyModule.validateSingleMeshPart(handle, p1)
	
	if not var31 then
		table.insert(t, table.concat(var32, "\n"))
		var24 = false
	end
	local var33, var34 = validateMeshBoundsModule(handle, var25, t_1, var23, name, assetTypeEnum.Name, p1)
	
	if not var33 then
		table.insert(t, table.concat(var34, "\n"))
		var24 = false
	end
	local var35, var36 = validateMeshTrianglesModule(t_1, nil, p1)
	
	if not var35 then
		table.insert(t, table.concat(var36, "\n"))
		var24 = false
	end
	local var37, var38 = validateMeshVertColorsModule(t_1, false, p1)
	
	if not var37 then
		table.insert(t, table.concat(var38, "\n"))
		var24 = false
	end
	local var39, var40 = validateCoplanarIntersectionModule(t_1, var23, p1)
	local var41 = var40
	
	if not var39 then
		table.insert(t, table.concat(var41, "\n"))
		var24 = false
	end
	local var42, var43 = validateMaxCubeDensityModule(t_1, p1, var23)
	
	if not var42 then
		table.insert(t, table.concat(var43, "\n"))
		var24 = false
	end
	local var44, var45 = validateLCCageQualityModule(var5, t_1, p1)
	local var46 = var45
	
	if not var44 then
		for i, v in var46 do
			table.insert(t, v)
		end
		var24 = false
	end
	if getFFlagUGCValidateTexturePackModule() then
		local var47, var48 = validateTexturePackModule.validate(var5, false, p1)
		local var49 = var48
		
		if not var47 then
			table.insert(t, table.concat(var49, "\n"))
			var24 = false
		end
	end
	if not getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
		local var50, var51 = validateSkinningTransferModule(handle, p1)
		local var52 = var51
		
		if not var50 then
			table.insert(t, table.concat(var52, "\n"))
			var24 = false
		end
		if not constantsModule.SkinningTransferRequiredTypes[assetTypeEnum] then
			local var53, var54 = validateMeshPartOnlySkinnedToR15Module.validateMeshPart(handle, p1)
			local var55 = var54
			
			if not var53 then
				table.insert(t, table.concat(var55, "\n"))
				var24 = false
			end
		end
	end
	return var24, t
end