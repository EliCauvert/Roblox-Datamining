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

function t.run(p1, p2)
	-- upvalues: getFFlagUGCValidateCurveAnimRotationSpeedModule (ref), getFIntUGCValidateMaxAnimationFPSModule (ref), getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (ref), errorSourceStringsModule (ref)
	if not getFFlagUGCValidateCurveAnimRotationSpeedModule() then return end
	local animFrames = p2.curveAnimComputedFrames.animFrames
	local var1 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
	local var2 = getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule()
	local var3 = var2 / getFIntUGCValidateMaxAnimationFPSModule()
	local t = {}
	
	for i, v in animFrames do
		for i_1, v_1 in v do
			local var4 = t[i_1]
			
			if var4 then
				local degrees = math.deg(math.abs(v_1:AngleBetween(var4)))
				
				if var3 < degrees then
					p1:fail(errorSourceStringsModule.Keys.CurveAnim_RotationTooFast, {
						time = string.format("%.2f", (i - 1) * var1),
						bodyPart = i_1,
						speed = string.format("%.2f", degrees * getFIntUGCValidateMaxAnimationFPSModule()),
						maxSpeed = tostring(var2)
					})
					
					return
				end
			end
		end
		t = v
	end
end

return t