local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local CanBeNormalizedModule = require(Parent.util.canBeNormalized)
local PrettyPrintVector3Module = require(Parent.util.prettyPrintVector3)
local UGCValidatePoseDegFromXYPlane = game:DefineFastInt("UGCValidatePoseDegFromXYPlane", 20)
local UGCValidatePoseArmMinDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseArmMinDegFromXVectorOnXYPlane", -90)
local UGCValidatePoseArmMaxDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseArmMaxDegFromXVectorOnXYPlane", 30)
local UGCValidatePoseLegMinDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseLegMinDegFromXVectorOnXYPlane", -93)
local UGCValidatePoseLegMaxDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseLegMaxDegFromXVectorOnXYPlane", -60)

local function validateAngleFromXYPlane(p1, AssetType, Vector, p2) --[[ Line: 38 ]]
	-- upvalues: UGCValidatePoseDegFromXYPlane (copy), ErrorSourceStringsModule (copy)
	local Degrees = math.deg((math.acos((Vector:Dot(p2)))))
	
	if UGCValidatePoseDegFromXYPlane < Degrees then
		p1:fail(ErrorSourceStringsModule.Keys.Pose_AngleFromXYPlane, {
			assetName = AssetType.Name,
			angle = string.format("%d", Degrees),
			limit = string.format("%d", UGCValidatePoseDegFromXYPlane)
		})
	end
end

local function validateAngleFromWorldXVectorOnXYPlane(p1, AssetType, Vector, p2, UGCValidatePoseArmMinDegFromXVectorOnXYPlane, UGCValidatePoseArmMaxDegFromXVectorOnXYPlane) --[[ Line: 54 ]]
	-- upvalues: ErrorSourceStringsModule (copy), PrettyPrintVector3Module (copy)
	local Degrees = math.deg((math.acos((Vector:Dot(p2)))))
	
	if Vector.Y <= 0 then
		Degrees = -Degrees
	end
	if Degrees < UGCValidatePoseArmMinDegFromXVectorOnXYPlane or UGCValidatePoseArmMaxDegFromXVectorOnXYPlane < Degrees then
		p1:fail(ErrorSourceStringsModule.Keys.Pose_AngleOnXYPlane, {
			assetName = AssetType.Name,
			angle = string.format("%d", Degrees),
			xVector = PrettyPrintVector3Module(p2),
			minAngle = string.format("%d", UGCValidatePoseArmMinDegFromXVectorOnXYPlane),
			maxAngle = string.format("%d", UGCValidatePoseArmMaxDegFromXVectorOnXYPlane)
		})
	end
end

local function _(p1) --[[ Line: 76 | Named "getAssetTypeFromUploadEnum" ]]
	return if p1.uploadEnum and p1.uploadEnum.assetType then p1.uploadEnum.assetType else nil
end

return {
	categories = { ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS },
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 83 ]]
		-- upvalues: AssetCalculatorModule (copy), ErrorSourceStringsModule (copy), CanBeNormalizedModule (copy), validateAngleFromXYPlane (copy), UGCValidatePoseArmMinDegFromXVectorOnXYPlane (copy), UGCValidatePoseArmMaxDegFromXVectorOnXYPlane (copy), UGCValidatePoseLegMinDegFromXVectorOnXYPlane (copy), UGCValidatePoseLegMaxDegFromXVectorOnXYPlane (copy), validateAngleFromWorldXVectorOnXYPlane (copy)
		local RootInstance = p2.rootInstance
		local AssetType = if p2.uploadEnum and p2.uploadEnum.assetType then p2.uploadEnum.assetType else nil
		
		if not AssetType then return end
		if AssetType ~= Enum.AssetType.LeftArm and AssetType ~= Enum.AssetType.RightArm and AssetType ~= Enum.AssetType.LeftLeg and AssetType ~= Enum.AssetType.RightLeg then return end
		local AssetCFrame = AssetCalculatorModule.calculateAssetCFrame(AssetType, RootInstance)
		
		if not AssetCFrame then
			p1:fail(ErrorSourceStringsModule.Keys.Pose_CFrameCalculationFailed, { assetName = AssetType.Name })
			
			return
		end
		local UnitDelta = AssetCFrame.YVector.Unit - vector.create(0, 0, 1) * AssetCFrame.YVector.Unit:Dot(vector.create(0, 0, 1))
		
		if not CanBeNormalizedModule(UnitDelta) then
			p1:fail(ErrorSourceStringsModule.Keys.Pose_PointingAlongZVector, { assetName = AssetType.Name })
			
			return
		end
		local Negated = -UnitDelta.Unit
		validateAngleFromXYPlane(p1, AssetType, Negated, -AssetCFrame.YVector.Unit)
		local v1: vector = if AssetType == Enum.AssetType.RightArm or AssetType == Enum.AssetType.RightLeg then vector.create(1, 0, 0) else vector.create(-1, -0, -0)
		local UGCValidatePoseArmMinDegFromXVectorOnXYPlane1 = nil
		local UGCValidatePoseArmMaxDegFromXVectorOnXYPlane1 = nil
		
		if AssetType == Enum.AssetType.RightArm or AssetType == Enum.AssetType.LeftArm then
			UGCValidatePoseArmMinDegFromXVectorOnXYPlane1 = UGCValidatePoseArmMinDegFromXVectorOnXYPlane
			UGCValidatePoseArmMaxDegFromXVectorOnXYPlane1 = UGCValidatePoseArmMaxDegFromXVectorOnXYPlane
		else
			UGCValidatePoseArmMinDegFromXVectorOnXYPlane1 = UGCValidatePoseLegMinDegFromXVectorOnXYPlane
			UGCValidatePoseArmMaxDegFromXVectorOnXYPlane1 = UGCValidatePoseLegMaxDegFromXVectorOnXYPlane
		end
		validateAngleFromWorldXVectorOnXYPlane(p1, AssetType, Negated, v1, UGCValidatePoseArmMinDegFromXVectorOnXYPlane1, UGCValidatePoseArmMaxDegFromXVectorOnXYPlane1)
	end
}