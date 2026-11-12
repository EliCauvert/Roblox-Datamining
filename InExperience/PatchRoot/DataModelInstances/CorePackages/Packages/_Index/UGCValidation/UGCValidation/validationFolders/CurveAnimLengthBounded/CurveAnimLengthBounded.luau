local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFStringUGCValidateCurveAnimationMinLengthModule = require(Parent.flags.GetFStringUGCValidateCurveAnimationMinLength)
local GetFStringUGCValidationMaxAnimationLengthModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationLength)
local GetFFlagUGCValidateAQEmoteDurationModule = require(Parent.flags.getFFlagUGCValidateAQEmoteDuration)
local CurveAnimLengthBoundedModule = { categories = {} }

if not require(Parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)() or not GetFFlagUGCValidateAQEmoteDurationModule() then
	table.insert(CurveAnimLengthBoundedModule.categories, ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION)
end
table.insert(CurveAnimLengthBoundedModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
CurveAnimLengthBoundedModule.requiredData = {
	ValidationEnumsModule.SharedDataMember.curveAnimations,
	ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
CurveAnimLengthBoundedModule.expectedFailures = {}
CurveAnimLengthBoundedModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimLengthBoundedModule.run(p1, p2)
	-- upvalues: GetFStringUGCValidateCurveAnimationMinLengthModule (copy), GetFStringUGCValidationMaxAnimationLengthModule (copy), ErrorSourceStringsModule (copy)
	local AnimLength = p2.curveAnimComputedFrames.animLength
	local AsNumberResult = GetFStringUGCValidateCurveAnimationMinLengthModule.asNumber()
	
	if AnimLength <= AsNumberResult or GetFStringUGCValidationMaxAnimationLengthModule.asNumber() < AnimLength then
		p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidLength, {
			minLength = tostring(AsNumberResult),
			maxLength = GetFStringUGCValidationMaxAnimationLengthModule.asString()
		})
	end
end

return CurveAnimLengthBoundedModule