local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFStringUGCValidateMaxAnimationMovementPerPartModule = require(Parent.flags.GetFStringUGCValidateMaxAnimationMovementPerPart)

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
		-- upvalues: ConstantsModule (copy), GetFStringUGCValidateMaxAnimationMovementPerPartModule (copy), ErrorSourceStringsModule (copy)
		local AsNumberResults = {}
		
		for _, positionMagnitudeFrame in p2.curveAnimComputedFrames.positionMagnitudeFrames do
			for BodyPart, value in positionMagnitudeFrame do
				if BodyPart ~= ConstantsModule.NAMED_R15_BODY_PARTS.LowerTorso then
					if not AsNumberResults[BodyPart] then
						AsNumberResults[BodyPart] = GetFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(BodyPart)
					end
					if AsNumberResults[BodyPart] < value then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_PositionSeparation, {
							bodyPart = BodyPart,
							maxMovement = tostring(AsNumberResults[BodyPart])
						})
						break
					end
				end
			end
		end
	end
}