-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local assetCalculatorModule = require(parent.util.AssetCalculator)
local canBeNormalizedModule = require(parent.util.canBeNormalized)
local prettyPrintVector3Module = require(parent.util.prettyPrintVector3)
local _ = require(parent.util.Types)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local UGCValidatePoseDegFromXYPlane = game:DefineFastInt("UGCValidatePoseDegFromXYPlane", 20)
local UGCValidatePoseArmMinDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseArmMinDegFromXVectorOnXYPlane", -90)
local UGCValidatePoseArmMaxDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseArmMaxDegFromXVectorOnXYPlane", 30)
local UGCValidatePoseLegMinDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseLegMinDegFromXVectorOnXYPlane", -93)
local UGCValidatePoseLegMaxDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseLegMaxDegFromXVectorOnXYPlane", -60)

local function validateAngleFromXYPlane(vectorA, vectorB, p0) --[[ line: 24 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), UGCValidatePoseDegFromXYPlane (ref)
	local var11 = failureReasonsAccumulatorModule.new()
	local degrees = math.deg(math.acos(vectorB:Dot(p0)))
	
	if UGCValidatePoseDegFromXYPlane < degrees then
		var11:updateReasons(false, {
			string.format("%s is at a %d degree angle from the X,Y plane, it must be within %d degrees. Make sure the character is in I pose, A pose, or T pose", vectorA.Name, degrees, UGCValidatePoseDegFromXYPlane)
		})
	end
	return var11:getFinalResults()
end

local function validateAngleFromWorldXVectorOnXYPlane(vectorA, vectorB, p1, p2, p3) --[[ line: 45 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), prettyPrintVector3Module (ref)
	local degrees = math.deg(math.acos(vectorB:Dot(p1)))
	
	if vectorB.Y <= 0 then
		degrees = -degrees
	end
	local var14 = failureReasonsAccumulatorModule.new()
	
	if degrees < p2 or p3 < degrees then
		var14:updateReasons(false, {
			string.format("%s is at a %d angle of the [%s] vector on the X,Y plane, it must be between %d and %d degrees. Make sure the character is in I pose, A pose, or T pose", vectorA.Name, degrees, prettyPrintVector3Module(p1), p2, p3)
		})
	end
	return var14:getFinalResults()
end

return function(p4, p5) --[[ line: 72 | named "validatePose" ]]
	-- upvalues: assetCalculatorModule (ref), canBeNormalizedModule (ref), failureReasonsAccumulatorModule (ref), validateAngleFromXYPlane (ref), UGCValidatePoseArmMinDegFromXVectorOnXYPlane (ref), UGCValidatePoseArmMaxDegFromXVectorOnXYPlane (ref), UGCValidatePoseLegMinDegFromXVectorOnXYPlane (ref), UGCValidatePoseLegMaxDegFromXVectorOnXYPlane (ref), validateAngleFromWorldXVectorOnXYPlane (ref)
	local assetTypeEnum = p5.assetTypeEnum
	assert(assetTypeEnum)
	
	if assetTypeEnum ~= Enum.AssetType.LeftArm and assetTypeEnum ~= Enum.AssetType.RightArm and (assetTypeEnum ~= Enum.AssetType.LeftLeg and assetTypeEnum ~= Enum.AssetType.RightLeg) then
		return true
	end
	local var15 = assetCalculatorModule.calculateAssetCFrame(assetTypeEnum, p4)
	
	if not var15 then
		return false, {
			string.format("Failed to calculate %s asset CFrame. Make sure the character is in I pose, A pose, or T pose, and the parts are not all in the same position", assetTypeEnum.Name)
		}
	end
	local var16 = var15.YVector.Unit - Vector3.new(0, 0, 1) * var15.YVector.Unit:Dot(Vector3.new(0, 0, 1))
	
	if not canBeNormalizedModule(var16) then
		return false, {
			string.format("%s is pointing along the world Z vector. Make sure the character is in I pose, A pose, or T pose", assetTypeEnum.Name)
		}
	end
	local var20, var21
	local var17 = -var16.Unit
	local var18 = failureReasonsAccumulatorModule.new()
	var18:updateReasons(validateAngleFromXYPlane(assetTypeEnum, var17, -var15.YVector.Unit))
	local var19 = if assetTypeEnum == Enum.AssetType.RightArm or assetTypeEnum == Enum.AssetType.RightLeg then Vector3.new(1, 0, 0) else Vector3.new(-1, 0, 0)
	local _ = nil
	local _ = nil
	
	if assetTypeEnum == Enum.AssetType.RightArm or assetTypeEnum == Enum.AssetType.LeftArm then
		var20 = UGCValidatePoseArmMinDegFromXVectorOnXYPlane
		var21 = UGCValidatePoseArmMaxDegFromXVectorOnXYPlane
	else
		var20 = UGCValidatePoseLegMinDegFromXVectorOnXYPlane
		var21 = UGCValidatePoseLegMaxDegFromXVectorOnXYPlane
	end
	var18:updateReasons(validateAngleFromWorldXVectorOnXYPlane(assetTypeEnum, var17, var19, var20, var21))
	
	return var18:getFinalResults()
end