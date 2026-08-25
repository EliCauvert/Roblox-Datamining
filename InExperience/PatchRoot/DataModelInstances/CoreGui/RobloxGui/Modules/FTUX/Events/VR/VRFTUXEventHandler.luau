local parent = script.Parent.Parent.Parent
local firstPersonToggleEventModule = require(parent.Events.VR.FirstPersonToggleEvent)
local hapticFeedbackEventModule = require(parent.Events.VR.HapticFeedbackEvent)
local hapticFeedbackTwiceEventModule = require(parent.Events.VR.HapticFeedbackTwiceEvent)
local soundFeedbackEventModule = require(parent.Events.VR.SoundFeedbackEvent)
local jumpEventModule = require(parent.Events.VR.JumpEvent)
local moveToGoalEventModule = require(parent.Events.VR.MoveToGoalEvent)
local perspectiveTooltipEventModule = require(parent.Events.VR.PerspectiveTooltipEvent)
local movementTooltipEventModule = require(parent.Events.VR.MovementTooltipEvent)
local leaveGameIconHighlightEventModule = require(parent.Events.VR.LeaveGameIconHighlightEvent)
local _ = require(script.Parent.Parent.EventType)
local questVR = require(parent.Resources.FTUXEventTypes)[require(parent.Enums.PlatformEnum).QuestVR]

return {
	Name = "VRFTUXEventHandler",
	StartEvent = function(p0, p1)
		-- upvalues: questVR (ref), firstPersonToggleEventModule (ref), moveToGoalEventModule (ref), jumpEventModule (ref), perspectiveTooltipEventModule (ref), movementTooltipEventModule (ref), hapticFeedbackEventModule (ref), soundFeedbackEventModule (ref), hapticFeedbackTwiceEventModule (ref), leaveGameIconHighlightEventModule (ref)
		if p0 == questVR.FirstPersonToggleEvent then
			task.spawn(firstPersonToggleEventModule.StartEvent, p1)
			
			return
		elseif p0 == questVR.MoveToGoalEvent then
			task.spawn(moveToGoalEventModule.StartEvent, p1)
			
			return
		elseif p0 == questVR.JumpEvent then
			task.spawn(jumpEventModule.StartEvent, p1)
			
			return
		elseif p0 == questVR.PerspectiveTooltipEvent then
			task.spawn(perspectiveTooltipEventModule.StartEvent)
			
			return
		elseif p0 == questVR.MovementTooltipEvent then
			task.spawn(movementTooltipEventModule.StartEvent)
			
			return
		elseif p0 == questVR.HapticFeedbackEvent then
			task.spawn(hapticFeedbackEventModule.StartEvent)
			
			return
		elseif p0 == questVR.SoundFeedbackEvent then
			task.spawn(soundFeedbackEventModule.StartEvent)
			
			return
		elseif p0 == questVR.HapticFeedbackTwiceEvent then
			task.spawn(hapticFeedbackTwiceEventModule.StartEvent)
			
			return
		elseif p0 == questVR.LeaveGameIconHighlightEvent then
			task.spawn(leaveGameIconHighlightEventModule.StartEvent)
			
			return
		end
		warn("Unmapped VRFTUX event type: " .. tostring(p0))
	end,
	StopEvent = function(p2)
		-- upvalues: questVR (ref), firstPersonToggleEventModule (ref), moveToGoalEventModule (ref), jumpEventModule (ref), perspectiveTooltipEventModule (ref), movementTooltipEventModule (ref), leaveGameIconHighlightEventModule (ref)
		if p2 == questVR.FirstPersonToggleEvent then
			task.spawn(firstPersonToggleEventModule.StopEvent)
			
			return
		elseif p2 == questVR.MoveToGoalEvent then
			task.spawn(moveToGoalEventModule.StopEvent)
			
			return
		elseif p2 == questVR.JumpEvent then
			task.spawn(jumpEventModule.StopEvent)
			
			return
		elseif p2 == questVR.PerspectiveTooltipEvent then
			task.spawn(perspectiveTooltipEventModule.StopEvent)
			
			return
		elseif p2 == questVR.MovementTooltipEvent then
			task.spawn(movementTooltipEventModule.StopEvent)
			
			return
		elseif p2 == questVR.LeaveGameIconHighlightEvent then
			task.spawn(leaveGameIconHighlightEventModule.StopEvent)
			
			return
		elseif p2 == questVR.HapticFeedbackTwiceEvent then return end
		if p2 == questVR.HapticFeedbackEvent then return end
		if p2 == questVR.SoundFeedbackEvent then
			return
		end
		warn("Unmapped VRFTUX event type: " .. tostring(p2))
	end
}