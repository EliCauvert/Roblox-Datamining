local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local CurveAnimFrameDataSensibleModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimFrameDataSensibleModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimFrameDataSensibleModule.requiredData = {
	ValidationEnumsModule.SharedDataMember.curveAnimations,
	ValidationEnumsModule.SharedDataMember.curveAnimComputedFrames
}
CurveAnimFrameDataSensibleModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimFrameDataSensibleModule.expectedFailures = {}
CurveAnimFrameDataSensibleModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function areNumbersGood(...): boolean
	local function _(p1): boolean
		return p1 ~= p1
	end
	
	local _ = function(p1): boolean
		return p1 == 1e999 or p1 == -1e999
	end
	
	for _, value in { ... } do
		if value ~= value then
			return false
		elseif value == 1e999 or value == -1e999 then
			return false
		end
	end
	return true
end

function CurveAnimFrameDataSensibleModule.run(p1, p2)
	-- upvalues: areNumbersGood (copy), ErrorSourceStringsModule (copy)
	local CurveAnimComputedFrames = p2.curveAnimComputedFrames
	
	for _, animFrame in CurveAnimComputedFrames.animFrames do
		for _, CF in animFrame do
			if not areNumbersGood(CF:GetComponents()) then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidNumericalData)
				
				return
			end
		end
	end
	for _, positionMagnitudeFrame in CurveAnimComputedFrames.positionMagnitudeFrames do
		for _, value in positionMagnitudeFrame do
			if not areNumbersGood(value) then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidNumericalData)
				break
			end
		end
	end
end

return CurveAnimFrameDataSensibleModule