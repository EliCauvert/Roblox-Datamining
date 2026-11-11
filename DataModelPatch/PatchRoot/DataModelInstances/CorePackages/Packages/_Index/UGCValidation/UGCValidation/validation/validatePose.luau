local Parent = script.Parent.Parent
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local CanBeNormalizedModule = require(Parent.util.canBeNormalized)
local PrettyPrintVector3Module = require(Parent.util.prettyPrintVector3)
local _ = require(Parent.util.Types)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local UGCValidatePoseDegFromXYPlane = game:DefineFastInt("UGCValidatePoseDegFromXYPlane", 20)
local UGCValidatePoseArmMinDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseArmMinDegFromXVectorOnXYPlane", -90)
local UGCValidatePoseArmMaxDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseArmMaxDegFromXVectorOnXYPlane", 30)
local UGCValidatePoseLegMinDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseLegMinDegFromXVectorOnXYPlane", -93)
local UGCValidatePoseLegMaxDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseLegMaxDegFromXVectorOnXYPlane", -60)

local function validateAngleFromXYPlane(AssetTypeEnum, Vector, p1)
	-- upvalues: FailureReasonsAccumulatorModule (copy), UGCValidatePoseDegFromXYPlane (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local Degrees = math.deg((math.acos((Vector:Dot(p1)))))
	
	if UGCValidatePoseDegFromXYPlane < Degrees then
		NewFailureReasonsAccumulator:updateReasons(false, {
			string.format("%s is at a %d degree angle from the X,Y plane, it must be within %d degrees. Make sure the character is in I pose, A pose, or T pose", AssetTypeEnum.Name, Degrees, UGCValidatePoseDegFromXYPlane)
		})
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

local function validateAngleFromWorldXVectorOnXYPlane(AssetTypeEnum, Vector, p1, UGCValidatePoseArmMinDegFromXVectorOnXYPlane, UGCValidatePoseArmMaxDegFromXVectorOnXYPlane)
	-- upvalues: FailureReasonsAccumulatorModule (copy), PrettyPrintVector3Module (copy)
	local Degrees = math.deg((math.acos((Vector:Dot(p1)))))
	
	if Vector.Y <= 0 then
		Degrees = -Degrees
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if Degrees < UGCValidatePoseArmMinDegFromXVectorOnXYPlane or UGCValidatePoseArmMaxDegFromXVectorOnXYPlane < Degrees then
		NewFailureReasonsAccumulator:updateReasons(false, {
			string.format("%s is at a %d angle of the [%s] vector on the X,Y plane, it must be between %d and %d degrees. Make sure the character is in I pose, A pose, or T pose", AssetTypeEnum.Name, Degrees, PrettyPrintVector3Module(p1), UGCValidatePoseArmMinDegFromXVectorOnXYPlane, UGCValidatePoseArmMaxDegFromXVectorOnXYPlane)
		})
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

return function(p1, p2)
	-- upvalues: AssetCalculatorModule (copy), CanBeNormalizedModule (copy), FailureReasonsAccumulatorModule (copy), validateAngleFromXYPlane (copy), UGCValidatePoseArmMinDegFromXVectorOnXYPlane (copy), UGCValidatePoseArmMaxDegFromXVectorOnXYPlane (copy), UGCValidatePoseLegMinDegFromXVectorOnXYPlane (copy), UGCValidatePoseLegMaxDegFromXVectorOnXYPlane (copy), validateAngleFromWorldXVectorOnXYPlane (copy)
	local AssetTypeEnum = p2.assetTypeEnum
	assert(AssetTypeEnum)
	
	if AssetTypeEnum ~= Enum.AssetType.LeftArm and AssetTypeEnum ~= Enum.AssetType.RightArm and AssetTypeEnum ~= Enum.AssetType.LeftLeg and AssetTypeEnum ~= Enum.AssetType.RightLeg then
		return true
	end
	local AssetCFrame = AssetCalculatorModule.calculateAssetCFrame(AssetTypeEnum, p1)
	
	if not AssetCFrame then
		return false, {
			string.format("Failed to calculate %s asset CFrame. Make sure the character is in I pose, A pose, or T pose, and the parts are not all in the same position", AssetTypeEnum.Name)
		}
	end
	local UnitDelta = AssetCFrame.YVector.Unit - vector.create(0, 0, 1) * AssetCFrame.YVector.Unit:Dot(vector.create(0, 0, 1))
	
	if not CanBeNormalizedModule(UnitDelta) then
		return false, {
			string.format("%s is pointing along the world Z vector. Make sure the character is in I pose, A pose, or T pose", AssetTypeEnum.Name)
		}
	end
	local Negated = -UnitDelta.Unit
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	NewFailureReasonsAccumulator:updateReasons(validateAngleFromXYPlane(AssetTypeEnum, Negated, -AssetCFrame.YVector.Unit))
	local v1: vector = if AssetTypeEnum == Enum.AssetType.RightArm or AssetTypeEnum == Enum.AssetType.RightLeg then vector.create(1, 0, 0) else vector.create(-1, -0, -0)
	local UGCValidatePoseArmMaxDegFromXVectorOnXYPlane1 = nil
	local UGCValidatePoseArmMinDegFromXVectorOnXYPlane1 = nil
	
	if AssetTypeEnum == Enum.AssetType.RightArm or AssetTypeEnum == Enum.AssetType.LeftArm then
		UGCValidatePoseArmMinDegFromXVectorOnXYPlane1 = UGCValidatePoseArmMinDegFromXVectorOnXYPlane
		UGCValidatePoseArmMaxDegFromXVectorOnXYPlane1 = UGCValidatePoseArmMaxDegFromXVectorOnXYPlane
	else
		UGCValidatePoseArmMinDegFromXVectorOnXYPlane1 = UGCValidatePoseLegMinDegFromXVectorOnXYPlane
		UGCValidatePoseArmMaxDegFromXVectorOnXYPlane1 = UGCValidatePoseLegMaxDegFromXVectorOnXYPlane
	end
	NewFailureReasonsAccumulator:updateReasons(validateAngleFromWorldXVectorOnXYPlane(AssetTypeEnum, Negated, v1, UGCValidatePoseArmMinDegFromXVectorOnXYPlane1, UGCValidatePoseArmMaxDegFromXVectorOnXYPlane1))
	
	return NewFailureReasonsAccumulator:getFinalResults()
end