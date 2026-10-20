local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = { ValidationEnumsModule.UploadCategory.ANIMATION },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.curveAnimations,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: ErrorSourceStringsModule (copy)
		if p2.uploadEnum.assetType == Enum.AssetType.JumpAnimation then return end
		for _, curveAnimation in p2.curveAnimations do
			if not curveAnimation.Loop then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_LoopingNotEnabled, { animationName = curveAnimation:GetFullName() })
			end
		end
	end
}