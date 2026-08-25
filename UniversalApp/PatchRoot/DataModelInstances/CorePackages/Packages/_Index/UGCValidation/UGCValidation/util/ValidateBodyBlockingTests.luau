local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local util = parent.util
local _ = require(util.Types)
local floatEqualsModule = require(util.floatEquals)
local getExpectedPartSizeModule = require(util.getExpectedPartSize)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local t = {
	validateMeshMin = function(a, b)
		-- upvalues: floatEqualsModule (ref)
		local var1 = true
		local var2 = ""
		
		for i, v in { "X", "Y", "Z" } do
			if floatEqualsModule(a[v], 0, 0.0001) then
				var2 = (if #var2 > 0 then var2 .. ". " else "") .. "Size on " .. v .. " axis is zero"
				var1 = false
			end
		end
		if var1 then
			return true
		end
		return false, {
			"Render mesh for " .. b .. ": " .. var8 .. ". Increase the size of the mesh"
		}
	end
}

function t.validateInternal(p1, p2, p3)
	-- upvalues: failureReasonsAccumulatorModule (ref), getExpectedPartSizeModule (ref), t (ref), analyticsModule (ref), r15plusUtilsModule (ref)
	local var1 = failureReasonsAccumulatorModule.new()
	local var2, var3 = t.validateMeshMin(getExpectedPartSizeModule(p1, p2, true), p1.Name)
	var1:updateReasons(var2, var3)
	
	if not var2 and p3 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyBlockingTests_ZeroMeshSize, nil, p2)
	end
	if r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		for i, v in r15plusUtilsModule.getNameWhitelistOfClassInSchema(r15plusUtilsModule.getAvatarBoneSchema(p1.Name), "Attachment") do
			if v and not p1:FindFirstChild(i, true) then
				var1:updateReasons(false, { `Missing Required attachment {i}` })
			end
		end
	end
	return var1:getFinalResults()
end

function t.validateAll(p1, p2)
	-- upvalues: t (ref), analyticsModule (ref)
	local currentTime = tick()
	local var1 = true
	
	for i, v in p1 do
		assert(v:IsA("MeshPart"))
		
		if not t.validateInternal(v, p2, false) then
			var1 = false
			break
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var1
end

function t.validate(p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), t (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p2.assetTypeEnum
	local var1 = failureReasonsAccumulatorModule.new()
	local var2 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	
	if Enum.AssetType.DynamicHead == assetTypeEnum then
		var1:updateReasons(t.validateInternal(p1, p2, true))
	else
		for i in pairs(var2.subParts) do
			local var3 = p1:FindFirstChild(i)
			assert(var3)
			var1:updateReasons(t.validateInternal(var3, p2, true))
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var1:getFinalResults()
end

return t