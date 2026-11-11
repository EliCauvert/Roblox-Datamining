local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule = require(Parent.flags.getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessage)
local GetFStringUGCValidationMaxAnimationDeltasModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationDeltas)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)
local CurveAnimSpeedBoundedModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimSpeedBoundedModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimSpeedBoundedModule.requiredData = {
	ValidationEnumsModule.SharedDataMember.curveAnimations,
	ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
CurveAnimSpeedBoundedModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimSpeedBoundedModule.expectedFailures = {}
CurveAnimSpeedBoundedModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimSpeedBoundedModule.run(p1, p2)
	-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFStringUGCValidationMaxAnimationDeltasModule (copy), GetFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule (copy), ErrorSourceStringsModule (copy)
	local AnimFrames = p2.curveAnimComputedFrames.animFrames
	local v1 = 1 / GetFIntUGCValidateMaxAnimationFPSModule()
	local v2 = v1 / 0.03333333333333333
	local ScaledAsNumberResult = GetFStringUGCValidationMaxAnimationDeltasModule.asNumber() * v2
	local ScaledAsNumberResult1 = if GetFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then GetFStringUGCValidationMaxAnimationDeltasModule.asNumber() * 30 else nil
	local t = {}
	
	for i, animFrame in AnimFrames do
		local Distance = nil
		for BodyPart, value in animFrame do
			local Entry = t[BodyPart]
			
			if Entry then
				Distance = (value.Position - Entry.Position).Magnitude
				
				if ScaledAsNumberResult < Distance then
					if GetFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_SpeedTooFast, {
							time = string.format("%.2f", (i - 1) * v1),
							bodyPart = BodyPart,
							speed = string.format("%.2f", Distance / v2 * 30),
							maxSpeed = string.format("%.2f", ScaledAsNumberResult1)
						})
						break
					else
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_SpeedTooFastLegacy, {
							bodyPart = BodyPart,
							maxMovement = GetFStringUGCValidationMaxAnimationDeltasModule.asString()
						})
						break
					end
				end
			end
		end
		t = animFrame
	end
end

return CurveAnimSpeedBoundedModule