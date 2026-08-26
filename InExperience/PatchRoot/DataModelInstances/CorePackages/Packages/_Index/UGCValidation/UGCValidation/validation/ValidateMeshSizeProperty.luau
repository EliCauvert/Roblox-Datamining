local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local analyticsModule = require(parent.Analytics)
local util = parent.util
local floatEqualsModule = require(parent.util.floatEquals)
local _ = require(util.Types)
local pcallDeferredModule = require(util.pcallDeferred)
local getMeshSizeModule = require(util.getMeshSize)
local getEditableMeshFromContextModule = require(util.getEditableMeshFromContext)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local t = {}

local function reportFailure(p1, p2, p3, p4)
	-- upvalues: analyticsModule (ref)
	if p4 and p3.isServer ~= nil and p3.isServer then
		error(p1)
	end
	analyticsModule.reportFailure(p2, nil, p3)
	
	return false, { p1 }
end

local function _(p1, p2)
	-- upvalues: floatEqualsModule (ref)
	return floatEqualsModule(p1.X, p2.X, 0.00001) and (floatEqualsModule(p1.Y, p2.Y, 0.00001) and floatEqualsModule(p1.Z, p2.Z, 0.00001))
end

local function calculateMeshSize(p1, p2)
	-- upvalues: getEditableMeshFromContextModule (ref), reportFailure (ref), analyticsModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref)
	local t = {
		fieldName = "MeshId",
		fullName = p1:GetFullName(),
		contentId = p1.MeshId,
		context = p1.Name
	}
	local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p2)
	
	if not var1 then
		return reportFailure(string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", p1.Name), analyticsModule.ErrorType.validateMeshSizeProperty_FailedToLoadMesh, p2, false)
	end
	t.editableMesh = var2
	local var3, var4 = pcallDeferredModule(function()
		-- upvalues: getMeshSizeModule (copy), t (ref)
		return getMeshSizeModule(t)
	end, p2)
	
	if var3 then
		return true, nil, var4
	end
	return reportFailure(string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", p1.Name), analyticsModule.ErrorType.validateMeshSizeProperty_FailedToLoadMesh, p2, true)
end

local function validateInternal(p1, p2)
	-- upvalues: calculateMeshSize (ref), floatEqualsModule (ref), reportFailure (ref), analyticsModule (ref)
	local currentTime = tick()
	local var1, var2, var3 = calculateMeshSize(p1, p2)
	
	if not var1 or not var3 then
		return var1, var2
	end
	local meshSize = p1.MeshSize
	
	if floatEqualsModule(meshSize.X, var3.X, 0.00001) and (floatEqualsModule(meshSize.Y, var3.Y, 0.00001) and floatEqualsModule(meshSize.Z, var3.Z, 0.00001)) then
		analyticsModule.recordScriptTime(script.Name, currentTime, p2)
		
		return true
	end
	return reportFailure(string.format("Calculated mesh size for %s does not match MeshSize property value", p1.Name), analyticsModule.ErrorType.validateMeshSizeProperty_Mismatch, p2, false)
end

function t.validateSingleMeshPart(p1, p2)
	-- upvalues: validateInternal (ref)
	return if p2.allowEditableInstances then true else validateInternal(p1, p2)
end

function t.validateBodyAsset(value, p1)
	-- upvalues: validateInternal (ref), analyticsModule (ref), failureReasonsAccumulatorModule (ref), constantsModule (ref)
	local currentTime = tick()
	
	if p1.allowEditableInstances then
		return true
	end
	local assetTypeEnum = p1.assetTypeEnum
	
	if Enum.AssetType.DynamicHead == assetTypeEnum then
		local var1, var2 = validateInternal(value, p1)
		analyticsModule.recordScriptTime(script.Name, currentTime, p1)
		
		return var1, var2
	end
	local var3 = failureReasonsAccumulatorModule.new()
	
	for i in constantsModule.ASSET_TYPE_INFO[assetTypeEnum].subParts do
		local var4 = value:FindFirstChild(i)
		assert(var4)
		var3:updateReasons(validateInternal(var4, p1))
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p1)
	
	return var3:getFinalResults()
end

return t