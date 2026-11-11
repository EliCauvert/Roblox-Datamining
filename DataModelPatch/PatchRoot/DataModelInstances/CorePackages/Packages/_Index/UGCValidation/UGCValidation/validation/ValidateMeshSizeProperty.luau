local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local AnalyticsModule = require(Parent.Analytics)
local Util = Parent.util
local FloatEqualsModule = require(Parent.util.floatEquals)
local _ = require(Util.Types)
local PcallDeferredModule = require(Util.pcallDeferred)
local GetMeshSizeModule = require(Util.getMeshSize)
local GetEditableMeshFromContextModule = require(Util.getEditableMeshFromContext)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)

local function reportFailure(Formatted, ValidateMeshSizePropertyFailedToLoadMesh, p1, p2)
	-- upvalues: AnalyticsModule (copy)
	if p2 and p1.isServer ~= nil and p1.isServer then
		error(Formatted)
	end
	AnalyticsModule.reportFailure(ValidateMeshSizePropertyFailedToLoadMesh, nil, p1)
	
	return false, { Formatted }
end

local function _(Vector, Vector1)
	-- upvalues: FloatEqualsModule (copy)
	return FloatEqualsModule(Vector.X, Vector1.X, 0.00001) and (FloatEqualsModule(Vector.Y, Vector1.Y, 0.00001) and FloatEqualsModule(Vector.Z, Vector1.Z, 0.00001))
end

local function calculateMeshSize(Object, p1)
	-- upvalues: GetEditableMeshFromContextModule (copy), reportFailure (copy), AnalyticsModule (copy), PcallDeferredModule (copy), GetMeshSizeModule (copy)
	local config = {
		fieldName = "MeshId",
		fullName = Object:GetFullName(),
		contentId = Object.MeshId,
		context = Object.Name
	}
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
	
	if not MeshId then
		return reportFailure(string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", Object.Name), AnalyticsModule.ErrorType.validateMeshSizeProperty_FailedToLoadMesh, p1, false)
	end
	config.editableMesh = MeshId2
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: GetMeshSizeModule (upval), config (copy)
		return GetMeshSizeModule(config)
	end, p1)
	
	if PcallDeferredModuleResult then
		return true, nil, PcallDeferredModuleResult2
	else
		return reportFailure(string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", Object.Name), AnalyticsModule.ErrorType.validateMeshSizeProperty_FailedToLoadMesh, p1, true)
	end
end

local function validateInternal(Child, p1)
	-- upvalues: calculateMeshSize (copy), FloatEqualsModule (copy), reportFailure (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local MeshSize, MeshSize2, MeshSize3 = calculateMeshSize(Child, p1)
	
	if not MeshSize or not MeshSize3 then
		return MeshSize, MeshSize2
	end
	local MeshSize1 = Child.MeshSize
	
	if FloatEqualsModule(MeshSize1.X, MeshSize3.X, 0.00001) and (FloatEqualsModule(MeshSize1.Y, MeshSize3.Y, 0.00001) and FloatEqualsModule(MeshSize1.Z, MeshSize3.Z, 0.00001)) then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
		
		return true
	else
		return reportFailure(string.format("Calculated mesh size for %s does not match MeshSize property value", Child.Name), AnalyticsModule.ErrorType.validateMeshSizeProperty_Mismatch, p1, false)
	end
end

return {
	validateSingleMeshPart = function(p1, p2)
		-- upvalues: validateInternal (copy)
		return if p2.allowEditableInstances then true else validateInternal(p1, p2)
	end,
	validateBodyAsset = function(Object, p1)
		-- upvalues: validateInternal (copy), AnalyticsModule (copy), FailureReasonsAccumulatorModule (copy), ConstantsModule (copy)
		local CurrentTime = tick()
		
		if p1.allowEditableInstances then
			return true
		end
		local AssetTypeEnum = p1.assetTypeEnum
		
		if Enum.AssetType.DynamicHead == AssetTypeEnum then
			local ValidateInternalResult, ValidateInternalResult2 = validateInternal(Object, p1)
			AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
			
			return ValidateInternalResult, ValidateInternalResult2
		end
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		
		for subPart in ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum].subParts do
			local Child = Object:FindFirstChild(subPart)
			assert(Child)
			NewFailureReasonsAccumulator:updateReasons(validateInternal(Child, p1))
		end
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
		
		return NewFailureReasonsAccumulator:getFinalResults()
	end
}