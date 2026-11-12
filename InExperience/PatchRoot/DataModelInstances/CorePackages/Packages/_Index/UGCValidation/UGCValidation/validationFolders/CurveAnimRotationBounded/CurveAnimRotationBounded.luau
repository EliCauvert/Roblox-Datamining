local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateCurveAnimRotationSpeedModule = require(Parent.flags.getFFlagUGCValidateCurveAnimRotationSpeed)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)
local GetFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule = require(Parent.flags.getFIntUGCValidationMaxAnimationRotationSpeedPerSecond)

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
		-- upvalues: GetFFlagUGCValidateCurveAnimRotationSpeedModule (copy), GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (copy), ErrorSourceStringsModule (copy)
		if not GetFFlagUGCValidateCurveAnimRotationSpeedModule() then return end
		local AnimFrames = p2.curveAnimComputedFrames.animFrames
		local v1 = 1 / GetFIntUGCValidateMaxAnimationFPSModule()
		local FIntUGCValidationMaxAnimationRotationSpeedPerSecondModule = GetFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule()
		local FIntUGCValidationMaxAnimationRotationSpeedPerSecondModuleRatio = FIntUGCValidationMaxAnimationRotationSpeedPerSecondModule / GetFIntUGCValidateMaxAnimationFPSModule()
		local t = {}
		
		for i, animFrame in AnimFrames do
			local Degrees = nil
			for BodyPart, value in animFrame do
				local Entry = t[BodyPart]
				
				if Entry then
					Degrees = math.deg((math.abs((value:AngleBetween(Entry)))))
					
					if FIntUGCValidationMaxAnimationRotationSpeedPerSecondModuleRatio < Degrees then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_RotationTooFast, {
							time = string.format("%.2f", (i - 1) * v1),
							bodyPart = BodyPart,
							speed = string.format("%.2f", Degrees * GetFIntUGCValidateMaxAnimationFPSModule()),
							maxSpeed = tostring(FIntUGCValidationMaxAnimationRotationSpeedPerSecondModule)
						})
						break
					end
				end
			end
			t = animFrame
		end
	end
}