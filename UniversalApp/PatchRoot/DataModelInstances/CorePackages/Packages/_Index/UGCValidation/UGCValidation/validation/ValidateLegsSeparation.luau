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

local function validateAttachmentPosition(p1, p2)
	-- upvalues: getFStringUGCValidateLegHipAttachmentRangeModule (ref)
	if p2 == Enum.AssetType.RightLeg then
		local var1 = p1.RightUpperLeg.Size.X * getFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if var1 < p1.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X then
			return false, {
				string.format("RightUpperLeg.RightHipRigAttachment.CFrame.Position.X is %.2f and cannot be greater than %.2f. Please fix the Attachment.", p1.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X, var1)
			}
		end
	elseif p2 == Enum.AssetType.LeftLeg then
		local var2 = -p1.LeftUpperLeg.Size.X * getFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if p1.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X < var2 then
			return false, {
				string.format("LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X is %.2f and cannot be less than %.2f. Please fix the Attachment.", p1.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X, var2)
			}
		end
	end
	return true
end

function t.validateAsset(value, p1)
	-- upvalues: failureReasonsAccumulatorModule (ref), validateAttachmentPosition (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p1.assetTypeEnum
	assert(assetTypeEnum)
	
	if assetTypeEnum ~= Enum.AssetType.RightLeg and assetTypeEnum ~= Enum.AssetType.LeftLeg then
		return true
	end
	local var1 = failureReasonsAccumulatorModule.new()
	var1:updateReasons(validateAttachmentPosition(value, assetTypeEnum))
	
	if not var1:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLegsSeparation_InvalidAttachmentPosition, nil, p1)
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p1)
	
	return var1:getFinalResults()
end

local function calculateBounds(p1, p2)
	-- upvalues: boundsDataUtilsModule (ref)
	local t = {}
	
	for i, v in p2 do
		t = boundsDataUtilsModule.combineBounds(t, p1[v].boundsData)
	end
	return t
end

local function validateFullBodyInternal(p3, p4)
	-- upvalues: boundsCalculatorModule (ref), calculateBounds (ref), constantsModule (ref), boundsDataUtilsModule (ref), getFStringUGCValidateAllowedLegOverlapMultiplierModule (ref)
	local var1, var2, var3 = boundsCalculatorModule.calculateIndividualFullBodyPartsData(p3, p4, nil, false)
	
	if not var1 then
		return false, var2
	end
	local var4 = calculateBounds(var3, {
		constantsModule.NAMED_R15_BODY_PARTS.LeftUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftFoot
	})
	local var5 = boundsDataUtilsModule.calculateBoundsCenters(var4)
	local var6 = boundsDataUtilsModule.calculateBoundsDimensions(var4)
	local var7 = calculateBounds(var3, {
		constantsModule.NAMED_R15_BODY_PARTS.RightUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightFoot
	})
	local var8 = boundsDataUtilsModule.calculateBoundsCenters(var7)
	local var9 = boundsDataUtilsModule.calculateBoundsDimensions(var7)
	
	if not var5 or not var6 or (not var8 or not var9) then
		return true
	end
	local var10 = (var6.X + var9.X) * 0.5 - (var8.X - var5.X)
	
	if var10 <= 0 then
		return true
	end
	local var11 = var6.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	local var12 = var9.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	
	if var11 < var10 or var12 < var10 then
		return false, {
			string.format("The legs overlap by %.2f studs on the x axis. %.2f is the left leg maximum. %.2f is the right leg maximum. Please adjust the legs to reduce overlap.", var10, var11, var12)
		}
	end
	return true
end

function t.validateFullBody(p3, p4)
	-- upvalues: getFFlagUGCValidateLegFullBodySeparationModule (ref), failureReasonsAccumulatorModule (ref), validateFullBodyInternal (ref), analyticsModule (ref)
	if not getFFlagUGCValidateLegFullBodySeparationModule() then
		return true
	end
	local currentTime = tick()
	local var1 = failureReasonsAccumulatorModule.new()
	var1:updateReasons(validateFullBodyInternal(p3, p4))
	
	if not var1:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLegsSeparation_LegsOverlap, nil, p4)
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p4)
	
	return var1:getFinalResults()
end

return t