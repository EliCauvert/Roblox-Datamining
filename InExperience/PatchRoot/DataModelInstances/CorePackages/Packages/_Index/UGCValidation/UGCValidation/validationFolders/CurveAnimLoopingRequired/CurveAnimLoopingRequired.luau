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
	run = function(p1, p2)
		-- upvalues: errorSourceStringsModule (ref)
		if p2.uploadEnum.assetType == Enum.AssetType.JumpAnimation then return end
		for i, v in p2.curveAnimations do
			if not v.Loop then
				p1:fail(errorSourceStringsModule.Keys.CurveAnim_LoopingNotEnabled, { animationName = v:GetFullName() })
			end
		end
	end
}