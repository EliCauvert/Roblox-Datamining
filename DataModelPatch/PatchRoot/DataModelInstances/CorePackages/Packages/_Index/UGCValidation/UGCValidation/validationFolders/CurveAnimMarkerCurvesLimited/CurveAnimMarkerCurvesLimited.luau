local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFIntUGCValidateMaxTotalMarkerCurvesModule = require(Parent.flags.getFIntUGCValidateMaxTotalMarkerCurves)
local CurveAnimMarkerCurvesLimitedModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimMarkerCurvesLimitedModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimMarkerCurvesLimitedModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
CurveAnimMarkerCurvesLimitedModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimMarkerCurvesLimitedModule.expectedFailures = {}
CurveAnimMarkerCurvesLimitedModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimMarkerCurvesLimitedModule.run(p1, p2)
	-- upvalues: GetFIntUGCValidateMaxTotalMarkerCurvesModule (copy), ErrorSourceStringsModule (copy)
	local FIntUGCValidateMaxTotalMarkerCurvesModule = GetFIntUGCValidateMaxTotalMarkerCurvesModule()
	
	for _, curveAnimation in p2.curveAnimations do
		local Count = 0
		
		for _, MarkerCurve in curveAnimation:GetDescendants() do
			if MarkerCurve:IsA("MarkerCurve") then
				Count += 1
				
				if FIntUGCValidateMaxTotalMarkerCurvesModule < Count then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_TooManyMarkerCurves, {
						maxAllowed = tostring(FIntUGCValidateMaxTotalMarkerCurvesModule)
					})
					break
				end
			end
		end
	end
end

return CurveAnimMarkerCurvesLimitedModule