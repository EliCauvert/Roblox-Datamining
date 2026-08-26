local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFIntUGCValidateMaxTotalMarkerCurvesModule = require(parent.flags.getFIntUGCValidateMaxTotalMarkerCurves)
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
	-- upvalues: getFIntUGCValidateMaxTotalMarkerCurvesModule (ref), errorSourceStringsModule (ref)
	local var1 = getFIntUGCValidateMaxTotalMarkerCurvesModule()
	
	for i, v in p2.curveAnimations do
		local var2 = 0
		
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("MarkerCurve") then
				var2 += 1
				
				if var1 < var2 then
					p1:fail(errorSourceStringsModule.Keys.CurveAnim_TooManyMarkerCurves, { maxAllowed = tostring(var1) })
					
					return
				end
			end
		end
	end
end

return t