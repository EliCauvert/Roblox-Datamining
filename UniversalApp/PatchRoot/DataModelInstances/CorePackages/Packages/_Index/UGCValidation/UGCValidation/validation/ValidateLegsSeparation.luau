local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local flags = parent.flags
local getFFlagUGCValidateLegFullBodySeparationModule = require(flags.getFFlagUGCValidateLegFullBodySeparation)
local getFStringUGCValidateLegHipAttachmentRangeModule = require(flags.GetFStringUGCValidateLegHipAttachmentRange)
local getFStringUGCValidateAllowedLegOverlapMultiplierModule = require(flags.GetFStringUGCValidateAllowedLegOverlapMultiplier)
local util = parent.util
local _ = require(util.Types)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local boundsDataUtilsModule = require(util.BoundsDataUtils)
local boundsCalculatorModule = require(util.BoundsCalculator)
local t = {}

local function validateAttachmentPosition(p0, p1) --[[ line: 23 ]]
	-- upvalues: getFStringUGCValidateLegHipAttachmentRangeModule (ref)
	if p1 == Enum.AssetType.RightLeg then
		local var12 = p0.RightUpperLeg.Size.X * getFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if var12 < p0.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X then
			return false, {
				string.format("RightUpperLeg.RightHipRigAttachment.CFrame.Position.X is %.2f and cannot be greater than %.2f. Please fix the Attachment.", p0.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X, var12)
			}
		end
	elseif p1 == Enum.AssetType.LeftLeg then
		local var13 = -p0.LeftUpperLeg.Size.X * getFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if p0.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X < var13 then
			return false, {
				string.format("LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X is %.2f and cannot be less than %.2f. Please fix the Attachment.", p0.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X, var13)
			}
		end
	end
	return true
end

function t.validateAsset(value, p2) --[[ line: 54 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), validateAttachmentPosition (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p2.assetTypeEnum
	assert(assetTypeEnum)
	
	if assetTypeEnum ~= Enum.AssetType.RightLeg and assetTypeEnum ~= Enum.AssetType.LeftLeg then
		return true
	end
	local var15 = failureReasonsAccumulatorModule.new()
	var15:updateReasons(validateAttachmentPosition(value, assetTypeEnum))
	
	if not var15:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLegsSeparation_InvalidAttachmentPosition, nil, p2)
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var15:getFinalResults()
end

local function calculateBounds(p3, p4) --[[ line: 83 ]]
	-- upvalues: boundsDataUtilsModule (ref)
	local t = {}
	
	for i, v in p4 do
		t = boundsDataUtilsModule.combineBounds(t, p3[v].boundsData)
	end
	return t
end

local function validateFullBodyInternal(p5, p6) --[[ line: 91 ]]
	-- upvalues: boundsCalculatorModule (ref), calculateBounds (ref), constantsModule (ref), boundsDataUtilsModule (ref), getFStringUGCValidateAllowedLegOverlapMultiplierModule (ref)
	local var17, var18, var19 = boundsCalculatorModule.calculateIndividualFullBodyPartsData(p5, p6, nil, false)
	
	if not var17 then
		return false, var18
	end
	local var20 = calculateBounds(var19, {
		constantsModule.NAMED_R15_BODY_PARTS.LeftUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftFoot
	})
	local var21 = boundsDataUtilsModule.calculateBoundsCenters(var20)
	local var22 = boundsDataUtilsModule.calculateBoundsDimensions(var20)
	local var23 = calculateBounds(var19, {
		constantsModule.NAMED_R15_BODY_PARTS.RightUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightFoot
	})
	local var24 = boundsDataUtilsModule.calculateBoundsCenters(var23)
	local var25 = boundsDataUtilsModule.calculateBoundsDimensions(var23)
	
	if not var21 or not var22 or (not var24 or not var25) then
		return true
	end
	local var26 = (var22.X + var25.X) * 0.5 - (var24.X - var21.X)
	
	if var26 <= 0 then
		return true
	end
	local var27 = var22.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	local var28 = var25.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	
	if var27 < var26 or var28 < var26 then
		return false, {
			string.format("The legs overlap by %.2f studs on the x axis. %.2f is the left leg maximum. %.2f is the right leg maximum. Please adjust the legs to reduce overlap.", var26, var27, var28)
		}
	end
	return true
end

function t.validateFullBody(p7, p8) --[[ line: 144 ]]
	-- upvalues: getFFlagUGCValidateLegFullBodySeparationModule (ref), failureReasonsAccumulatorModule (ref), validateFullBodyInternal (ref), analyticsModule (ref)
	if not getFFlagUGCValidateLegFullBodySeparationModule() then
		return true
	end
	local currentTime = tick()
	local var30 = failureReasonsAccumulatorModule.new()
	var30:updateReasons(validateFullBodyInternal(p7, p8))
	
	if not var30:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLegsSeparation_LegsOverlap, nil, p8)
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p8)
	
	return var30:getFinalResults()
end

return t