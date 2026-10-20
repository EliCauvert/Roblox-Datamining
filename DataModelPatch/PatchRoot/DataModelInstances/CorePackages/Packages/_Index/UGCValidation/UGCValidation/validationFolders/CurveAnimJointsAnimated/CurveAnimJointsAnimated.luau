local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local CurveAnimJointsAnimatedModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimJointsAnimatedModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimJointsAnimatedModule.requiredData = {
	ValidationEnumsModule.SharedDataMember.curveAnimations,
	ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
CurveAnimJointsAnimatedModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimJointsAnimatedModule.expectedFailures = {}
CurveAnimJointsAnimatedModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimJointsAnimatedModule.run(p1, p2)
	-- upvalues: ErrorSourceStringsModule (copy)
	for _, track in p2.curveAnimComputedFrames.tracks do
		if track.pos or track.rot then return end
	end
	p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NoJointManipulation)
end

return CurveAnimJointsAnimatedModule