local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFFlagUGCValidateAddObjectValueToAcceptableTypesModule = require(Parent.flags.getFFlagUGCValidateAddObjectValueToAcceptableTypes)
local CurveAnimAllowedTypesModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimAllowedTypesModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimAllowedTypesModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
CurveAnimAllowedTypesModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimAllowedTypesModule.expectedFailures = {}
CurveAnimAllowedTypesModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}
local List = {
	"MarkerCurve", "AnimationRigData", "Folder", "Vector3Curve",
	"EulerRotationCurve", "FloatCurve"
}

if GetFFlagUGCValidateAddObjectValueToAcceptableTypesModule() then
	table.insert(List, "ObjectValue")
end
function CurveAnimAllowedTypesModule.run(p1, p2)
	-- upvalues: List (copy), ErrorSourceStringsModule (copy)
	local Flag = nil
	for _, curveAnimation in p2.curveAnimations do
		for _, descendant in curveAnimation:GetDescendants() do
			Flag = false
			
			for _, ClassName in List do
				if descendant:IsA(ClassName) then
					Flag = true
					break
				end
			end
			if not Flag then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidInstanceTypes, { allowedTypes = table.concat(List, ", ") })
				break
			end
		end
	end
end

return CurveAnimAllowedTypesModule