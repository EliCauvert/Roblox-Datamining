local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = { validationEnumsModule.UploadCategory.ANIMATION },
	requiredData = {
		validationEnumsModule.SharedDataMember.curveAnimations,
		validationEnumsModule.SharedDataMember.uploadEnum
	},
	fflag = require(parent.flags.getFFlagUGCValidateCurveAnimLoopingRequired),
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p0, p1)
		-- upvalues: errorSourceStringsModule (ref)
		if p1.uploadEnum.assetType == Enum.AssetType.JumpAnimation then return end
		for i, v in p1.curveAnimations do
			if not v.Loop then
				p0:fail(errorSourceStringsModule.Keys.CurveAnim_LoopingNotEnabled, { animationName = v:GetFullName() })
			end
		end
	end
}