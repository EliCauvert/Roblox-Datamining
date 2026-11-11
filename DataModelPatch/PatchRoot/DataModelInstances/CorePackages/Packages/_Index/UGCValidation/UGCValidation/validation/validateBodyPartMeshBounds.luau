local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ValidateMeshComparisonModule = require(Parent.validation.validateMeshComparison)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local GetMeshInfoModule = require(Parent.util.getMeshInfo)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)

local function validateWrapTargetComparison(Scale, Object, p1)
	-- upvalues: GetMeshInfoModule (copy), ConstantsModule (copy), ValidateMeshComparisonModule (copy)
	local MeshInfoModule, MeshInfoModule2, MeshInfoModule3 = GetMeshInfoModule(Object, ConstantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p1)
	
	if not MeshInfoModule then
		return false, MeshInfoModule2
	end
	local WrapTarget = Object:FindFirstChildWhichIsA("WrapTarget")
	assert(WrapTarget, "Missing WrapTarget child for " .. Object.Name)
	local MeshInfoModule1, MeshInfoModule2_1, MeshInfoModule3_1 = GetMeshInfoModule(WrapTarget, ConstantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p1)
	
	if MeshInfoModule1 then
		MeshInfoModule3.scale = Scale
		MeshInfoModule3_1.scale = Scale
		
		return ValidateMeshComparisonModule(MeshInfoModule3, MeshInfoModule3_1, ConstantsModule.RenderVsWrapMeshMaxDiff, p1)
	else
		return false, MeshInfoModule2_1
	end
end

local function calculateMeshSize(Object, p1)
	-- upvalues: GetEditableMeshFromContextModule (copy), PcallDeferredModule (copy), GetMeshSizeModule (copy), AnalyticsModule (copy)
	local config = {
		fieldName = "MeshId",
		fullName = Object:GetFullName(),
		contentId = Object.MeshId,
		context = Object.Name
	}
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
	
	if not MeshId then
		return false, {
			string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", config.fullName)
		}
	end
	config.editableMesh = MeshId2
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: GetMeshSizeModule (upval), config (copy)
		return GetMeshSizeModule(config)
	end, p1)
	
	if PcallDeferredModuleResult then
		return true, nil, PcallDeferredModuleResult2
	end
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartMeshBounds_FailedToLoadMesh, nil, p1)
	
	if p1.isServer then
		error("Failed to read mesh")
	end
	return false, { "Failed to read mesh" }
end

local function validateInternal(Child, p1)
	-- upvalues: calculateMeshSize (copy), GetExpectedPartSizeModule (copy), FailureReasonsAccumulatorModule (copy), validateWrapTargetComparison (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local MeshSize, MeshSize2, MeshSize3 = calculateMeshSize(Child, p1)
	
	if MeshSize and MeshSize3 then
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		NewFailureReasonsAccumulator:updateReasons(validateWrapTargetComparison(GetExpectedPartSizeModule(Child, p1) / MeshSize3, Child, p1))
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
		
		return NewFailureReasonsAccumulator:getFinalResults()
	else
		return MeshSize, MeshSize2
	end
end

return function(Object, p1)
	-- upvalues: ConstantsModule (copy), validateInternal (copy), FailureReasonsAccumulatorModule (copy)
	local AssetTypeEnum = p1.assetTypeEnum
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum]
	
	if Enum.AssetType.DynamicHead == AssetTypeEnum then
		return validateInternal(Object, p1)
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for subPart in pairs(ASSETTYPE.subParts) do
		local Child = Object:FindFirstChild(subPart)
		assert(Child)
		NewFailureReasonsAccumulator:updateReasons(validateInternal(Child, p1))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end