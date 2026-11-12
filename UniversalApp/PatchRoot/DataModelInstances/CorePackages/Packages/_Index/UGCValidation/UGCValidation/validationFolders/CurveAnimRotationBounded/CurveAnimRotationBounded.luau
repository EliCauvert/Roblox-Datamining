local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateCurveAnimRotationSpeedModule = require(Parent.flags.getFFlagUGCValidateCurveAnimRotationSpeed)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)
local GetFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule = require(Parent.flags.getFIntUGCValidationMaxAnimationRotationSpeedPerSecond)
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
	-- upvalues: GetFFlagUGCValidateCurveAnimRotationSpeedModule (copy), GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (copy), ErrorSourceStringsModule (copy)
	local FullName = p2.animation and p2.animation:GetFullName()
	
	if not GetFFlagUGCValidateCurveAnimRotationSpeedModule() then return end
	local AnimFrames = p2.animFrames
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
					local config = {
						time = string.format("%.2f", (i - 1) * v1),
						bodyPart = BodyPart,
						speed = string.format("%.2f", Degrees * GetFIntUGCValidateMaxAnimationFPSModule()),
						maxSpeed = tostring(FIntUGCValidationMaxAnimationRotationSpeedPerSecondModule)
					}
					
					if FullName then
						config.animationName = FullName
					end
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_RotationTooFast, config, p2.animation)
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