local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ValidateLCCageQualityModule = require(Parent.validation.validateLCCageQuality)
local ValidateInstanceTreeModule = require(Parent.validation.validateInstanceTree)
local ValidateTagsModule = require(Parent.validation.validateTags)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateMeshSizePropertyModule = require(Parent.validation.ValidateMeshSizeProperty)
local ValidatePropertiesSensibleModule = require(Parent.validation.ValidatePropertiesSensible)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local ValidateSkinningTransferModule = require(Parent.validation.validateSkinningTransfer)
local RigidOrLayeredAllowedModule = require(Parent.util.RigidOrLayeredAllowed)
local CreateLayeredClothingSchemaModule = require(Parent.util.createLayeredClothingSchema)
local CreateEyebrowEyelashSchemaModule = require(Parent.util.createEyebrowEyelashSchema)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFIntUGCValidationLCHandleScaleOffsetMaximumModule = require(Parent.flags.getFIntUGCValidationLCHandleScaleOffsetMaximum)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule = require(Parent.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema)
local ValidateMeshPartOnlySkinnedToR15Module = require(Parent.validation.ValidateMeshPartOnlySkinnedToR15)
local GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(Parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)

return function(p1)
	-- upvalues: RigidOrLayeredAllowedModule (copy), AnalyticsModule (copy), ConstantsModule (copy), ValidateSingleInstanceModule (copy), GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (copy), CreateEyebrowEyelashSchemaModule (copy), CreateLayeredClothingSchemaModule (copy), ValidateInstanceTreeModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), ValidateDependenciesModule (copy), GetEditableMeshFromContextModule (copy), GetEditableImageFromContextModule (copy), PcallDeferredModule (copy), GetMeshSizeModule (copy), GetExpectedPartSizeModule (copy), GetFIntUGCValidationLCHandleScaleOffsetMaximumModule (copy), ValidateTagsModule (copy), ValidateMeshSizePropertyModule (copy), ValidateLCCageQualityModule (copy), GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (copy), ValidateSkinningTransferModule (copy), ValidateMeshPartOnlySkinnedToR15Module (copy)
	local Instances = p1.instances
	local AssetTypeEnum = p1.assetTypeEnum
	
	if not RigidOrLayeredAllowedModule.isLayeredClothingAllowed(AssetTypeEnum) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing, nil, p1)
		
		return false, {
			string.format("Asset type '%s' is not a layered clothing category. It can only be used with rigid accessories.", AssetTypeEnum.Name)
		}
	end
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum]
	local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
	
	if not ValidateSingleInstanceModuleResult then
		return false, ValidateSingleInstanceModuleResult2
	end
	local InstancesEntry = Instances[1]
	local IsAssetTypeEnumMatch: boolean = if GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then AssetTypeEnum == Enum.AssetType.EyebrowAccessory or AssetTypeEnum == Enum.AssetType.EyelashAccessory else false
	local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(if IsAssetTypeEnumMatch then CreateEyebrowEyelashSchemaModule(ASSETTYPE.attachmentNames) else CreateLayeredClothingSchemaModule(ASSETTYPE.attachmentNames), InstancesEntry, p1)
	
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
	local Flag = true
	local List = {}
	local Handle = InstancesEntry:FindFirstChild("Handle")
	local config = {
		fieldName = "MeshId",
		fullName = Handle:GetFullName(),
		contentId = Handle.MeshId,
		context = InstancesEntry.Name
	}
	
	if config.contentId == nil or config.contentId == "" then
	end
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(Handle, "MeshId", p1)
	
	if not MeshId then
		if config.contentId then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p1)
			
			return false, {
				string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
			}
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_NoMeshId, nil, p1)
		Flag = false
		table.insert(List, {
			string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", InstancesEntry.Name)
		})
	end
	config.editableMesh = MeshId2
	local v1 = true
	local TextureID = Handle.TextureID
	local config1 = {
		fieldName = "TextureID",
		fullName = Handle:GetFullName(),
		contentId = TextureID
	}
	
	if TextureID ~= "" then
		local TextureID1, TextureID2 = GetEditableImageFromContextModule(Handle, "TextureID", p1)
		
		if not TextureID1 then
			return false, {
				string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", InstancesEntry.Name)
			}
		end
		config1.editableImage = TextureID2
	end
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: GetMeshSizeModule (upval), config (copy)
		return GetMeshSizeModule(config)
	end, p1)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, p1)
		
		return false, {
			string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", InstancesEntry.Name)
		}
	end
	if not (GetExpectedPartSizeModule(Handle, p1) / PcallDeferredModuleResult2):FuzzyEq(vector.create(1, 1, 1), GetFIntUGCValidationLCHandleScaleOffsetMaximumModule() / 1000) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_HandleIsScaled, nil, p1)
		table.insert(List, string.format("%s has been scaled, but mesh parts with wrap layers do not support scaling. You need to change the Size property to match the MeshSize property.", Handle.Name))
		Flag = false
	end
	local ValidateTagsModuleResult, ValidateTagsModuleResult2 = ValidateTagsModule(InstancesEntry, p1)
	
	if not ValidateTagsModuleResult then
		table.insert(List, table.concat(ValidateTagsModuleResult2, "\n"))
		Flag = false
	end
	if Handle:FindFirstChildOfClass("WrapLayer") == nil then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, p1)
		table.insert(List, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", InstancesEntry.Name))
		Flag = false
	end
	if v1 then
		local ValidateSingleMeshPartResult, ValidateSingleMeshPartResult2 = ValidateMeshSizePropertyModule.validateSingleMeshPart(Handle, p1)
		
		if not ValidateSingleMeshPartResult then
			table.insert(List, table.concat(ValidateSingleMeshPartResult2, "\n"))
			Flag = false
		end
	end
	local ValidateLCCageQualityModuleResult, ValidateLCCageQualityModuleResult2 = ValidateLCCageQualityModule(InstancesEntry, config, p1)
	
	if not ValidateLCCageQualityModuleResult then
		for _, value in ValidateLCCageQualityModuleResult2 do
			table.insert(List, value)
		end
		Flag = false
	end
	if not GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
		local ValidateSkinningTransferModuleResult, ValidateSkinningTransferModuleResult2 = ValidateSkinningTransferModule(Handle, p1)
		
		if not ValidateSkinningTransferModuleResult then
			table.insert(List, table.concat(ValidateSkinningTransferModuleResult2, "\n"))
			Flag = false
		end
		if not ConstantsModule.SkinningTransferRequiredTypes[AssetTypeEnum] then
			local ValidateMeshPartResult, ValidateMeshPartResult2 = ValidateMeshPartOnlySkinnedToR15Module.validateMeshPart(Handle, p1)
			
			if not ValidateMeshPartResult then
				table.insert(List, table.concat(ValidateMeshPartResult2, "\n"))
				Flag = false
			end
		end
	end
	return Flag, List
end