local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		validationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		validationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { validationEnumsModule.SharedDataMember.curveAnimations },
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: errorSourceStringsModule (ref)
		for i, v in p2.curveAnimations do
			for i_1, v_1 in v:GetDescendants() do
				if v_1:IsA("Script") or v_1:IsA("ModuleScript") then
					p1:fail(errorSourceStringsModule.Keys.CurveAnim_ContainsScripts)
					
					return
				end
			end
		end
	end
}