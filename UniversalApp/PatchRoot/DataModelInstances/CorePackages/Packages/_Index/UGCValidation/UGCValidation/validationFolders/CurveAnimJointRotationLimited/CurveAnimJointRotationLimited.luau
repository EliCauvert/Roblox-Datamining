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
	run = function(p0, p1) --[[ line: 23 ]]
		-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFStringUGCValidateMaxJointRotationPerPartModule (ref), errorSourceStringsModule (ref)
		local curveAnimComputedFrames = p1.curveAnimComputedFrames
		local animLength = curveAnimComputedFrames.animLength
		local tracks = curveAnimComputedFrames.tracks
		local var4 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
		local t = {}
		
		for i, v in tracks do
			if v.rot then
				local var6 = tostring(i)
				
				if not t[var6] then
					t[var6] = getFStringUGCValidateMaxJointRotationPerPartModule.asNumber(var6)
				end
				local var9, degrees
				local var7 = t[var6]
				local var8 = 0
				while var8 <= animLength do
					var9, var10 = v.rot:GetRotationAtTime(var8):ToAxisAngle()
					degrees = math.deg(math.abs(var10))
					
					if var7 >= degrees then
						var8 += var4
						continue
					end
					p0:fail(errorSourceStringsModule.Keys.CurveAnim_JointRotationExceeded, {
						time = string.format("%.2f", var8),
						bodyPart = var6,
						rotation = string.format("%.2f", degrees),
						maxRotation = tostring(var7)
					})
					
					return
				end
				if animLength >= 0 then
					var9, var12 = v.rot:GetRotationAtTime(animLength):ToAxisAngle()
					degrees = math.deg(math.abs(var12))
					
					if var7 < degrees then
						p0:fail(errorSourceStringsModule.Keys.CurveAnim_JointRotationExceeded, {
							time = string.format("%.2f", animLength),
							bodyPart = var6,
							rotation = string.format("%.2f", degrees),
							maxRotation = tostring(var7)
						})
						
						return
					end
				end
			end
		end
	end
}