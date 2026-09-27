local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validateSkinningTransferModule = require(parent.validation.validateSkinningTransfer)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)

local function validateIsSkinned(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref), analyticsModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref)
	local alternateMeshIdAttributeNameAttribute = p1:GetAttribute(constantsModule.AlternateMeshIdAttributeName)
	
	if not p1.HasSkinnedMesh and (alternateMeshIdAttributeNameAttribute == nil or alternateMeshIdAttributeNameAttribute == "" or not p3) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, p4)
		
		return false, {
			`Missing skinning data for {p1.Name}.MeshId. You need to skin your model.`
		}
	end
	local ok, status = pcall(function()
		-- upvalues: getEditableMeshFromContextModule (copy), p1 (ref), p4 (ref), UGCValidationService (copy)
		local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p4)
		
		if not var1 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateSkinnedEditableMesh(var2)
	end)
	
	if ok then
		if status then
			return true
		end
		local name = `Detected mismatch between model and skinned data for {p1.Name}. You need to re-skin your model to fix this issue.`
		
		if p2 then
			error(name)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch, nil, p4)
		
		return false, { name }
	elseif p2 then
		error("Failed to retrieve mesh data to validate skinned mesh")
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, p4)
	
	return false, { "Failed to retrieve mesh data to validate skinned mesh" }
end

local function validateMeshIsAtOrigin(p5, p6, p7, p8)
	-- upvalues: analyticsModule (ref)
	if (p6 + (p7 - p6) / 2).Magnitude > 0.001 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin, nil, p8)
		
		return false, {
			string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", p5.fullName, 0.001)
		}
	end
	return true
end

return function(p5, p6)
	-- upvalues: failureReasonsAccumulatorModule (ref), parseContentIdsModule (ref), constantsModule (ref), getEditableMeshFromContextModule (ref), getMeshMinMaxModule (ref), validateMeshIsAtOrigin (ref), analyticsModule (ref), validateIsSkinned (ref), getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), validateSkinningTransferModule (ref)
	local isServer = p6.isServer
	assert(p6.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics")
	local allowEditableInstances = p6.allowEditableInstances
	local var1 = failureReasonsAccumulatorModule.new()
	local _ = nil
	
	for i, v in parseContentIdsModule.parse(p5, constantsModule.MESH_CONTENT_ID_FIELDS, p6) do
		local t = {
			fullName = v.instance:GetFullName(),
			fieldName = v.fieldName,
			contentId = v.instance[v.fieldName],
			context = v.instance.Name
		}
		local var2, var3 = getEditableMeshFromContextModule(v.instance, v.fieldName, p6)
		
		if var2 then
			t.editableMesh = var3
			
			if v.instance.ClassName == "MeshPart" then
				assert(v.fieldName == "MeshId")
				local var4, var5, var6, var7 = getMeshMinMaxModule(t, p6)
				
				if not var4 then
					var1:updateReasons(false, var5)
				end
				if var4 then
					local currentTime = tick()
					var1:updateReasons(validateMeshIsAtOrigin(t, var6, var7, p6))
					analyticsModule.recordScriptTime("validateMeshIsAtOrigin", currentTime, p6)
				end
				local currentTime = tick()
				var1:updateReasons(validateIsSkinned(v.instance, isServer, allowEditableInstances, p6))
				analyticsModule.recordScriptTime("validateIsSkinned", currentTime, p6)
				
				if not getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
					var1:updateReasons(validateSkinningTransferModule(v.instance, p6))
				end
			elseif v.instance.ClassName == "WrapTarget" then
				assert(v.fieldName == "CageMeshId")
				t.fullName ..= "OuterCage"
			end
		end
		return false, {
			string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v.instance.Name)
		}
	end
	return var1:getFinalResults()
end