local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local validateInstanceTreeModule = require(parent.validation.validateInstanceTree)
local validateTagsModule = require(parent.validation.validateTags)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateMeshSizePropertyModule = require(parent.validation.ValidateMeshSizeProperty)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local createMeshPartAccessorySchemaModule = require(parent.util.createMeshPartAccessorySchema)
local getAttachmentModule = require(parent.util.getAttachment)
local getMeshSizeModule = require(parent.util.getMeshSize)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local rigidOrLayeredAllowedModule = require(parent.util.RigidOrLayeredAllowed)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)

return function(p1)
	-- upvalues: rigidOrLayeredAllowedModule (ref), analyticsModule (ref), constantsModule (ref), validateSingleInstanceModule (ref), createMeshPartAccessorySchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), getEditableMeshFromContextModule (ref), getEditableImageFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), getAttachmentModule (ref), validateTagsModule (ref), validateMeshSizePropertyModule (ref)
	assert(p1.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAccessory")
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
	local var11, var12 = validateDependenciesModule(var4, p1, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
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
	local var14, var15 = getEditableMeshFromContextModule(handle, "MeshId", p1)
	
	if not var14 then
		if t.contentId then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p1)
			
			return false, {
				string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", var4.Name)
			}
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_NoMeshId, nil, p1)
		var13:updateReasons(false, {
			string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", handle:GetFullName())
		})
	end
	t.editableMesh = var15
	local t_1 = {
		fieldName = "TextureID",
		fullName = handle:GetFullName(),
		contentId = handle.TextureID
	}
	local _, var16 = getEditableImageFromContextModule(handle, "TextureID", p1)
	t_1.editableImage = var16
	local var17, _ = pcallDeferredModule(function()
		-- upvalues: getMeshSizeModule (copy), t (ref)
		return getMeshSizeModule(t)
	end, p1)
	
	if var17 then
		local var18 = getAttachmentModule(handle, var1.attachmentNames)
		assert(var18)
		assert(var1.bounds[var18.Name], "Could not find bounds for " .. var37.Name)
		var13:updateReasons(validateTagsModule(var4, p1))
		var13:updateReasons(validateMeshSizePropertyModule.validateSingleMeshPart(handle, p1))
		
		return var13:getFinalResults()
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p1)
	
	return false, {
		string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", var4.Name)
	}
end