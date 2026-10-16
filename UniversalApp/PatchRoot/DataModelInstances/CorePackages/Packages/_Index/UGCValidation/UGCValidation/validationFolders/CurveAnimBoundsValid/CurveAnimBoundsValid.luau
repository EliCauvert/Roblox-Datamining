local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFStringUGCValidateAnimationHeightTolModule = require(Parent.flags.GetFStringUGCValidateAnimationHeightTol)
local GetFStringUGCValidationMaxAnimationBoundsModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationBounds)
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
	run = function(p1, p2) --[[ Line: 21 ]]
		-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFStringUGCValidateAnimationHeightTolModule (copy), GetFStringUGCValidationMaxAnimationBoundsModule (copy), ErrorSourceStringsModule (copy)
		local CurveAnimComputedFrames = p2.curveAnimComputedFrames
		local AnimFrames = CurveAnimComputedFrames.animFrames
		local AnimLength: number = CurveAnimComputedFrames.animLength
		local v1 = 1 / GetFIntUGCValidateMaxAnimationFPSModule()
		local AsNumberResult = GetFStringUGCValidateAnimationHeightTolModule.asNumber()
		local AsNumberResult1 = GetFStringUGCValidationMaxAnimationBoundsModule.asNumber()
		
		for i, animFrame in AnimFrames do
			for BodyPart, value in animFrame do
				if value.Position.Y < AsNumberResult then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_PartTooLow, {
						time = string.format("%.2f", (math.min(AnimLength, (i - 1) * v1))),
						bodyPart = BodyPart,
						height = string.format("%.2f", value.Position.Y),
						minHeight = GetFStringUGCValidateAnimationHeightTolModule.asString()
					})
					break
				end
				if AsNumberResult1 < value.Position.Magnitude then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_PartTooFar, {
						time = string.format("%.2f", (math.min(AnimLength, (i - 1) * v1))),
						bodyPart = BodyPart,
						distance = string.format("%.2f", value.Position.Magnitude),
						maxDistance = GetFStringUGCValidationMaxAnimationBoundsModule.asString()
					})
					break
				end
			end
		end
	end
}