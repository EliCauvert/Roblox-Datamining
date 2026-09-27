local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local validateInstanceTreeModule = require(parent.validation.validateInstanceTree)
local validateTagsModule = require(parent.validation.validateTags)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateThumbnailConfigurationModule = require(parent.validation.validateThumbnailConfiguration)
local validateScaleTypeModule = require(parent.validation.validateScaleType)
local validateRigidMeshNotSkinnedModule = require(parent.validation.validateRigidMeshNotSkinned)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local rigidOrLayeredAllowedModule = require(parent.util.RigidOrLayeredAllowed)
local createAccessorySchemaModule = require(parent.util.createAccessorySchema)
local getAttachmentModule = require(parent.util.getAttachment)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local getEngineFeatureEngineUGCValidateRigidNonSkinnedModule = require(parent.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)

return function(p1)
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), createAccessorySchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), validateDependenciesModule (ref), getAttachmentModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), validateTagsModule (ref), validateScaleTypeModule (ref), validateThumbnailConfigurationModule (ref), getEngineFeatureEngineUGCValidateRigidNonSkinnedModule (ref), validateRigidMeshNotSkinnedModule (ref)
	local instances = p1.instances
	local assetTypeEnum = p1.assetTypeEnum
	
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
	local var11, var12 = validateDependenciesModule(var4, p1, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
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
	assert(var1.bounds[var13.Name], "Could not find bounds for " .. var32.Name)
	local var14 = true
	local t_1 = {}
	local var15 = t.contentId ~= nil and t.contentId ~= ""
	local var16, var17 = getEditableMeshFromContextModule(specialMesh, "MeshId", p1)
	
	if not var16 then
		if t.contentId then
			return false, {
				string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", var4.Name)
			}
		end
		var15 = false
		var14 = false
		table.insert(t_1, {
			string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", var4.Name)
		})
	end
	t.editableMesh = var17
	var15 = true
	local t_2 = {
		fieldName = "TextureId",
		fullName = specialMesh:GetFullName(),
		contentId = specialMesh.TextureId
	}
	local var18, var19 = getEditableImageFromContextModule(specialMesh, "TextureId", p1)
	
	if not var18 then
		return false, {
			string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", var4.Name)
		}
	end
	t_2.editableImage = var19
	local _ = {}
	local var20, var21 = validateTagsModule(var4, p1)
	local var22 = var21
	
	if not var20 then
		table.insert(t_1, table.concat(var22, "\n"))
		var14 = false
	end
	local var23
	local avatarPartScaleType = handle:FindFirstChild("AvatarPartScaleType")
	
	if avatarPartScaleType then
		if avatarPartScaleType:IsA("StringValue") then
			local var24, var25 = validateScaleTypeModule(avatarPartScaleType, p1)
			local var26 = var25
			
			if not var24 then
				table.insert(t_1, table.concat(var26, "\n"))
				var23 = false
				var23 = var14
			end
		else
			var23 = var14
		end
	else
		var23 = var14
	end
	local var27, var28 = validateThumbnailConfigurationModule(var4, handle, t, scale, p1)
	local var29 = var28
	
	if not var27 then
		table.insert(t_1, table.concat(var29, "\n"))
		var23 = false
	end
	if getEngineFeatureEngineUGCValidateRigidNonSkinnedModule() then
		local var30, var31 = validateRigidMeshNotSkinnedModule(t.contentId, p1)
		local var32 = var31
		
		if not var30 then
			table.insert(t_1, table.concat(var32, "\n"))
			var23 = false
		end
	end
	return var23, t_1
end