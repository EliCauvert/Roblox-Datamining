local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFStringUGCValidateAnimationHeightTolModule = require(parent.flags.GetFStringUGCValidateAnimationHeightTol)
local getFStringUGCValidationMaxAnimationBoundsModule = require(parent.flags.GetFStringUGCValidationMaxAnimationBounds)
local getFIntUGCValidateMaxAnimationFPSModule = require(parent.flags.getFIntUGCValidateMaxAnimationFPS)

return {
	categories = {
		validationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		validationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.curveAnimations,
		validationEnumsModule.SharedDataMember.curveAnimComputedFrames
	},
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFStringUGCValidateAnimationHeightTolModule (ref), getFStringUGCValidationMaxAnimationBoundsModule (ref), errorSourceStringsModule (ref)
		local curveAnimComputedFrames = p2.curveAnimComputedFrames
		local animFrames = curveAnimComputedFrames.animFrames
		local animLength = curveAnimComputedFrames.animLength
		local var1 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
		local var2 = getFStringUGCValidateAnimationHeightTolModule.asNumber()
		local var3 = getFStringUGCValidationMaxAnimationBoundsModule.asNumber()
		
		for i, v in animFrames do
			for i_1, v_1 in v do
				if v_1.Position.Y >= var2 then
					if var3 < v_1.Position.Magnitude then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_PartTooFar, {
							time = string.format("%.2f", math.min(animLength, (i - 1) * var1)),
							bodyPart = i_1,
							distance = string.format("%.2f", v_1.Position.Magnitude),
							maxDistance = getFStringUGCValidationMaxAnimationBoundsModule.asString()
						})
						
						return
					end
				end
				p1:fail(errorSourceStringsModule.Keys.CurveAnim_PartTooLow, {
					time = string.format("%.2f", math.min(animLength, (i - 1) * var1)),
					bodyPart = i_1,
					height = string.format("%.2f", v_1.Position.Y),
					minHeight = getFStringUGCValidateAnimationHeightTolModule.asString()
				})
				
				return
			end
		end
	end
}