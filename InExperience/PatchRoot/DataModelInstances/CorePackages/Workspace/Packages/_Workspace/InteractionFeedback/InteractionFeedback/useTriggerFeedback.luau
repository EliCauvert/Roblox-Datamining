local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local triggerFeedbackModule = require(script.Parent.triggerFeedback)
local interactionFeedbackContextModule = require(script.Parent.InteractionFeedbackContext)
local roactUtilsModule = require(parent.RoactUtils)
local useInputType = roactUtilsModule.Hooks.useInputType
local useLaserPointerHand = roactUtilsModule.Hooks.useLaserPointerHand
local reactModule = require(parent.React)
local isSpatial = require(parent.AppCommonLib).isSpatial
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry

local function useHapticPositionAndRadius() --[[ line: 18 ]]
	-- upvalues: useInputType (ref), useLaserPointerHand (ref), reactModule (ref), isSpatial (ref)
	local var6 = useLaserPointerHand()
	
	return reactModule.useMemo(function() --[[ line: 21 ]]
		-- upvalues: isSpatial (copy), var6 (ref)
		return if isSpatial() then if var6 == "Right" then { Vector3.new(1, 0, 0), 0.1 } else { Vector3.new(-1, 0, 0), 0.1 } else { Vector3.new(0, 0, 0), 100 }
	end, { useInputType(), var6 })
end

return function() --[[ line: 38 | named "useTriggerFeedback" ]]
	-- upvalues: reactModule (ref), interactionFeedbackContextModule (ref), useHapticPositionAndRadius (ref), triggerFeedbackModule (ref), fFlagLuaAppHapticTriggeredTelemetry (ref)
	local var7 = reactModule.useContext(interactionFeedbackContextModule)
	local _ = nil
	local _ = nil
	local var8 = useHapticPositionAndRadius()
	local var9 = var8[1]
	local var10 = var8[2]
	
	if not var7 then
		error("useTriggerFeedback must be used within an InteractionFeedbackProvider")
	end
	return reactModule.useCallback(function(p0, p1, p2, p3) --[[ line: 52 ]]
		-- upvalues: triggerFeedbackModule (copy), var7 (ref), var9 (write), var10 (write), fFlagLuaAppHapticTriggeredTelemetry (copy)
		return triggerFeedbackModule(p0, p1, var7, var9, var10, if fFlagLuaAppHapticTriggeredTelemetry then p2 else nil, if fFlagLuaAppHapticTriggeredTelemetry then p3 else nil)
	end, { var7, var9, var10 })
end