local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFStringUGCValidateMaxAnimationMovementPerPartModule = require(parent.flags.GetFStringUGCValidateMaxAnimationMovementPerPart)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = {
	validationEnumsModule.SharedDataMember.curveAnimations,
	validationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p1, p2)
	-- upvalues: constantsModule (ref), getFStringUGCValidateMaxAnimationMovementPerPartModule (ref), errorSourceStringsModule (ref)
	local t = {}
	
	for i, v in p2.curveAnimComputedFrames.positionMagnitudeFrames do
		for i_1, v_1 in v do
			if i_1 ~= constantsModule.NAMED_R15_BODY_PARTS.LowerTorso then
				if not t[i_1] then
					t[i_1] = getFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(i_1)
				end
				if t[i_1] < v_1 then
					p1:fail(errorSourceStringsModule.Keys.CurveAnim_PositionSeparation, { bodyPart = i_1, maxMovement = tostring(t[i_1]) })
					
					return
				end
			end
		end
	end
end

return t