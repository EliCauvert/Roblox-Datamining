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
t.requiredData = {
	validationEnumsModule.SharedDataMember.curveAnimations,
	validationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function areNumbersGood(...)
	local function _(p1)
		return p1 ~= p1
	end
	
	local _ = function(p1)
		return if p1 ~= 1e999 then p1 == -1e999 else true
	end
	
	for i, v in { ... } do
		if v == v then
			if if v ~= 1e999 then v == -1e999 else true then
				return false
			end
		end
		return false
	end
	return true
end

function t.run(p1, p2)
	-- upvalues: areNumbersGood (ref), errorSourceStringsModule (ref)
	local curveAnimComputedFrames = p2.curveAnimComputedFrames
	
	for i, v in curveAnimComputedFrames.animFrames do
		for i_2, v_2 in v do
			if not areNumbersGood(v_2:GetComponents()) then
				p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidNumericalData)
				
				return
			end
		end
	end
	for i, v_1 in curveAnimComputedFrames.positionMagnitudeFrames do
		for i_2, v_2 in v_1 do
			if not areNumbersGood(v_2) then
				p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidNumericalData)
				
				return
			end
		end
	end
end

return t