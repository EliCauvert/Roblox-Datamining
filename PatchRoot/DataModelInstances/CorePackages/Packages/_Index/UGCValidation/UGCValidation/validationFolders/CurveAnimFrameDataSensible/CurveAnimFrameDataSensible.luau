-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:46 2026 Pacific Standard Time.

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

local function areNumbersGood(...) --[[ line: 24 ]]
	local function _(p0) --[[ line: 25 | named "isNaN" ]]
		return p0 ~= p0
	end
	
	local _ = function(p1) --[[ line: 29 | named "isInfinite" ]]
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

function t.run(p2, p3) --[[ line: 44 ]]
	-- upvalues: areNumbersGood (ref), errorSourceStringsModule (ref)
	local curveAnimComputedFrames = p3.curveAnimComputedFrames
	
	for i, v in curveAnimComputedFrames.animFrames do
		for i_2, v_2 in v do
			if not areNumbersGood(v_2:GetComponents()) then
				p2:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidNumericalData)
				
				return
			end
		end
	end
	for i, v_1 in curveAnimComputedFrames.positionMagnitudeFrames do
		for i_2, v_2 in v_1 do
			if not areNumbersGood(v_2) then
				p2:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidNumericalData)
				
				return
			end
		end
	end
end

return t