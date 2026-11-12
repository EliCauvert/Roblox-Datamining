local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFStringUGCValidateMaxAnimationMovementPerPartModule = require(Parent.flags.GetFStringUGCValidateMaxAnimationMovementPerPart)
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
	-- upvalues: ConstantsModule (copy), GetFStringUGCValidateMaxAnimationMovementPerPartModule (copy), ErrorSourceStringsModule (copy)
	local FullName = p2.animation and p2.animation:GetFullName()
	local AsNumberResults = {}
	
	for _, positionMagnitudeFrame in p2.positionMagnitudeFrames do
		for BodyPart, value in positionMagnitudeFrame do
			if BodyPart ~= ConstantsModule.NAMED_R15_BODY_PARTS.LowerTorso then
				if not AsNumberResults[BodyPart] then
					AsNumberResults[BodyPart] = GetFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(BodyPart)
				end
				if AsNumberResults[BodyPart] < value then
					local config = {
						bodyPart = BodyPart,
						maxMovement = tostring(AsNumberResults[BodyPart])
					}
					
					if FullName then
						config.animationName = FullName
					end
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_PositionSeparation, config, p2.animation)
					break
				end
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