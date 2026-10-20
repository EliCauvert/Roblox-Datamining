local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ValidateInstanceTreeModule = require(Parent.validation.validateInstanceTree)
local ValidateTagsModule = require(Parent.validation.validateTags)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateMeshSizePropertyModule = require(Parent.validation.ValidateMeshSizeProperty)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local CreateMeshPartAccessorySchemaModule = require(Parent.util.createMeshPartAccessorySchema)
local GetAttachmentModule = require(Parent.util.getAttachment)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local RigidOrLayeredAllowedModule = require(Parent.util.RigidOrLayeredAllowed)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)

return function(p1)
	-- upvalues: RigidOrLayeredAllowedModule (copy), AnalyticsModule (copy), ConstantsModule (copy), ValidateSingleInstanceModule (copy), CreateMeshPartAccessorySchemaModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), ValidateDependenciesModule (copy), FailureReasonsAccumulatorModule (copy), GetEditableMeshFromContextModule (copy), GetEditableImageFromContextModule (copy), PcallDeferredModule (copy), GetMeshSizeModule (copy), GetAttachmentModule (copy), ValidateTagsModule (copy), ValidateMeshSizePropertyModule (copy)
	assert(p1.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAccessory")
	local Instances = p1.instances
	local AssetTypeEnum = p1.assetTypeEnum
	
	if not RigidOrLayeredAllowedModule.isRigidAccessoryAllowed(AssetTypeEnum) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory, nil, p1)
		
		return false, {
			string.format("Asset type '%s' is not a rigid accessory category. It can only be used with layered clothing.", AssetTypeEnum.Name)
		}
	end
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum]
	local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
	
	if not ValidateSingleInstanceModuleResult then
		return false, ValidateSingleInstanceModuleResult2
	end
	local InstancesEntry = Instances[1]
	local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(CreateMeshPartAccessorySchemaModule(ASSETTYPE.attachmentNames), InstancesEntry, p1)
	
	if not ValidateInstanceTreeModuleResult then
		return false, ValidateInstanceTreeModuleResult2
	end
	if GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local ValidateResult, ValidateResult2 = ValidatePropertiesSensibleModule.validate(InstancesEntry, p1)
		
		if not ValidateResult then
			return false, ValidateResult2
		end
	end
	local ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2 = ValidateDependenciesModule(InstancesEntry, p1, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
	if not ValidateDependenciesModuleResult then
		return false, ValidateDependenciesModuleResult2
	end
	local Handle = InstancesEntry:FindFirstChild("Handle")
	local config = {
		fieldName = "MeshId",
		fullName = Handle:GetFullName(),
		contentId = Handle.MeshId,
		context = InstancesEntry.Name
	}
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if Handle.DoubleSided then
		NewFailureReasonsAccumulator:updateReasons(false, {
			string.format("MeshPart '%s' is double-sided. Double-sided meshes are not allowed in rigid accessories.", Handle:GetFullName())
		})
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartAccessory_DoubleSided, nil, p1)
	end
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(Handle, "MeshId", p1)
	
	if not MeshId then
		if config.contentId then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p1)
			
			return false, {
				string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
			}
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartAccessory_NoMeshId, nil, p1)
		NewFailureReasonsAccumulator:updateReasons(false, {
			string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", Handle:GetFullName())
		})
	end
	config.editableMesh = MeshId2
	local _ = Handle.TextureID
	local _ = Handle:GetFullName()
	local _, _ = GetEditableImageFromContextModule(Handle, "TextureID", p1)
	local PcallDeferredModuleResult, _ = PcallDeferredModule(function()
		-- upvalues: GetMeshSizeModule (upval), config (copy)
		return GetMeshSizeModule(config)
	end, p1)
	
	if PcallDeferredModuleResult then
		local AttachmentModule = GetAttachmentModule(Handle, ASSETTYPE.attachmentNames)
		assert(AttachmentModule)
		assert(ASSETTYPE.bounds[AttachmentModule.Name], "Could not find bounds for " .. AttachmentModule.Name)
		NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(InstancesEntry, p1))
		NewFailureReasonsAccumulator:updateReasons(ValidateMeshSizePropertyModule.validateSingleMeshPart(Handle, p1))
		
		return NewFailureReasonsAccumulator:getFinalResults()
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, p1)
		
		return false, {
			string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
		}
	end
end