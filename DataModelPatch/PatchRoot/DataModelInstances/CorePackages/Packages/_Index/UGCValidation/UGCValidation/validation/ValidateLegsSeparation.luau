local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local Flags = Parent.flags
local GetFFlagUGCValidateLegFullBodySeparationModule = require(Flags.getFFlagUGCValidateLegFullBodySeparation)
local GetFStringUGCValidateLegHipAttachmentRangeModule = require(Flags.GetFStringUGCValidateLegHipAttachmentRange)
local GetFStringUGCValidateAllowedLegOverlapMultiplierModule = require(Flags.GetFStringUGCValidateAllowedLegOverlapMultiplier)
local Util = Parent.util
local _ = require(Util.Types)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local BoundsDataUtilsModule = require(Util.BoundsDataUtils)
local BoundsCalculatorModule = require(Util.BoundsCalculator)

local function validateAttachmentPosition(p1, AssetType)
	-- upvalues: GetFStringUGCValidateLegHipAttachmentRangeModule (copy)
	if AssetType == Enum.AssetType.RightLeg then
		local ScaledX = p1.RightUpperLeg.Size.X * GetFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if ScaledX < p1.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X then
			return false, {
				string.format("RightUpperLeg.RightHipRigAttachment.CFrame.Position.X is %.2f and cannot be greater than %.2f. Please fix the Attachment.", p1.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X, ScaledX)
			}
		end
	elseif AssetType == Enum.AssetType.LeftLeg then
		local ScaledAsNumberResult = -p1.LeftUpperLeg.Size.X * GetFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if p1.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X < ScaledAsNumberResult then
			return false, {
				string.format("LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X is %.2f and cannot be less than %.2f. Please fix the Attachment.", p1.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X, ScaledAsNumberResult)
			}
		end
	end
	return true
end

local function calculateBounds(p1, List)
	-- upvalues: BoundsDataUtilsModule (copy)
	local CombineBoundsResult = {}
	
	for _, value in List do
		CombineBoundsResult = BoundsDataUtilsModule.combineBounds(CombineBoundsResult, p1[value].boundsData)
	end
	return CombineBoundsResult
end

local function validateFullBodyInternal(p2, p3)
	-- upvalues: BoundsCalculatorModule (copy), calculateBounds (copy), ConstantsModule (copy), BoundsDataUtilsModule (copy), GetFStringUGCValidateAllowedLegOverlapMultiplierModule (copy)
	local IndividualFullBodyPartsData, IndividualFullBodyPartsData2, IndividualFullBodyPartsData3 = BoundsCalculatorModule.calculateIndividualFullBodyPartsData(p2, p3, nil, false)
	
	if not IndividualFullBodyPartsData then
		return false, IndividualFullBodyPartsData2
	end
	local Bounds = calculateBounds(IndividualFullBodyPartsData3, {
		ConstantsModule.NAMED_R15_BODY_PARTS.LeftUpperLeg,
		ConstantsModule.NAMED_R15_BODY_PARTS.LeftLowerLeg,
		ConstantsModule.NAMED_R15_BODY_PARTS.LeftFoot
	})
	local BoundsCenters = BoundsDataUtilsModule.calculateBoundsCenters(Bounds)
	local BoundsDimensions = BoundsDataUtilsModule.calculateBoundsDimensions(Bounds)
	local Bounds1 = calculateBounds(IndividualFullBodyPartsData3, {
		ConstantsModule.NAMED_R15_BODY_PARTS.RightUpperLeg,
		ConstantsModule.NAMED_R15_BODY_PARTS.RightLowerLeg,
		ConstantsModule.NAMED_R15_BODY_PARTS.RightFoot
	})
	local BoundsCenters1 = BoundsDataUtilsModule.calculateBoundsCenters(Bounds1)
	local BoundsDimensions1 = BoundsDataUtilsModule.calculateBoundsDimensions(Bounds1)
	
	if not BoundsCenters or not BoundsDimensions or not BoundsCenters1 or not BoundsDimensions1 then
		return true
	end
	local XDelta = (BoundsDimensions.X + BoundsDimensions1.X) * 0.5 - (BoundsCenters1.X - BoundsCenters.X)
	
	if XDelta <= 0 then
		return true
	end
	local ScaledX = BoundsDimensions.X * GetFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	local ScaledX1 = BoundsDimensions1.X * GetFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	
	if ScaledX < XDelta or ScaledX1 < XDelta then
		return false, {
			string.format("The legs overlap by %.2f studs on the x axis. %.2f is the left leg maximum. %.2f is the right leg maximum. Please adjust the legs to reduce overlap.", XDelta, ScaledX, ScaledX1)
		}
	else
		return true
	end
end

return {
	validateAsset = function(p2, p3)
		-- upvalues: FailureReasonsAccumulatorModule (copy), validateAttachmentPosition (copy), AnalyticsModule (copy)
		local CurrentTime = tick()
		local AssetTypeEnum = p3.assetTypeEnum
		assert(AssetTypeEnum)
		
		if AssetTypeEnum ~= Enum.AssetType.RightLeg and AssetTypeEnum ~= Enum.AssetType.LeftLeg then
			return true
		end
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		NewFailureReasonsAccumulator:updateReasons(validateAttachmentPosition(p2, AssetTypeEnum))
		
		if not NewFailureReasonsAccumulator:getFinalResults() then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLegsSeparation_InvalidAttachmentPosition, nil, p3)
		end
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p3)
		
		return NewFailureReasonsAccumulator:getFinalResults()
	end,
	validateFullBody = function(p2, p3)
		-- upvalues: GetFFlagUGCValidateLegFullBodySeparationModule (copy), FailureReasonsAccumulatorModule (copy), validateFullBodyInternal (copy), AnalyticsModule (copy)
		if not GetFFlagUGCValidateLegFullBodySeparationModule() then
			return true
		end
		local CurrentTime = tick()
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		NewFailureReasonsAccumulator:updateReasons(validateFullBodyInternal(p2, p3))
		
		if not NewFailureReasonsAccumulator:getFinalResults() then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLegsSeparation_LegsOverlap, nil, p3)
		end
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p3)
		
		return NewFailureReasonsAccumulator:getFinalResults()
	end
}