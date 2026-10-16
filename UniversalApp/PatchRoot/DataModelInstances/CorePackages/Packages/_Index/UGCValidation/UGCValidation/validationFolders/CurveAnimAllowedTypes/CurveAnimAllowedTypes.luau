local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimAllowedTypesModule = {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	}
}
local List = {
	"MarkerCurve", "AnimationRigData", "Folder", "Vector3Curve",
	"EulerRotationCurve", "FloatCurve"
}

if require(Parent.flags.getFFlagUGCValidateAddObjectValueToAcceptableTypes)() then
	table.insert(List, "ObjectValue")
end
function CurveAnimAllowedTypesModule.run(p1, p2) --[[ Line: 33 ]]
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