local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function validateCurveAnimClip(p1, p2)
	-- upvalues: ErrorSourceStringsModule (copy)
	local FullName = p2.animation and p2.animation:GetFullName()
	for _, track in p2.tracks do
		if track.pos or track.rot then return end
	end
	p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NoJointManipulation, { animationName = FullName }, p2.animation)
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.curveAnimations,
		ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
	},
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p3, p4)
		-- upvalues: validateCurveAnimClip (copy)
		for _, curveAnimComputedFrame in p4.curveAnimComputedFrames do
			validateCurveAnimClip(p3, curveAnimComputedFrame)
		end
	end
}