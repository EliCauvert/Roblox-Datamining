local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFStringUGCValidationMaxAnimationDeltasModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationDeltas)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)
local Categories = {
	ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
	ValidationEnumsModule.UploadCategory.ANIMATION
}
local RequiredData = {
	ValidationEnumsModule.SharedDataMember.curveAnimations,
	ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
local PrereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function validateCurveAnimClip(p1, p2)
	-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFStringUGCValidationMaxAnimationDeltasModule (copy), ErrorSourceStringsModule (copy)
	local FullName = p2.animation and p2.animation:GetFullName()
	local AnimFrames = p2.animFrames
	local v1 = 1 / GetFIntUGCValidateMaxAnimationFPSModule()
	local v2 = v1 / 0.03333333333333333
	local ScaledAsNumberResult = GetFStringUGCValidationMaxAnimationDeltasModule.asNumber() * v2
	local ScaledAsNumberResult1 = GetFStringUGCValidationMaxAnimationDeltasModule.asNumber() * 30
	local t = {}
	
	for i, animFrame in AnimFrames do
		local Distance = nil
		for BodyPart, value in animFrame do
			local Entry = t[BodyPart]
			
			if Entry then
				Distance = (value.Position - Entry.Position).Magnitude
				
				if ScaledAsNumberResult < Distance then
					local config = {
						time = string.format("%.2f", (i - 1) * v1),
						bodyPart = BodyPart,
						speed = string.format("%.2f", Distance / v2 * 30),
						maxSpeed = string.format("%.2f", ScaledAsNumberResult1)
					}
					
					if FullName then
						config.animationName = FullName
					end
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_SpeedTooFast, config, p2.animation)
					break
				end
			end
		end
		t = animFrame
	end
end

return {
	categories = Categories,
	requiredData = RequiredData,
	expectedFailures = {},
	prereqTests = PrereqTests,
	run = function(p3, p4)
		-- upvalues: validateCurveAnimClip (copy)
		for _, curveAnimComputedFrame in p4.curveAnimComputedFrames do
			validateCurveAnimClip(p3, curveAnimComputedFrame)
		end
	end
}