local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFStringUGCValidationMaxAnimationDeltasModule = require(parent.flags.GetFStringUGCValidationMaxAnimationDeltas)
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
		-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFStringUGCValidationMaxAnimationDeltasModule (ref), errorSourceStringsModule (ref)
		local animFrames = p2.curveAnimComputedFrames.animFrames
		local var1 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
		local var2 = var1 / 0.033333333333
		local var3 = getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * var2
		local var4 = getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * 30
		local t = {}
		
		for i, v in animFrames do
			for i_1, v_1 in v do
				local var5 = t[i_1]
				
				if var5 then
					local magnitude = (v_1.Position - var5.Position).Magnitude
					
					if var3 < magnitude then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_SpeedTooFast, {
							time = string.format("%.2f", (i - 1) * var1),
							bodyPart = i_1,
							speed = string.format("%.2f", magnitude / var2 * 30),
							maxSpeed = string.format("%.2f", var4)
						})
						
						return
					end
				end
			end
			t = v
		end
	end
}