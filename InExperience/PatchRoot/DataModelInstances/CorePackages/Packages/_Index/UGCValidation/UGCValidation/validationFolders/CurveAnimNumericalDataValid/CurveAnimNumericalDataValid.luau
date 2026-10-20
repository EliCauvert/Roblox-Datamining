local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFStringUGCValidationMaxAnimationLengthModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationLength)
local GetFStringUGCValidateFrameDeltaKeyTimeTolModule = require(Parent.flags.GetFStringUGCValidateFrameDeltaKeyTimeTol)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)
local GetFIntUGCValidateMaxMarkerCurveValueLengthModule = require(Parent.flags.getFIntUGCValidateMaxMarkerCurveValueLength)
local GetFIntUGCValidateMaxTotalInternalMarkersModule = require(Parent.flags.getFIntUGCValidateMaxTotalInternalMarkers)

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

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFStringUGCValidateFrameDeltaKeyTimeTolModule (copy), GetFStringUGCValidationMaxAnimationLengthModule (copy), GetFIntUGCValidateMaxTotalInternalMarkersModule (copy), ErrorSourceStringsModule (copy), areNumbersGood (copy), GetFIntUGCValidateMaxMarkerCurveValueLengthModule (copy)
		local ScaledFIntUGCValidateMaxAnimationFPSModule = 1 / GetFIntUGCValidateMaxAnimationFPSModule() * GetFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber()
		local Ceiled = math.ceil(1 / ScaledFIntUGCValidateMaxAnimationFPSModule * GetFStringUGCValidationMaxAnimationLengthModule.asNumber())
		
		for _, curveAnimation in p2.curveAnimations do
			local Markers = nil
			local Smallest = nil
			for _, descendant in curveAnimation:GetDescendants() do
				if not descendant:IsA("MarkerCurve") then
					if descendant:IsA("FloatCurve") then
						local Keys = descendant:GetKeys()
						
						if Ceiled < #Keys then
							p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_TooManyKeys, { maxAllowed = tostring(Ceiled) })
							break
						end
						local Time = nil
						
						for _, key in Keys do
							if not key.Time or not areNumbersGood(key.Time) or not key.Value or not areNumbersGood(key.Value) then
								p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidCurveData)
								break
							end
							if Time then
								if key.Time < Time + ScaledFIntUGCValidateMaxAnimationFPSModule then
									p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_KeysTooClose, {
										curvePath = `{if descendant.Parent.Parent then descendant.Parent.Parent.Name else "-"}.{descendant.Parent.Name}.{descendant.Name}`,
										maxFPS = tostring(GetFIntUGCValidateMaxAnimationFPSModule())
									})
									break
								end
							elseif key.Time < 0 then
								p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NegativeKeyTime, {
									curvePath = `{if descendant.Parent.Parent then descendant.Parent.Parent.Name else "-"}.{descendant.Parent.Name}.{descendant.Name}`
								})
								break
							end
							Time = key.Time
						end
					end
					continue
				end
				Markers = descendant:GetMarkers()
				Smallest = math.min(GetFIntUGCValidateMaxTotalInternalMarkersModule(), Ceiled)
				
				if Smallest < #Markers then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_TooManyMarkers, {
						count = tostring(#Markers),
						maxAllowed = tostring(Smallest)
					})
					break
				end
				for _, marker in Markers do
					if not marker.Time or not areNumbersGood(marker.Time) or not marker.Value or GetFIntUGCValidateMaxMarkerCurveValueLengthModule() < #marker.Value then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidMarkerData)
						break
					end
				end
			end
		end
	end
}