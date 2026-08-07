local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFStringUGCValidationMaxAnimationLengthModule = require(parent.flags.GetFStringUGCValidationMaxAnimationLength)
local getFStringUGCValidateFrameDeltaKeyTimeTolModule = require(parent.flags.GetFStringUGCValidateFrameDeltaKeyTimeTol)
local getFIntUGCValidateMaxAnimationFPSModule = require(parent.flags.getFIntUGCValidateMaxAnimationFPS)
local getFIntUGCValidateMaxMarkerCurveValueLengthModule = require(parent.flags.getFIntUGCValidateMaxMarkerCurveValueLength)
local getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule = require(parent.flags.getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurves)
local getFIntUGCValidateMaxTotalInternalMarkersModule = require(parent.flags.getFIntUGCValidateMaxTotalInternalMarkers)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function areNumbersGood(...) --[[ line: 30 ]]
	local function _(p0) --[[ line: 31 | named "isNaN" ]]
		return p0 ~= p0
	end
	
	local _ = function(p1) --[[ line: 35 | named "isInfinite" ]]
		return if p1 ~= 1e999 then p1 == -1e999 else true
	end
	
	for i, v in { ... } do
		if v == v then
			if if v ~= 1e999 then v == -1e999 else true then
				return false
			end
		end
		return false
	end
	return true
end

function t.run(p2, p3) --[[ line: 50 ]]
	-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFStringUGCValidateFrameDeltaKeyTimeTolModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule (ref), getFIntUGCValidateMaxTotalInternalMarkersModule (ref), errorSourceStringsModule (ref), areNumbersGood (ref), getFIntUGCValidateMaxMarkerCurveValueLengthModule (ref)
	local markers, minValue
	local var11 = 1 / getFIntUGCValidateMaxAnimationFPSModule() * getFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber()
	local ceiled = math.ceil(1 / var11 * getFStringUGCValidationMaxAnimationLengthModule.asNumber())
	
	for i, v in p3.curveAnimations do
		for i_1, v_1 in v:GetDescendants() do
			if not v_1:IsA("MarkerCurve") then
				if v_1:IsA("FloatCurve") then
					markers = v_1:GetKeys()
					
					if ceiled >= #markers then
						minValue = nil
						
						for v_2, v_2 in markers do
							if v_2.Time and areNumbersGood(v_2.Time) and (v_2.Value and areNumbersGood(v_2.Value)) then
								if minValue then
									if v_2.Time >= minValue + var11 then
										minValue = v_2.Time
										continue
									end
									p2:fail(errorSourceStringsModule.Keys.CurveAnim_KeysTooClose, {
										curvePath = `{if v_1.Parent.Parent then v_1.Parent.Parent.Name else "-"}.{v_1.Parent.Name}.{v_1.Name}`,
										maxFPS = tostring(getFIntUGCValidateMaxAnimationFPSModule())
									})
									
									return
								elseif v_2.Time >= 0 then
								end
								p2:fail(errorSourceStringsModule.Keys.CurveAnim_NegativeKeyTime, {
									curvePath = `{if v_1.Parent.Parent then v_1.Parent.Parent.Name else "-"}.{v_1.Parent.Name}.{v_1.Name}`
								})
								
								return
							end
							p2:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidCurveData)
							
							return
						end
					end
					p2:fail(errorSourceStringsModule.Keys.CurveAnim_TooManyKeys, { maxAllowed = tostring(ceiled) })
					
					return
				end
			end
			markers = v_1:GetMarkers()
			
			if getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule() then
				minValue = math.min(getFIntUGCValidateMaxTotalInternalMarkersModule(), ceiled)
				
				if minValue >= #markers then
					for i_2, v_2 in markers do
						if not v_2.Time or not areNumbersGood(v_2.Time) or (not v_2.Value or getFIntUGCValidateMaxMarkerCurveValueLengthModule() < #v_2.Value) then
							p2:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidMarkerData)
							
							return
						end
					end
				end
				p2:fail(errorSourceStringsModule.Keys.CurveAnim_TooManyMarkers, {
					count = tostring(#markers),
					maxAllowed = tostring(minValue)
				})
				
				return
			elseif ceiled >= #markers then
			end
			p2:fail(errorSourceStringsModule.Keys.CurveAnim_TooManyMarkers, {
				count = tostring(#markers),
				maxAllowed = tostring(ceiled)
			})
			
			return
		end
	end
end

return t