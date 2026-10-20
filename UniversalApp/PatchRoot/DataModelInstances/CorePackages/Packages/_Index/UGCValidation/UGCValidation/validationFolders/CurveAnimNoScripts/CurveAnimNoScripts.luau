local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: ErrorSourceStringsModule (copy)
		for _, curveAnimation in p2.curveAnimations do
			for _, descendant in curveAnimation:GetDescendants() do
				if descendant:IsA("Script") or descendant:IsA("ModuleScript") then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_ContainsScripts)
					break
				end
			end
		end
	end
}