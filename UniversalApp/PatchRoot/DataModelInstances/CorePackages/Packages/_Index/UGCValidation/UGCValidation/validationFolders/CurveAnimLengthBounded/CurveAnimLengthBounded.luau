local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFStringUGCValidateCurveAnimationMinLengthModule = require(parent.flags.GetFStringUGCValidateCurveAnimationMinLength)
local getFStringUGCValidationMaxAnimationLengthModule = require(parent.flags.GetFStringUGCValidationMaxAnimationLength)
local t = { categories = {} }

if not require(parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)() or not require(parent.flags.getFFlagUGCValidateAQEmoteDuration)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.EMOTE_ANIMATION)
end
table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
t.requiredData = {
	validationEnumsModule.SharedDataMember.curveAnimations,
	validationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p1, p2)
	-- upvalues: getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), errorSourceStringsModule (ref)
	local animLength = p2.curveAnimComputedFrames.animLength
	local var1 = getFStringUGCValidateCurveAnimationMinLengthModule.asNumber()
	
	if animLength <= var1 or getFStringUGCValidationMaxAnimationLengthModule.asNumber() < animLength then
		p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidLength, {
			minLength = tostring(var1),
			maxLength = getFStringUGCValidationMaxAnimationLengthModule.asString()
		})
	end
end

return t