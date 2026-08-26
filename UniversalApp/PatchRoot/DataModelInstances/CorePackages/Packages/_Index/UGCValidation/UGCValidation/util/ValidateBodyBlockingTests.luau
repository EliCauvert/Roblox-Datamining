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
	local var3 = failureReasonsAccumulatorModule.new()
	local var4, var5 = t.validateMeshMin(getExpectedPartSizeModule(p1, p2, true), p1.Name)
	var3:updateReasons(var4, var5)
	
	if not var4 and p3 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyBlockingTests_ZeroMeshSize, nil, p2)
	end
	if r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		for i, v in r15plusUtilsModule.getNameWhitelistOfClassInSchema(r15plusUtilsModule.getAvatarBoneSchema(p1.Name), "Attachment") do
			if v and not p1:FindFirstChild(i, true) then
				var3:updateReasons(false, { `Missing Required attachment {i}` })
			end
		end
	end
	return var3:getFinalResults()
end

function t.validateAll(p4, p5)
	-- upvalues: t (ref), analyticsModule (ref)
	local currentTime = tick()
	local var6 = true
	
	for i, v in p4 do
		assert(v:IsA("MeshPart"))
		
		if not t.validateInternal(v, p5, false) then
			var6 = false
			break
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p5)
	
	return var6
end

function t.validate(p6, p7)
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), t (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p7.assetTypeEnum
	local var7 = failureReasonsAccumulatorModule.new()
	local var8 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	
	if Enum.AssetType.DynamicHead == assetTypeEnum then
		var7:updateReasons(t.validateInternal(p6, p7, true))
	else
		for i in pairs(var8.subParts) do
			local var9 = p6:FindFirstChild(i)
			assert(var9)
			var7:updateReasons(t.validateInternal(var9, p7, true))
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p7)
	
	return var7:getFinalResults()
end

return t