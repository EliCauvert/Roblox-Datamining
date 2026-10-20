local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ValidateInstanceTreeModule = require(Parent.validation.validateInstanceTree)
local ValidateTagsModule = require(Parent.validation.validateTags)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateThumbnailConfigurationModule = require(Parent.validation.validateThumbnailConfiguration)
local ValidateScaleTypeModule = require(Parent.validation.validateScaleType)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local RigidOrLayeredAllowedModule = require(Parent.util.RigidOrLayeredAllowed)
local CreateAccessorySchemaModule = require(Parent.util.createAccessorySchema)
local GetAttachmentModule = require(Parent.util.getAttachment)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)

return function(p1)
	-- upvalues: RigidOrLayeredAllowedModule (copy), AnalyticsModule (copy), ConstantsModule (copy), ValidateSingleInstanceModule (copy), CreateAccessorySchemaModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), ValidateDependenciesModule (copy), GetAttachmentModule (copy), GetEditableMeshFromContextModule (copy), GetEditableImageFromContextModule (copy), ValidateTagsModule (copy), ValidateScaleTypeModule (copy), ValidateThumbnailConfigurationModule (copy)
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
	local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(CreateAccessorySchemaModule(ASSETTYPE.attachmentNames), InstancesEntry, p1)
	
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
	local SpecialMesh = Handle:FindFirstChildOfClass("SpecialMesh")
	local config = {
		fieldName = "MeshId",
		fullName = SpecialMesh:GetFullName(),
		contentId = SpecialMesh.MeshId,
		context = InstancesEntry.Name
	}
	local Scale = SpecialMesh.Scale
	local AttachmentModule = GetAttachmentModule(Handle, ASSETTYPE.attachmentNames)
	assert(ASSETTYPE.bounds[AttachmentModule.Name], "Could not find bounds for " .. AttachmentModule.Name)
	local Flag = true
	local List = {}
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(SpecialMesh, "MeshId", p1)
	
	if not MeshId then
		if config.contentId then
			return false, {
				string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
			}
		end
		Flag = false
		table.insert(List, {
			string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", InstancesEntry.Name)
		})
	end
	config.editableMesh = MeshId2
	local config1 = {
		fieldName = "TextureId",
		fullName = SpecialMesh:GetFullName(),
		contentId = SpecialMesh.TextureId
	}
	local TextureId, TextureId2 = GetEditableImageFromContextModule(SpecialMesh, "TextureId", p1)
	
	if not TextureId then
		return false, {
			string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", InstancesEntry.Name)
		}
	end
	config1.editableImage = TextureId2
	local ValidateTagsModuleResult, ValidateTagsModuleResult2 = ValidateTagsModule(InstancesEntry, p1)
	
	if not ValidateTagsModuleResult then
		table.insert(List, table.concat(ValidateTagsModuleResult2, "\n"))
		Flag = false
	end
	local AvatarPartScaleType = Handle:FindFirstChild("AvatarPartScaleType")
	
	if AvatarPartScaleType and AvatarPartScaleType:IsA("StringValue") then
		local ValidateScaleTypeModuleResult, ValidateScaleTypeModuleResult2 = ValidateScaleTypeModule(AvatarPartScaleType, p1)
		
		if not ValidateScaleTypeModuleResult then
			table.insert(List, table.concat(ValidateScaleTypeModuleResult2, "\n"))
			Flag = false
		end
	end
	local ValidateThumbnailConfigurationModuleResult, ValidateThumbnailConfigurationModuleResult2 = ValidateThumbnailConfigurationModule(InstancesEntry, Handle, config, Scale, p1)
	
	if not ValidateThumbnailConfigurationModuleResult then
		table.insert(List, table.concat(ValidateThumbnailConfigurationModuleResult2, "\n"))
		Flag = false
	end
	return Flag, List
end