local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule = require(Parent.flags.getFFlagUGCValidateCurveAnimTimeErrorMessageFix)
local GetFStringUGCValidateAnimationHeightTolModule = require(Parent.flags.GetFStringUGCValidateAnimationHeightTol)
local GetFStringUGCValidationMaxAnimationBoundsModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationBounds)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)
local CurveAnimBoundsValidModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimBoundsValidModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimBoundsValidModule.requiredData = {
	ValidationEnumsModule.SharedDataMember.curveAnimations,
	ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
CurveAnimBoundsValidModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimBoundsValidModule.expectedFailures = {}
CurveAnimBoundsValidModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimBoundsValidModule.run(p1, p2)
	-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (copy), GetFStringUGCValidateAnimationHeightTolModule (copy), GetFStringUGCValidationMaxAnimationBoundsModule (copy), ErrorSourceStringsModule (copy)
	local CurveAnimComputedFrames = p2.curveAnimComputedFrames
	local AnimFrames = CurveAnimComputedFrames.animFrames
	local AnimLength: number = CurveAnimComputedFrames.animLength
	local v1 = 1 / GetFIntUGCValidateMaxAnimationFPSModule()
	
	if GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
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
		return
	else
		local Smallest = 1e999
		local Largest = 0
		
		for _, animFrame1 in AnimFrames do
			for _, value1 in animFrame1 do
				Largest = math.max(Largest, value1.Position.Magnitude)
				Smallest = math.min(Smallest, value1.Position.Y)
			end
		end
		if Smallest < GetFStringUGCValidateAnimationHeightTolModule.asNumber() then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BoundsExceeded, {
				minHeight = GetFStringUGCValidateAnimationHeightTolModule.asString(),
				maxDistance = GetFStringUGCValidationMaxAnimationBoundsModule.asString()
			})
		end
		if GetFStringUGCValidationMaxAnimationBoundsModule.asNumber() < Largest then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BoundsExceeded, {
				minHeight = GetFStringUGCValidateAnimationHeightTolModule.asString(),
				maxDistance = GetFStringUGCValidationMaxAnimationBoundsModule.asString()
			})
		end
	end
end

return CurveAnimBoundsValidModule