-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

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

local function reportFailure(p0, p1, p2, p3) --[[ line: 21 ]]
	-- upvalues: analyticsModule (ref)
	if p3 and p2.isServer ~= nil and p2.isServer then
		error(p0)
	end
	analyticsModule.reportFailure(p1, nil, p2)
	
	return false, { p0 }
end

local function _(p4, p5) --[[ line: 40 | named "vector3Equals" ]]
	-- upvalues: floatEqualsModule (ref)
	return floatEqualsModule(p4.X, p5.X, 0.00001) and (floatEqualsModule(p4.Y, p5.Y, 0.00001) and floatEqualsModule(p4.Z, p5.Z, 0.00001))
end

local function calculateMeshSize(p6, p7) --[[ line: 45 ]]
	-- upvalues: getEditableMeshFromContextModule (ref), reportFailure (ref), analyticsModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref)
	local t = {
		fieldName = "MeshId",
		fullName = p6:GetFullName(),
		contentId = p6.MeshId,
		context = p6.Name
	}
	local var12, var13 = getEditableMeshFromContextModule(p6, "MeshId", p7)
	
	if not var12 then
		return reportFailure(string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", p6.Name), analyticsModule.ErrorType.validateMeshSizeProperty_FailedToLoadMesh, p7, false)
	end
	t.editableMesh = var13
	local var14, var15 = pcallDeferredModule(function() --[[ line: 68 ]]
		-- upvalues: getMeshSizeModule (copy), t (ref)
		return getMeshSizeModule(t)
	end, p7)
	
	if var14 then
		return true, nil, var15
	end
	return reportFailure(string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", p6.Name), analyticsModule.ErrorType.validateMeshSizeProperty_FailedToLoadMesh, p7, true)
end

local function validateInternal(p8, p9) --[[ line: 83 ]]
	-- upvalues: calculateMeshSize (ref), floatEqualsModule (ref), reportFailure (ref), analyticsModule (ref)
	local currentTime = tick()
	local var17, var18, var19 = calculateMeshSize(p8, p9)
	
	if not var17 or not var19 then
		return var17, var18
	end
	local meshSize = p8.MeshSize
	
	if floatEqualsModule(meshSize.X, var19.X, 0.00001) and (floatEqualsModule(meshSize.Y, var19.Y, 0.00001) and floatEqualsModule(meshSize.Z, var19.Z, 0.00001)) then
		analyticsModule.recordScriptTime(script.Name, currentTime, p9)
		
		return true
	end
	return reportFailure(string.format("Calculated mesh size for %s does not match MeshSize property value", p8.Name), analyticsModule.ErrorType.validateMeshSizeProperty_Mismatch, p9, false)
end

function t.validateSingleMeshPart(p10, p11) --[[ line: 107 ]]
	-- upvalues: validateInternal (ref)
	return if p11.allowEditableInstances then true else validateInternal(p10, p11)
end

function t.validateBodyAsset(value, p12) --[[ line: 117 ]]
	-- upvalues: validateInternal (ref), analyticsModule (ref), failureReasonsAccumulatorModule (ref), constantsModule (ref)
	local currentTime = tick()
	
	if p12.allowEditableInstances then
		return true
	end
	local assetTypeEnum = p12.assetTypeEnum
	
	if Enum.AssetType.DynamicHead == assetTypeEnum then
		local var21, var22 = validateInternal(value, p12)
		analyticsModule.recordScriptTime(script.Name, currentTime, p12)
		
		return var21, var22
	end
	local var23 = failureReasonsAccumulatorModule.new()
	
	for i in constantsModule.ASSET_TYPE_INFO[assetTypeEnum].subParts do
		local var24 = value:FindFirstChild(i)
		assert(var24)
		var23:updateReasons(validateInternal(var24, p12))
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p12)
	
	return var23:getFinalResults()
end

return t