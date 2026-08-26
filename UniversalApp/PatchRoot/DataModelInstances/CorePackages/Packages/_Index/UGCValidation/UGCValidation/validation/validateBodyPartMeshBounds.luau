local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local validateMeshComparisonModule = require(parent.validation.validateMeshComparison)
local getMeshSizeModule = require(parent.util.getMeshSize)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local getMeshInfoModule = require(parent.util.getMeshInfo)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)

local function validateWrapTargetComparison(p1, p2, p3)
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), validateMeshComparisonModule (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var1, var2, var3 = getMeshInfoModule(p2, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p3)
	
	if not var1 then
		return false, var2
	end
	local wrapTarget = p2:FindFirstChildWhichIsA("WrapTarget")
	assert(wrapTarget, "Missing WrapTarget child for " .. p1.Name)
	local _ = nil
	local _ = nil
	local _ = nil
	local var4, var5, var6 = getMeshInfoModule(wrapTarget, constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p3)
	
	if var4 then
		var3.scale = p1
		var6.scale = p1
		
		return validateMeshComparisonModule(var3, var6, constantsModule.RenderVsWrapMeshMaxDiff, p3)
	end
	return false, var5
end

local function calculateMeshSize(p1, p2)
	-- upvalues: getEditableMeshFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), analyticsModule (ref)
	local t = {
		fieldName = "MeshId",
		fullName = p1:GetFullName(),
		contentId = p1.MeshId,
		context = p1.Name
	}
	local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p2)
	
	if not var1 then
		return false, {
			string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", t.fullName)
		}
	end
	t.editableMesh = var2
	local var3, var4 = pcallDeferredModule(function()
		-- upvalues: getMeshSizeModule (copy), t (ref)
		return getMeshSizeModule(t)
	end, p2)
	
	if var3 then
		return true, nil, var4
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartMeshBounds_FailedToLoadMesh, nil, p2)
	
	if p2.isServer then
		error("Failed to read mesh")
	end
	return false, { "Failed to read mesh" }
end

local function validateInternal(p1, p2)
	-- upvalues: calculateMeshSize (ref), getExpectedPartSizeModule (ref), failureReasonsAccumulatorModule (ref), validateWrapTargetComparison (ref), analyticsModule (ref)
	local currentTime = tick()
	local var1, var2, var3 = calculateMeshSize(p1, p2)
	
	if var1 and var3 then
		local var4 = failureReasonsAccumulatorModule.new()
		var4:updateReasons(validateWrapTargetComparison(getExpectedPartSizeModule(p1, p2) / var3, p1, p2))
		analyticsModule.recordScriptTime(script.Name, currentTime, p2)
		
		return var4:getFinalResults()
	end
	return var1, var2
end

return function(p1, p2)
	-- upvalues: constantsModule (ref), validateInternal (ref), failureReasonsAccumulatorModule (ref)
	local assetTypeEnum = p2.assetTypeEnum
	local var1 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	
	if Enum.AssetType.DynamicHead == assetTypeEnum then
		return validateInternal(p1, p2)
	end
	local var2 = failureReasonsAccumulatorModule.new()
	
	for i in pairs(var1.subParts) do
		local var3 = p1:FindFirstChild(i)
		assert(var3)
		var2:updateReasons(validateInternal(var3, p2))
	end
	return var2:getFinalResults()
end