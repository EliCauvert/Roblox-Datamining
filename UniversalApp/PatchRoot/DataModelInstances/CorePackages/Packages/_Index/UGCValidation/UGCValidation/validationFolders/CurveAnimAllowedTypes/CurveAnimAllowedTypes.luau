local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidateAddObjectValueToAcceptableTypesModule = require(parent.flags.getFFlagUGCValidateAddObjectValueToAcceptableTypes)
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
local list = {
	"MarkerCurve", "AnimationRigData", "Folder", "Vector3Curve",
	"EulerRotationCurve", "FloatCurve"
}

if getFFlagUGCValidateAddObjectValueToAcceptableTypesModule() then
	table.insert(list, "ObjectValue")
end
function t.run(p0, p1) --[[ line: 38 ]]
	-- upvalues: list (ref), errorSourceStringsModule (ref)
	local var6
	for i, v in p1.curveAnimations do
		for i_1, v_1 in v:GetDescendants() do
			var6 = false
			
			for i_2, v_2 in list do
				if v_1:IsA(v_2) then
					var6 = true
					break
				end
			end
			if not var6 then
				p0:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidInstanceTypes, { allowedTypes = table.concat(list, ", ") })
				
				return
			end
		end
	end
end

return t