local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local CurveAnimNoScriptsModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimNoScriptsModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimNoScriptsModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
CurveAnimNoScriptsModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimNoScriptsModule.expectedFailures = {}
CurveAnimNoScriptsModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimNoScriptsModule.run(p1, p2)
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

return CurveAnimNoScriptsModule