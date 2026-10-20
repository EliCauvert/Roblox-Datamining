local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidateSkinningTransferModule = require(Parent.validation.validateSkinningTransfer)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local GetMeshMinMaxModule = require(Parent.util.getMeshMinMax)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(Parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)

local function validateIsSkinned(Object, IsServer, AllowEditableInstances, p1)
	-- upvalues: ConstantsModule (copy), AnalyticsModule (copy), GetEditableMeshFromContextModule (copy), UGCValidationService (copy)
	local Attribute = Object:GetAttribute(ConstantsModule.AlternateMeshIdAttributeName)
	
	if not Object.HasSkinnedMesh and (Attribute == nil or Attribute == "" or not AllowEditableInstances) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, p1)
		
		return false, {
			`Missing skinning data for {Object.Name}.MeshId. You need to skin your model.`
		}
	end
	local Success, Result = pcall(function()
		-- upvalues: GetEditableMeshFromContextModule (upval), Object (copy), p1 (copy), UGCValidationService (upval)
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
		
		if not MeshId then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateSkinnedEditableMesh(MeshId2)
	end)
	
	if Success then
		if Result then
			return true
		end
		local Message: string = `Detected mismatch between model and skinned data for {Object.Name}. You need to re-skin your model to fix this issue.`
		
		if IsServer then
			error(Message)
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch, nil, p1)
		
		return false, { Message }
	else
		if IsServer then
			error("Failed to retrieve mesh data to validate skinned mesh")
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, p1)
		
		return false, { "Failed to retrieve mesh data to validate skinned mesh" }
	end
end

local function validateMeshIsAtOrigin(p2, p3, p4, p5)
	-- upvalues: AnalyticsModule (copy)
	if (p3 + (p4 - p3) / 2).Magnitude > 0.001 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin, nil, p5)
		
		return false, {
			string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", p2.fullName, 0.001)
		}
	else
		return true
	end
end

return function(p2, p3)
	-- upvalues: FailureReasonsAccumulatorModule (copy), ParseContentIdsModule (copy), ConstantsModule (copy), GetEditableMeshFromContextModule (copy), GetMeshMinMaxModule (copy), validateMeshIsAtOrigin (copy), AnalyticsModule (copy), validateIsSkinned (copy), GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (copy), ValidateSkinningTransferModule (copy)
	local IsServer = p3.isServer
	assert(p3.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics")
	local AllowEditableInstances = p3.allowEditableInstances
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, value in ParseContentIdsModule.parse(p2, ConstantsModule.MESH_CONTENT_ID_FIELDS, p3) do
		local config = {
			fullName = value.instance:GetFullName(),
			fieldName = value.fieldName,
			contentId = value.instance[value.fieldName],
			context = value.instance.Name
		}
		local EditableMeshFromContextModule, EditableMeshFromContextModule2 = GetEditableMeshFromContextModule(value.instance, value.fieldName, p3)
		
		if not EditableMeshFromContextModule then
			return false, {
				string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", value.instance.Name)
			}
		end
		config.editableMesh = EditableMeshFromContextModule2
		
		if value.instance.ClassName ~= "MeshPart" then
			if value.instance.ClassName == "WrapTarget" then
				assert(value.fieldName == "CageMeshId")
				config.fullName ..= "OuterCage"
				continue
			end
			continue
		end
		assert(value.fieldName == "MeshId")
		local MeshMinMaxModule, MeshMinMaxModule2, MeshMinMaxModule3, MeshMinMaxModule4 = GetMeshMinMaxModule(config, p3)
		
		if not MeshMinMaxModule then
			NewFailureReasonsAccumulator:updateReasons(false, MeshMinMaxModule2)
		end
		if MeshMinMaxModule then
			local CurrentTime = tick()
			NewFailureReasonsAccumulator:updateReasons(validateMeshIsAtOrigin(config, MeshMinMaxModule3, MeshMinMaxModule4, p3))
			AnalyticsModule.recordScriptTime("validateMeshIsAtOrigin", CurrentTime, p3)
		end
		local CurrentTime = tick()
		NewFailureReasonsAccumulator:updateReasons(validateIsSkinned(value.instance, IsServer, AllowEditableInstances, p3))
		AnalyticsModule.recordScriptTime("validateIsSkinned", CurrentTime, p3)
		
		if not GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateSkinningTransferModule(value.instance, p3))
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end