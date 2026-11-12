local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)
local GetFStringUGCValidateMaxJointRotationPerPartModule = require(script.Parent.GetFStringUGCValidateMaxJointRotationPerPart)
local Categories = { ValidationEnumsModule.UploadCategory.ANIMATION }
local RequiredData = {
	ValidationEnumsModule.SharedDataMember.curveAnimations,
	ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
local PrereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function validateCurveAnimClip(p1, p2)
	-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFStringUGCValidateMaxJointRotationPerPartModule (copy), ErrorSourceStringsModule (copy)
	local FullName = p2.animation and p2.animation:GetFullName()
	local AnimLength: number = p2.animLength
	local Tracks = p2.tracks
	local Amount = 1 / GetFIntUGCValidateMaxAnimationFPSModule()
	local AsNumberResults = {}
	local Total = nil
	local Text = nil
	local Degrees = nil
	local Degrees1 = nil
	local AsNumberResult = nil
	
	for i, track in Tracks do
		if track.rot then
			Text = tostring(i)
			
			if not AsNumberResults[Text] then
				AsNumberResults[Text] = GetFStringUGCValidateMaxJointRotationPerPartModule.asNumber(Text)
			end
			AsNumberResult = AsNumberResults[Text]
			Total = 0
			while Total <= AnimLength do
				local _, Angle = track.rot:GetRotationAtTime(Total):ToAxisAngle()
				Degrees = math.deg((math.abs(Angle)))
				
				if AsNumberResult >= Degrees then
					Total += Amount
					continue
				end
				local config = {
					time = string.format("%.2f", Total),
					bodyPart = Text,
					rotation = string.format("%.2f", Degrees),
					maxRotation = tostring(AsNumberResult)
				}
				
				if FullName then
					config.animationName = FullName
				end
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_JointRotationExceeded, config, p2.animation)
				break
			end
			if AnimLength >= 0 then
				local _, Angle1 = track.rot:GetRotationAtTime(AnimLength):ToAxisAngle()
				Degrees1 = math.deg((math.abs(Angle1)))
				
				if AsNumberResult < Degrees1 then
					local config = {
						time = string.format("%.2f", AnimLength),
						bodyPart = Text,
						rotation = string.format("%.2f", Degrees1),
						maxRotation = tostring(AsNumberResult)
					}
					
					if FullName then
						config.animationName = FullName
					end
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_JointRotationExceeded, config, p2.animation)
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