-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:46 2026 Pacific Standard Time.

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

function t.run(p0, p1) --[[ line: 24 ]]
	-- upvalues: getFIntUGCValidateMaxTotalMarkerCurvesModule (ref), errorSourceStringsModule (ref)
	local var5 = getFIntUGCValidateMaxTotalMarkerCurvesModule()
	
	for i, v in p1.curveAnimations do
		local var6 = 0
		
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("MarkerCurve") then
				var6 += 1
				
				if var5 < var6 then
					p0:fail(errorSourceStringsModule.Keys.CurveAnim_TooManyMarkerCurves, { maxAllowed = tostring(var5) })
					
					return
				end
			end
		end
	end
end

return t