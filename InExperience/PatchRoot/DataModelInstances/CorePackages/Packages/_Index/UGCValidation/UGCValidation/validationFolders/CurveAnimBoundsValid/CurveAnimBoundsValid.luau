local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule = require(parent.flags.getFFlagUGCValidateCurveAnimTimeErrorMessageFix)
local getFStringUGCValidateAnimationHeightTolModule = require(parent.flags.GetFStringUGCValidateAnimationHeightTol)
local getFStringUGCValidationMaxAnimationBoundsModule = require(parent.flags.GetFStringUGCValidationMaxAnimationBounds)
local getFIntUGCValidateMaxAnimationFPSModule = require(parent.flags.getFIntUGCValidateMaxAnimationFPS)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = {
	validationEnumsModule.SharedDataMember.curveAnimations,
	validationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p1, p2)
	-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), getFStringUGCValidateAnimationHeightTolModule (ref), getFStringUGCValidationMaxAnimationBoundsModule (ref), errorSourceStringsModule (ref)
	local var1, var2
	local curveAnimComputedFrames = p2.curveAnimComputedFrames
	local animFrames = curveAnimComputedFrames.animFrames
	local animLength = curveAnimComputedFrames.animLength
	local var3 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
	
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		var1 = getFStringUGCValidateAnimationHeightTolModule.asNumber()
		var2 = getFStringUGCValidationMaxAnimationBoundsModule.asNumber()
		
		for i, v in animFrames do
			for i_1, v_1 in v do
				if v_1.Position.Y >= var1 then
					if var2 < v_1.Position.Magnitude then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_PartTooFar, {
							time = string.format("%.2f", math.min(animLength, (i - 1) * var3)),
							bodyPart = i_1,
							distance = string.format("%.2f", v_1.Position.Magnitude),
							maxDistance = getFStringUGCValidationMaxAnimationBoundsModule.asString()
						})
						
						return
					end
				end
				p1:fail(errorSourceStringsModule.Keys.CurveAnim_PartTooLow, {
					time = string.format("%.2f", math.min(animLength, (i - 1) * var3)),
					bodyPart = i_1,
					height = string.format("%.2f", v_1.Position.Y),
					minHeight = getFStringUGCValidateAnimationHeightTolModule.asString()
				})
				
				return
			end
		end
		return
	else
		var1 = 1e999
		var2 = 0
		
		for i, v in animFrames do
			for i_1, v_1 in v do
				var2 = math.max(var2, v_1.Position.Magnitude)
				var1 = math.min(var1, v_1.Position.Y)
			end
		end
		if var1 < getFStringUGCValidateAnimationHeightTolModule.asNumber() then
			p1:fail(errorSourceStringsModule.Keys.CurveAnim_BoundsExceeded, {
				minHeight = getFStringUGCValidateAnimationHeightTolModule.asString(),
				maxDistance = getFStringUGCValidationMaxAnimationBoundsModule.asString()
			})
		end
		if getFStringUGCValidationMaxAnimationBoundsModule.asNumber() < var2 then
			p1:fail(errorSourceStringsModule.Keys.CurveAnim_BoundsExceeded, {
				minHeight = getFStringUGCValidateAnimationHeightTolModule.asString(),
				maxDistance = getFStringUGCValidationMaxAnimationBoundsModule.asString()
			})
		end
	end
end

return t