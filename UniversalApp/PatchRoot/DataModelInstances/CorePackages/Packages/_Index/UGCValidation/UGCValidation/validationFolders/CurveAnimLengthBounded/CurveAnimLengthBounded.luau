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

local function validateCurveAnimClip(p1, p2)
	-- upvalues: GetFStringUGCValidateCurveAnimationMinLengthModule (copy), GetFStringUGCValidationMaxAnimationLengthModule (copy), ErrorSourceStringsModule (copy)
	local FullName = p2.animation and p2.animation:GetFullName()
	local AnimLength = p2.animLength
	local AsNumberResult = GetFStringUGCValidateCurveAnimationMinLengthModule.asNumber()
	
	if AnimLength <= AsNumberResult or GetFStringUGCValidationMaxAnimationLengthModule.asNumber() < AnimLength then
		local config = {
			minLength = tostring(AsNumberResult),
			maxLength = GetFStringUGCValidationMaxAnimationLengthModule.asString()
		}
		
		if FullName then
			config.animationName = FullName
		end
		p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidLength, config, p2.animation)
	end
end

function CurveAnimLengthBoundedModule.run(p1, p2)
	-- upvalues: validateCurveAnimClip (copy)
	for _, curveAnimComputedFrame in p2.curveAnimComputedFrames do
		validateCurveAnimClip(p1, curveAnimComputedFrame)
	end
end

return CurveAnimLengthBoundedModule