-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

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

local function validateAngleFromXYPlane(vectorA, vectorB, p0, p1) --[[ line: 42 ]]
	-- upvalues: UGCValidatePoseDegFromXYPlane (ref), errorSourceStringsModule (ref)
	local degrees = math.deg(math.acos(p0:Dot(p1)))
	
	if UGCValidatePoseDegFromXYPlane < degrees then
		vectorA:fail(errorSourceStringsModule.Keys.Pose_AngleFromXYPlane, {
			assetName = vectorB.Name,
			angle = string.format("%d", degrees),
			limit = string.format("%d", UGCValidatePoseDegFromXYPlane)
		})
	end
end

local function validateAngleFromWorldXVectorOnXYPlane(vectorA, vectorB, p2, p3, p4, p5) --[[ line: 58 ]]
	-- upvalues: errorSourceStringsModule (ref), prettyPrintVector3Module (ref)
	local degrees = math.deg(math.acos(p2:Dot(p3)))
	
	if p2.Y <= 0 then
		degrees = -degrees
	end
	if degrees < p4 or p5 < degrees then
		vectorA:fail(errorSourceStringsModule.Keys.Pose_AngleOnXYPlane, {
			assetName = vectorB.Name,
			angle = string.format("%d", degrees),
			xVector = prettyPrintVector3Module(p3),
			minAngle = string.format("%d", p4),
			maxAngle = string.format("%d", p5)
		})
	end
end

local function _(value) --[[ line: 80 | named "getAssetTypeFromUploadEnum" ]]
	return if value.uploadEnum and value.uploadEnum.assetType then value.uploadEnum.assetType else nil
end

function t.run(p6, p7) --[[ line: 87 ]]
	-- upvalues: assetCalculatorModule (ref), errorSourceStringsModule (ref), canBeNormalizedModule (ref), validateAngleFromXYPlane (ref), UGCValidatePoseArmMinDegFromXVectorOnXYPlane (ref), UGCValidatePoseArmMaxDegFromXVectorOnXYPlane (ref), UGCValidatePoseLegMinDegFromXVectorOnXYPlane (ref), UGCValidatePoseLegMaxDegFromXVectorOnXYPlane (ref), validateAngleFromWorldXVectorOnXYPlane (ref)
	local rootInstance = p7.rootInstance
	local var16 = if p7.uploadEnum and p7.uploadEnum.assetType then p7.uploadEnum.assetType else nil
	
	if not var16 then return end
	if var16 ~= Enum.AssetType.LeftArm and var16 ~= Enum.AssetType.RightArm and (var16 ~= Enum.AssetType.LeftLeg and var16 ~= Enum.AssetType.RightLeg) then return end
	local var17 = assetCalculatorModule.calculateAssetCFrame(var16, rootInstance)
	
	if not var17 then
		p6:fail(errorSourceStringsModule.Keys.Pose_CFrameCalculationFailed, { assetName = var16.Name })
		
		return
	end
	local var18 = var17.YVector.Unit - Vector3.new(0, 0, 1) * var17.YVector.Unit:Dot(Vector3.new(0, 0, 1))
	
	if not canBeNormalizedModule(var18) then
		p6:fail(errorSourceStringsModule.Keys.Pose_PointingAlongZVector, { assetName = var16.Name })
		
		return
	end
	local var21, var22
	local var19 = -var18.Unit
	validateAngleFromXYPlane(p6, var16, var19, -var17.YVector.Unit)
	local var20 = if var16 == Enum.AssetType.RightArm or var16 == Enum.AssetType.RightLeg then Vector3.new(1, 0, 0) else Vector3.new(-1, 0, 0)
	local _ = nil
	local _ = nil
	
	if var16 == Enum.AssetType.RightArm or var16 == Enum.AssetType.LeftArm then
		var21 = UGCValidatePoseArmMinDegFromXVectorOnXYPlane
		var22 = UGCValidatePoseArmMaxDegFromXVectorOnXYPlane
	else
		var21 = UGCValidatePoseLegMinDegFromXVectorOnXYPlane
		var22 = UGCValidatePoseLegMaxDegFromXVectorOnXYPlane
	end
	validateAngleFromWorldXVectorOnXYPlane(p6, var16, var19, var20, var21, var22)
end

return t