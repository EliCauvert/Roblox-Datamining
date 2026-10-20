local Parent = script:FindFirstAncestor("InteractionFeedback").Parent
local TriggerFeedbackModule = require(script.Parent.triggerFeedback)
local InteractionFeedbackContextModule = require(script.Parent.InteractionFeedbackContext)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseInputTypeFunction = RoactUtilsModule.Hooks.useInputType
local UseLaserPointerHandFunction = RoactUtilsModule.Hooks.useLaserPointerHand
local ReactModule = require(Parent.React)
local IsSpatialFunction = require(Parent.AppCommonLib).isSpatial

local function useHapticPositionAndRadius()
	-- upvalues: UseInputTypeFunction (copy), UseLaserPointerHandFunction (copy), ReactModule (copy), IsSpatialFunction (copy)
	local UseInputTypeResult = UseInputTypeFunction()
	local UseLaserPointerHandResult = UseLaserPointerHandFunction()
	
	return (ReactModule.useMemo(function()
		-- upvalues: IsSpatialFunction (upval), UseLaserPointerHandResult (copy)
		return if IsSpatialFunction() then if UseLaserPointerHandResult == "Right" then { vector.create(1, 0, 0), 0.1 } else { vector.create(-1, 0, 0), 0.1 } else { vector.create(0, 0, 0), 100 }
	end, { UseInputTypeResult, UseLaserPointerHandResult }))
end

return function()
	-- upvalues: ReactModule (copy), InteractionFeedbackContextModule (copy), useHapticPositionAndRadius (copy), TriggerFeedbackModule (copy)
	local UseContextResult = ReactModule.useContext(InteractionFeedbackContextModule)
	local UseHapticPositionAndRadiusResultEntry = nil
	local UseHapticPositionAndRadiusResultEntry1 = nil
	local UseHapticPositionAndRadiusResult = useHapticPositionAndRadius()
	UseHapticPositionAndRadiusResultEntry = UseHapticPositionAndRadiusResult[1]
	UseHapticPositionAndRadiusResultEntry1 = UseHapticPositionAndRadiusResult[2]
	
	if not UseContextResult then
		error("useTriggerFeedback must be used within an InteractionFeedbackProvider")
	end
	return (ReactModule.useCallback(function(p1, p2, p3, p4)
		-- upvalues: TriggerFeedbackModule (upval), UseContextResult (copy), UseHapticPositionAndRadiusResultEntry (ref), UseHapticPositionAndRadiusResultEntry1 (ref)
		return TriggerFeedbackModule(p1, p2, UseContextResult, UseHapticPositionAndRadiusResultEntry, UseHapticPositionAndRadiusResultEntry1, p3, p4)
	end, {
		UseContextResult,
		UseHapticPositionAndRadiusResultEntry,
		UseHapticPositionAndRadiusResultEntry1
	}))
end