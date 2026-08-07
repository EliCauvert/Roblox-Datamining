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

local function reportFailure_lowerAboveUpper(p0, p1, p2, p3) --[[ line: 40 ]]
	-- upvalues: analyticsModule (ref)
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyAttPosRelativeToParent_PartAboveParent, nil, p3)
	
	return false, {
		string.format("%s cannot extend above %s. You can adjust how the parts are put together by moving %s", p1.Name, p0.Name, p2)
	}
end

local function reportFailure_upperBelowLower(p4, p5, p6, p7) --[[ line: 63 ]]
	-- upvalues: analyticsModule (ref)
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyAttPosRelativeToParent_ParentBelowPart, nil, p7)
	
	return false, {
		string.format("%s cannot extend below %s. You can adjust how the parts are put together by moving %s", p4.Name, p5.Name, p6)
	}
end

local t_3 = {
	validateSinglePartBasedOnBBoxes = function(p8, p9, p10, p11, p12) --[[ line: 86 ]]
		-- upvalues: failureReasonsAccumulatorModule (ref), reportFailure_lowerAboveUpper (ref), reportFailure_upperBelowLower (ref)
		local var13 = failureReasonsAccumulatorModule.new()
		local boundsData = p10[p8.Name].boundsData
		local boundsData_1 = p10[p9.Name].boundsData
		
		if boundsData_1.maxOverall and boundsData.maxOverall and boundsData.maxOverall.Y < boundsData_1.maxOverall.Y then
			var13:updateReasons(reportFailure_lowerAboveUpper(p8, p9, p11, p12))
		end
		if boundsData.minOverall and boundsData_1.minOverall and boundsData.minOverall.Y < boundsData_1.minOverall.Y then
			var13:updateReasons(reportFailure_upperBelowLower(p8, p9, p11, p12))
		end
		return var13:getFinalResults()
	end,
	validateSinglePartBasedOnAttachmentYPos = function(p13, p14, p15, p16) --[[ line: 112 ]]
		-- upvalues: failureReasonsAccumulatorModule (ref), r15plusUtilsModule (ref), getExpectedPartSizeModule (ref), getAttachmentCFrameInPartSpaceModule (ref), reportFailure_lowerAboveUpper (ref), reportFailure_upperBelowLower (ref)
		local var14 = failureReasonsAccumulatorModule.new()
		local var15 = p14:FindFirstChild(p15, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		local var16 = p13:FindFirstChild(p15, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var15)
		assert(var16)
		local var17 = getExpectedPartSizeModule(p14, p16)
		local var18 = getExpectedPartSizeModule(p13, p16)
		local position = getAttachmentCFrameInPartSpaceModule(var15).Position
		local position_1 = getAttachmentCFrameInPartSpaceModule(var16).Position
		local y = (var17 / 2 - position).Y
		local y_1 = (var17 / 2 + position).Y
		local y_2 = (var18 / 2 + position_1).Y
		
		if (var18 / 2 - position_1).Y < y then
			var14:updateReasons(reportFailure_lowerAboveUpper(p13, p14, p15, p16))
		end
		if y_1 < y_2 then
			var14:updateReasons(reportFailure_upperBelowLower(p13, p14, p15, p16))
		end
		return var14:getFinalResults()
	end
}

function t_3.runValidation(p17, p18) --[[ line: 150 ]]
	-- upvalues: constantsModule (ref), t (ref), boundsCalculatorModule (ref), failureReasonsAccumulatorModule (ref), t_1 (ref), t_3 (ref), t_2 (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p18.assetTypeEnum
	assert(assetTypeEnum)
	local var20 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	assert(var20)
	
	if not t[assetTypeEnum] then
		return true
	end
	local var21, var22, var23 = boundsCalculatorModule.calculateIndividualAssetPartsData(p17, p18)
	
	if not var21 then
		return false, var22
	end
	assert(var23)
	local var24 = failureReasonsAccumulatorModule.new()
	
	for i, v in pairs(var20.subParts) do
		local var25 = constantsModule.BODYPART_TO_PARENT[i]
		
		if var25 ~= nil then
			local var26 = p17:FindFirstChild(i)
			local var27 = p17:FindFirstChild(var25)
			assert(var26)
			assert(var27)
			local var28 = var27
			local var29 = var26
			
			if t_1[i] then
				var28 = var26
				var29 = var27
			end
			local name = v.rigAttachmentToParent.name
			local var30, var31 = t_3.validateSinglePartBasedOnBBoxes(var28, var29, var23, name, p18)
			var24:updateReasons(var30, var31)
			
			if var30 and t_2[assetTypeEnum] then
				var24:updateReasons(t_3.validateSinglePartBasedOnAttachmentYPos(var28, var29, name, p18))
			end
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p18)
	
	return var24:getFinalResults()
end

return t_3