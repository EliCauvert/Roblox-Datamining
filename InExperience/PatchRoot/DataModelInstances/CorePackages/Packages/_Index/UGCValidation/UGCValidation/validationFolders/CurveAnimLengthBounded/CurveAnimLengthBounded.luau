local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidateCurveAnimMinTimeFixModule = require(parent.flags.getFFlagUGCValidateCurveAnimMinTimeFix)
local getFStringUGCValidateCurveAnimationMinLengthModule = require(parent.flags.GetFStringUGCValidateCurveAnimationMinLength)
local getFStringUGCValidationMaxAnimationLengthModule = require(parent.flags.GetFStringUGCValidationMaxAnimationLength)
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

function t.run(p0, p1) --[[ line: 27 ]]
	-- upvalues: getFFlagUGCValidateCurveAnimMinTimeFixModule (ref), getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), errorSourceStringsModule (ref)
	local animLength = p1.curveAnimComputedFrames.animLength
	local var7 = if getFFlagUGCValidateCurveAnimMinTimeFixModule() then getFStringUGCValidateCurveAnimationMinLengthModule.asNumber() else 0
	
	if animLength <= var7 or getFStringUGCValidationMaxAnimationLengthModule.asNumber() < animLength then
		p0:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidLength, {
			minLength = tostring(var7),
			maxLength = getFStringUGCValidationMaxAnimationLengthModule.asString()
		})
	end
end

return t