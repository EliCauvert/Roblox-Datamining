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
		local var7 = true
		local var8 = ""
		
		for i, v in { "X", "Y", "Z" } do
			if floatEqualsModule(a[v], 0, 0.0001) then
				var8 = (if #var8 > 0 then var8 .. ". " else "") .. "Size on " .. v .. " axis is zero"
				var7 = false
			end
		end
		if var7 then
			return true
		end
		return false, {
			"Render mesh for " .. b .. ": " .. var8 .. ". Increase the size of the mesh"
		}
	end
}

function t.validateInternal(p0, p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), getExpectedPartSizeModule (ref), t (ref), analyticsModule (ref), r15plusUtilsModule (ref)
	local var9 = failureReasonsAccumulatorModule.new()
	local var10, var11 = t.validateMeshMin(getExpectedPartSizeModule(p0, p1, true), p0.Name)
	var9:updateReasons(var10, var11)
	
	if not var10 and p2 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyBlockingTests_ZeroMeshSize, nil, p1)
	end
	if r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		for i, v in r15plusUtilsModule.getNameWhitelistOfClassInSchema(r15plusUtilsModule.getAvatarBoneSchema(p0.Name), "Attachment") do
			if v and not p0:FindFirstChild(i, true) then
				var9:updateReasons(false, { `Missing Required attachment {i}` })
			end
		end
	end
	return var9:getFinalResults()
end

function t.validateAll(p3, p4)
	-- upvalues: t (ref), analyticsModule (ref)
	local currentTime = tick()
	local var13 = true
	
	for i, v in p3 do
		assert(v:IsA("MeshPart"))
		
		if not t.validateInternal(v, p4, false) then
			var13 = false
			break
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p4)
	
	return var13
end

function t.validate(p5, p6)
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), t (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p6.assetTypeEnum
	local var15 = failureReasonsAccumulatorModule.new()
	local var16 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	
	if Enum.AssetType.DynamicHead == assetTypeEnum then
		var15:updateReasons(t.validateInternal(p5, p6, true))
	else
		for i in pairs(var16.subParts) do
			local var17 = p5:FindFirstChild(i)
			assert(var17)
			var15:updateReasons(t.validateInternal(var17, p6, true))
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p6)
	
	return var15:getFinalResults()
end

return t