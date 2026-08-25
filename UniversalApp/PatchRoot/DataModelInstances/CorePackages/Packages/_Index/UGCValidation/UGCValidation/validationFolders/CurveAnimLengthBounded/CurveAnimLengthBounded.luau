local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidateCurveAnimMinTimeFixModule = require(parent.flags.getFFlagUGCValidateCurveAnimMinTimeFix)
local getFStringUGCValidateCurveAnimationMinLengthModule = require(parent.flags.GetFStringUGCValidateCurveAnimationMinLength)
local getFStringUGCValidationMaxAnimationLengthModule = require(parent.flags.GetFStringUGCValidationMaxAnimationLength)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local t = { categories = {} }

if not require(parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)() or not require(parent.flags.getFFlagUGCValidateAQEmoteDuration)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.EMOTE_ANIMATION)
end
if getFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = {
	validationEnumsModule.SharedDataMember.curveAnimations,
	validationEnumsModule.SharedDataMember.curveAnimComputedFrames
}

function t.fflag()
	-- upvalues: getFFlagUGCValidateMigrateCurveAnimModule (ref)
	return getFFlagUGCValidateMigrateCurveAnimModule()
end

t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p0, p1)
	-- upvalues: getFFlagUGCValidateCurveAnimMinTimeFixModule (ref), getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), errorSourceStringsModule (ref)
	local animLength = p1.curveAnimComputedFrames.animLength
	local var8 = if getFFlagUGCValidateCurveAnimMinTimeFixModule() then getFStringUGCValidateCurveAnimationMinLengthModule.asNumber() else 0
	
	if animLength <= var8 or getFStringUGCValidationMaxAnimationLengthModule.asNumber() < animLength then
		p0:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidLength, {
			minLength = tostring(var8),
			maxLength = getFStringUGCValidationMaxAnimationLengthModule.asString()
		})
	end
end

return t