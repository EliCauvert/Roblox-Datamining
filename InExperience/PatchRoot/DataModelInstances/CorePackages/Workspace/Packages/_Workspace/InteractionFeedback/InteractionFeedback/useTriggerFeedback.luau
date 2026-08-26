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

local function useHapticPositionAndRadius()
	-- upvalues: useInputType (ref), useLaserPointerHand (ref), reactModule (ref), isSpatial (ref)
	local var1 = useLaserPointerHand()
	
	return reactModule.useMemo(function()
		-- upvalues: isSpatial (copy), var1 (ref)
		return if isSpatial() then if var1 == "Right" then { Vector3.new(1, 0, 0), 0.1 } else { Vector3.new(-1, 0, 0), 0.1 } else { Vector3.new(0, 0, 0), 100 }
	end, { useInputType(), var1 })
end

return function()
	-- upvalues: reactModule (ref), interactionFeedbackContextModule (ref), useHapticPositionAndRadius (ref), triggerFeedbackModule (ref), fFlagLuaAppHapticTriggeredTelemetry (ref)
	local var1 = reactModule.useContext(interactionFeedbackContextModule)
	local _ = nil
	local _ = nil
	local var2 = useHapticPositionAndRadius()
	local var3 = var2[1]
	local var4 = var2[2]
	
	if not var1 then
		error("useTriggerFeedback must be used within an InteractionFeedbackProvider")
	end
	return reactModule.useCallback(function(p1, p2, p3, p4)
		-- upvalues: triggerFeedbackModule (copy), var1 (ref), var3 (write), var4 (write), fFlagLuaAppHapticTriggeredTelemetry (copy)
		return triggerFeedbackModule(p1, p2, var1, var3, var4, if fFlagLuaAppHapticTriggeredTelemetry then p3 else nil, if fFlagLuaAppHapticTriggeredTelemetry then p4 else nil)
	end, { var1, var3, var4 })
end