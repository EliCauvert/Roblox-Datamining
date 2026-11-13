local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFStringUGCValidateAnimationHeightTolModule = require(Parent.flags.GetFStringUGCValidateAnimationHeightTol)
local GetFStringUGCValidationMaxAnimationBoundsModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationBounds)
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
	-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFStringUGCValidateAnimationHeightTolModule (copy), GetFStringUGCValidationMaxAnimationBoundsModule (copy), ErrorSourceStringsModule (copy)
	local FullName = p2.animation and p2.animation:GetFullName()
	local AnimFrames = p2.animFrames
	local AnimLength: number = p2.animLength
	local v1 = 1 / GetFIntUGCValidateMaxAnimationFPSModule()
	local AsNumberResult = GetFStringUGCValidateAnimationHeightTolModule.asNumber()
	local AsNumberResult1 = GetFStringUGCValidationMaxAnimationBoundsModule.asNumber()
	
	for i, animFrame in AnimFrames do
		for BodyPart, value in animFrame do
			if value.Position.Y < AsNumberResult then
				local config = {
					time = string.format("%.2f", (math.min(AnimLength, (i - 1) * v1))),
					bodyPart = BodyPart,
					height = string.format("%.2f", value.Position.Y),
					minHeight = GetFStringUGCValidateAnimationHeightTolModule.asString()
				}
				
				if FullName then
					config.animationName = FullName
				end
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_PartTooLow, config, p2.animation)
				break
			elseif AsNumberResult1 < value.Position.Magnitude then
				local config = {
					time = string.format("%.2f", (math.min(AnimLength, (i - 1) * v1))),
					bodyPart = BodyPart,
					distance = string.format("%.2f", value.Position.Magnitude),
					maxDistance = GetFStringUGCValidationMaxAnimationBoundsModule.asString()
				}
				
				if FullName then
					config.animationName = FullName
				end
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_PartTooFar, config, p2.animation)
				break
			end
		end
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