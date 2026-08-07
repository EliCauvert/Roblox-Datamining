-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:41 2026 Pacific Standard Time.

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

local function validateWrapTargetComparison(p0, p1, p2) --[[ line: 21 ]]
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), validateMeshComparisonModule (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var12, var13, var14 = getMeshInfoModule(p1, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p2)
	
	if not var12 then
		return false, var13
	end
	local wrapTarget = p1:FindFirstChildWhichIsA("WrapTarget")
	assert(wrapTarget, "Missing WrapTarget child for " .. p1.Name)
	local _ = nil
	local _ = nil
	local _ = nil
	local var16, var17, var18 = getMeshInfoModule(wrapTarget, constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p2)
	
	if var16 then
		var14.scale = p0
		var18.scale = p0
		
		return validateMeshComparisonModule(var14, var18, constantsModule.RenderVsWrapMeshMaxDiff, p2)
	end
	return false, var17
end

local function calculateMeshSize(p3, p4) --[[ line: 52 ]]
	-- upvalues: getEditableMeshFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref), analyticsModule (ref)
	local t = {
		fieldName = "MeshId",
		fullName = p3:GetFullName(),
		contentId = p3.MeshId,
		context = p3.Name
	}
	local var20, var21 = getEditableMeshFromContextModule(p3, "MeshId", p4)
	
	if not var20 then
		return false, {
			string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", t.fullName)
		}
	end
	t.editableMesh = var21
	local var22, var23 = pcallDeferredModule(function() --[[ line: 76 ]]
		-- upvalues: getMeshSizeModule (copy), t (ref)
		return getMeshSizeModule(t)
	end, p4)
	
	if var22 then
		return true, nil, var23
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartMeshBounds_FailedToLoadMesh, nil, p4)
	
	if p4.isServer then
		error("Failed to read mesh")
	end
	return false, { "Failed to read mesh" }
end

local function validateInternal(p5, p6) --[[ line: 94 ]]
	-- upvalues: calculateMeshSize (ref), getExpectedPartSizeModule (ref), failureReasonsAccumulatorModule (ref), validateWrapTargetComparison (ref), analyticsModule (ref)
	local currentTime = tick()
	local var25, var26, var27 = calculateMeshSize(p5, p6)
	
	if var25 and var27 then
		local var28 = failureReasonsAccumulatorModule.new()
		var28:updateReasons(validateWrapTargetComparison(getExpectedPartSizeModule(p5, p6) / var27, p5, p6))
		analyticsModule.recordScriptTime(script.Name, currentTime, p6)
		
		return var28:getFinalResults()
	end
	return var25, var26
end

return function(p7, p8) --[[ line: 115 | named "validateBodyPartMeshBounds" ]]
	-- upvalues: constantsModule (ref), validateInternal (ref), failureReasonsAccumulatorModule (ref)
	local assetTypeEnum = p8.assetTypeEnum
	local var29 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	
	if Enum.AssetType.DynamicHead == assetTypeEnum then
		return validateInternal(p7, p8)
	end
	local var30 = failureReasonsAccumulatorModule.new()
	
	for i in pairs(var29.subParts) do
		local var31 = p7:FindFirstChild(i)
		assert(var31)
		var30:updateReasons(validateInternal(var31, p8))
	end
	return var30:getFinalResults()
end