local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFStringUGCValidationMaxAnimationDeltasModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationDeltas)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.curveAnimations,
		ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
	},
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFStringUGCValidationMaxAnimationDeltasModule (copy), ErrorSourceStringsModule (copy)
		local AnimFrames = p2.curveAnimComputedFrames.animFrames
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
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_SpeedTooFast, {
							time = string.format("%.2f", (i - 1) * v1),
							bodyPart = BodyPart,
							speed = string.format("%.2f", Distance / v2 * 30),
							maxSpeed = string.format("%.2f", ScaledAsNumberResult1)
						})
						break
					end
				end
			end
			t = animFrame
		end
	end
}