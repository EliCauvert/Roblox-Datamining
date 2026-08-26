local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidateMaxAnimationFPSModule = require(parent.flags.getFIntUGCValidateMaxAnimationFPS)
local getFStringUGCValidateMaxJointRotationPerPartModule = require(script.Parent.GetFStringUGCValidateMaxJointRotationPerPart)

return {
	categories = { validationEnumsModule.UploadCategory.ANIMATION },
	requiredData = {
		validationEnumsModule.SharedDataMember.curveAnimations,
		validationEnumsModule.SharedDataMember.curveAnimComputedFrames
	},
	fflag = require(parent.flags.getFFlagUGCValidationAnimationPackSupport),
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFStringUGCValidateMaxJointRotationPerPartModule (ref), errorSourceStringsModule (ref)
		local curveAnimComputedFrames = p2.curveAnimComputedFrames
		local animLength = curveAnimComputedFrames.animLength
		local tracks = curveAnimComputedFrames.tracks
		local var1 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
		local t = {}
		
		for i, v in tracks do
			if v.rot then
				local var2 = tostring(i)
				
				if not t[var2] then
					t[var2] = getFStringUGCValidateMaxJointRotationPerPartModule.asNumber(var2)
				end
				local var3, degrees
				local var4 = t[var2]
				local var5 = 0
				while var5 <= animLength do
					var3, var10 = v.rot:GetRotationAtTime(var5):ToAxisAngle()
					degrees = math.deg(math.abs(var10))
					
					if var4 >= degrees then
						var5 += var1
						continue
					end
					p1:fail(errorSourceStringsModule.Keys.CurveAnim_JointRotationExceeded, {
						time = string.format("%.2f", var5),
						bodyPart = var2,
						rotation = string.format("%.2f", degrees),
						maxRotation = tostring(var4)
					})
					
					return
				end
				if animLength >= 0 then
					var3, var12 = v.rot:GetRotationAtTime(animLength):ToAxisAngle()
					degrees = math.deg(math.abs(var12))
					
					if var4 < degrees then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_JointRotationExceeded, {
							time = string.format("%.2f", animLength),
							bodyPart = var2,
							rotation = string.format("%.2f", degrees),
							maxRotation = tostring(var4)
						})
						
						return
					end
				end
			end
		end
	end
}