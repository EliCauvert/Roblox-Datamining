local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFFlagUGCValidateCurveAnimMinTimeFixModule = require(Parent.flags.getFFlagUGCValidateCurveAnimMinTimeFix)
local GetFStringUGCValidateCurveAnimationMinLengthModule = require(Parent.flags.GetFStringUGCValidateCurveAnimationMinLength)
local GetFStringUGCValidationMaxAnimationLengthModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationLength)
local CurveAnimLengthBoundedModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimLengthBoundedModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimLengthBoundedModule.requiredData = {
	ValidationEnumsModule.SharedDataMember.curveAnimations,
	ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
CurveAnimLengthBoundedModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimLengthBoundedModule.expectedFailures = {}
CurveAnimLengthBoundedModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimLengthBoundedModule.run(p1, p2)
	-- upvalues: GetFFlagUGCValidateCurveAnimMinTimeFixModule (copy), GetFStringUGCValidateCurveAnimationMinLengthModule (copy), GetFStringUGCValidationMaxAnimationLengthModule (copy), ErrorSourceStringsModule (copy)
	local AnimLength = p2.curveAnimComputedFrames.animLength
	local AsNumberResult = if GetFFlagUGCValidateCurveAnimMinTimeFixModule() then GetFStringUGCValidateCurveAnimationMinLengthModule.asNumber() else 0
	
	if AnimLength <= AsNumberResult or GetFStringUGCValidationMaxAnimationLengthModule.asNumber() < AnimLength then
		p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidLength, {
			minLength = tostring(AsNumberResult),
			maxLength = GetFStringUGCValidationMaxAnimationLengthModule.asString()
		})
	end
end

return CurveAnimLengthBoundedModule