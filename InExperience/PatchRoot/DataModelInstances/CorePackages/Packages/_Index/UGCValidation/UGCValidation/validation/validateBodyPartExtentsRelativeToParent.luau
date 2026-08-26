local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local t = {
	[Enum.AssetType.Torso] = true,
	[Enum.AssetType.LeftArm] = true,
	[Enum.AssetType.RightArm] = true,
	[Enum.AssetType.RightLeg] = true,
	[Enum.AssetType.LeftLeg] = true
}
local t_1 = { UpperTorso = true }
local t_2 = {
	[Enum.AssetType.LeftLeg] = true,
	[Enum.AssetType.RightLeg] = true
}

local function reportFailure_lowerAboveUpper(p1, p2, p3, p4)
	-- upvalues: analyticsModule (ref)
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyAttPosRelativeToParent_PartAboveParent, nil, p4)
	
	return false, {
		string.format("%s cannot extend above %s. You can adjust how the parts are put together by moving %s", p2.Name, p1.Name, p3)
	}
end

local function reportFailure_upperBelowLower(p1, p2, p3, p4)
	-- upvalues: analyticsModule (ref)
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyAttPosRelativeToParent_ParentBelowPart, nil, p4)
	
	return false, {
		string.format("%s cannot extend below %s. You can adjust how the parts are put together by moving %s", p1.Name, p2.Name, p3)
	}
end

local t_3 = {
	validateSinglePartBasedOnBBoxes = function(p1, p2, p3, p4, p5)
		-- upvalues: failureReasonsAccumulatorModule (ref), reportFailure_lowerAboveUpper (ref), reportFailure_upperBelowLower (ref)
		local var1 = failureReasonsAccumulatorModule.new()
		local boundsData = p3[p1.Name].boundsData
		local boundsData_1 = p3[p2.Name].boundsData
		
		if boundsData_1.maxOverall and boundsData.maxOverall and boundsData.maxOverall.Y < boundsData_1.maxOverall.Y then
			var1:updateReasons(reportFailure_lowerAboveUpper(p1, p2, p4, p5))
		end
		if boundsData.minOverall and boundsData_1.minOverall and boundsData.minOverall.Y < boundsData_1.minOverall.Y then
			var1:updateReasons(reportFailure_upperBelowLower(p1, p2, p4, p5))
		end
		return var1:getFinalResults()
	end,
	validateSinglePartBasedOnAttachmentYPos = function(p1, p2, p3, p4)
		-- upvalues: failureReasonsAccumulatorModule (ref), r15plusUtilsModule (ref), getExpectedPartSizeModule (ref), getAttachmentCFrameInPartSpaceModule (ref), reportFailure_lowerAboveUpper (ref), reportFailure_upperBelowLower (ref)
		local var1 = failureReasonsAccumulatorModule.new()
		local var2 = p2:FindFirstChild(p3, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		local var3 = p1:FindFirstChild(p3, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var2)
		assert(var3)
		local var4 = getExpectedPartSizeModule(p2, p4)
		local var5 = getExpectedPartSizeModule(p1, p4)
		local position = getAttachmentCFrameInPartSpaceModule(var2).Position
		local position_1 = getAttachmentCFrameInPartSpaceModule(var3).Position
		local y = (var4 / 2 - position).Y
		local y_1 = (var4 / 2 + position).Y
		local y_2 = (var5 / 2 + position_1).Y
		
		if (var5 / 2 - position_1).Y < y then
			var1:updateReasons(reportFailure_lowerAboveUpper(p1, p2, p3, p4))
		end
		if y_1 < y_2 then
			var1:updateReasons(reportFailure_upperBelowLower(p1, p2, p3, p4))
		end
		return var1:getFinalResults()
	end
}

function t_3.runValidation(p1, p2)
	-- upvalues: constantsModule (ref), t (ref), boundsCalculatorModule (ref), failureReasonsAccumulatorModule (ref), t_1 (ref), t_3 (ref), t_2 (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p2.assetTypeEnum
	assert(assetTypeEnum)
	local var1 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	assert(var1)
	
	if not t[assetTypeEnum] then
		return true
	end
	local var2, var3, var4 = boundsCalculatorModule.calculateIndividualAssetPartsData(p1, p2)
	
	if not var2 then
		return false, var3
	end
	assert(var4)
	local var5 = failureReasonsAccumulatorModule.new()
	
	for i, v in pairs(var1.subParts) do
		local var6 = constantsModule.BODYPART_TO_PARENT[i]
		
		if var6 ~= nil then
			local var7 = p1:FindFirstChild(i)
			local var8 = p1:FindFirstChild(var6)
			assert(var7)
			assert(var8)
			local var9 = var8
			local var10 = var7
			
			if t_1[i] then
				var9 = var7
				var10 = var8
			end
			local name = v.rigAttachmentToParent.name
			local var11, var12 = t_3.validateSinglePartBasedOnBBoxes(var9, var10, var4, name, p2)
			var5:updateReasons(var11, var12)
			
			if var11 and t_2[assetTypeEnum] then
				var5:updateReasons(t_3.validateSinglePartBasedOnAttachmentYPos(var9, var10, name, p2))
			end
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var5:getFinalResults()
end

return t_3