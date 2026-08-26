local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p1, p2)
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

return t