local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidateCurveAnimRotationSpeedModule = require(parent.flags.getFFlagUGCValidateCurveAnimRotationSpeed)
local getFIntUGCValidateMaxAnimationFPSModule = require(parent.flags.getFIntUGCValidateMaxAnimationFPS)
local getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule = require(parent.flags.getFIntUGCValidationMaxAnimationRotationSpeedPerSecond)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = {
	validationEnumsModule.SharedDataMember.curveAnimations,
	validationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p0, p1)
	-- upvalues: getFFlagUGCValidateCurveAnimRotationSpeedModule (ref), getFIntUGCValidateMaxAnimationFPSModule (ref), getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (ref), errorSourceStringsModule (ref)
	if not getFFlagUGCValidateCurveAnimRotationSpeedModule() then return end
	local animFrames = p1.curveAnimComputedFrames.animFrames
	local var7 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
	local var8 = getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule()
	local var9 = var8 / getFIntUGCValidateMaxAnimationFPSModule()
	local t = {}
	
	for i, v in animFrames do
		for i_1, v_1 in v do
			local var11 = t[i_1]
			
			if var11 then
				local degrees = math.deg(math.abs(v_1:AngleBetween(var11)))
				
				if var9 < degrees then
					p0:fail(errorSourceStringsModule.Keys.CurveAnim_RotationTooFast, {
						time = string.format("%.2f", (i - 1) * var7),
						bodyPart = i_1,
						speed = string.format("%.2f", degrees * getFIntUGCValidateMaxAnimationFPSModule()),
						maxSpeed = tostring(var8)
					})
					
					return
				end
			end
		end
		t = v
	end
end

return t