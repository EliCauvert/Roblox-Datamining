local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local assetCalculatorModule = require(parent.util.AssetCalculator)
local canBeNormalizedModule = require(parent.util.canBeNormalized)
local prettyPrintVector3Module = require(parent.util.prettyPrintVector3)
local getFFlagUGCValidateMigratePoseBlockingModule = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking)
local UGCValidatePoseDegFromXYPlane = game:DefineFastInt("UGCValidatePoseDegFromXYPlane", 20)
local UGCValidatePoseArmMinDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseArmMinDegFromXVectorOnXYPlane", -90)
local UGCValidatePoseArmMaxDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseArmMaxDegFromXVectorOnXYPlane", 30)
local UGCValidatePoseLegMinDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseLegMinDegFromXVectorOnXYPlane", -93)
local UGCValidatePoseLegMaxDegFromXVectorOnXYPlane = game:DefineFastInt("UGCValidatePoseLegMaxDegFromXVectorOnXYPlane", -60)
local t = {
	categories = { validationEnumsModule.UploadCategory.TORSO_AND_LIMBS },
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = getFFlagUGCValidateMigratePoseBlockingModule,
	expectedFailures = {}
}

local function validateAngleFromXYPlane(vectorA, vectorB, p1, p2)
	-- upvalues: UGCValidatePoseDegFromXYPlane (ref), errorSourceStringsModule (ref)
	local degrees = math.deg(math.acos(p1:Dot(p2)))
	
	if UGCValidatePoseDegFromXYPlane < degrees then
		vectorA:fail(errorSourceStringsModule.Keys.Pose_AngleFromXYPlane, {
			assetName = vectorB.Name,
			angle = string.format("%d", degrees),
			limit = string.format("%d", UGCValidatePoseDegFromXYPlane)
		})
	end
end

local function validateAngleFromWorldXVectorOnXYPlane(vectorA, vectorB, p1, p2, p3, p4)
	-- upvalues: errorSourceStringsModule (ref), prettyPrintVector3Module (ref)
	local degrees = math.deg(math.acos(p1:Dot(p2)))
	
	if p1.Y <= 0 then
		degrees = -degrees
	end
	if degrees < p3 or p4 < degrees then
		vectorA:fail(errorSourceStringsModule.Keys.Pose_AngleOnXYPlane, {
			assetName = vectorB.Name,
			angle = string.format("%d", degrees),
			xVector = prettyPrintVector3Module(p2),
			minAngle = string.format("%d", p3),
			maxAngle = string.format("%d", p4)
		})
	end
end

local function _(value)
	return if value.uploadEnum and value.uploadEnum.assetType then value.uploadEnum.assetType else nil
end

function t.run(p1, p2)
	-- upvalues: assetCalculatorModule (ref), errorSourceStringsModule (ref), canBeNormalizedModule (ref), validateAngleFromXYPlane (ref), UGCValidatePoseArmMinDegFromXVectorOnXYPlane (ref), UGCValidatePoseArmMaxDegFromXVectorOnXYPlane (ref), UGCValidatePoseLegMinDegFromXVectorOnXYPlane (ref), UGCValidatePoseLegMaxDegFromXVectorOnXYPlane (ref), validateAngleFromWorldXVectorOnXYPlane (ref)
	local rootInstance = p2.rootInstance
	local var1 = if p2.uploadEnum and p2.uploadEnum.assetType then p2.uploadEnum.assetType else nil
	
	if not var1 then return end
	if var1 ~= Enum.AssetType.LeftArm and var1 ~= Enum.AssetType.RightArm and (var1 ~= Enum.AssetType.LeftLeg and var1 ~= Enum.AssetType.RightLeg) then return end
	local var2 = assetCalculatorModule.calculateAssetCFrame(var1, rootInstance)
	
	if not var2 then
		p1:fail(errorSourceStringsModule.Keys.Pose_CFrameCalculationFailed, { assetName = var1.Name })
		
		return
	end
	local var3 = var2.YVector.Unit - Vector3.new(0, 0, 1) * var2.YVector.Unit:Dot(Vector3.new(0, 0, 1))
	
	if not canBeNormalizedModule(var3) then
		p1:fail(errorSourceStringsModule.Keys.Pose_PointingAlongZVector, { assetName = var1.Name })
		
		return
	end
	local var4, var5
	local var6 = -var3.Unit
	validateAngleFromXYPlane(p1, var1, var6, -var2.YVector.Unit)
	local var7 = if var1 == Enum.AssetType.RightArm or var1 == Enum.AssetType.RightLeg then Vector3.new(1, 0, 0) else Vector3.new(-1, 0, 0)
	local _ = nil
	local _ = nil
	
	if var1 == Enum.AssetType.RightArm or var1 == Enum.AssetType.LeftArm then
		var4 = UGCValidatePoseArmMinDegFromXVectorOnXYPlane
		var5 = UGCValidatePoseArmMaxDegFromXVectorOnXYPlane
	else
		var4 = UGCValidatePoseLegMinDegFromXVectorOnXYPlane
		var5 = UGCValidatePoseLegMaxDegFromXVectorOnXYPlane
	end
	validateAngleFromWorldXVectorOnXYPlane(p1, var1, var6, var7, var4, var5)
end

return t