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
	StartEvent = function(p1, p2)
		-- upvalues: questVR (ref), firstPersonToggleEventModule (ref), moveToGoalEventModule (ref), jumpEventModule (ref), perspectiveTooltipEventModule (ref), movementTooltipEventModule (ref), hapticFeedbackEventModule (ref), soundFeedbackEventModule (ref), hapticFeedbackTwiceEventModule (ref), leaveGameIconHighlightEventModule (ref)
		if p1 == questVR.FirstPersonToggleEvent then
			task.spawn(firstPersonToggleEventModule.StartEvent, p2)
			
			return
		elseif p1 == questVR.MoveToGoalEvent then
			task.spawn(moveToGoalEventModule.StartEvent, p2)
			
			return
		elseif p1 == questVR.JumpEvent then
			task.spawn(jumpEventModule.StartEvent, p2)
			
			return
		elseif p1 == questVR.PerspectiveTooltipEvent then
			task.spawn(perspectiveTooltipEventModule.StartEvent)
			
			return
		elseif p1 == questVR.MovementTooltipEvent then
			task.spawn(movementTooltipEventModule.StartEvent)
			
			return
		elseif p1 == questVR.HapticFeedbackEvent then
			task.spawn(hapticFeedbackEventModule.StartEvent)
			
			return
		elseif p1 == questVR.SoundFeedbackEvent then
			task.spawn(soundFeedbackEventModule.StartEvent)
			
			return
		elseif p1 == questVR.HapticFeedbackTwiceEvent then
			task.spawn(hapticFeedbackTwiceEventModule.StartEvent)
			
			return
		elseif p1 == questVR.LeaveGameIconHighlightEvent then
			task.spawn(leaveGameIconHighlightEventModule.StartEvent)
			
			return
		end
		warn("Unmapped VRFTUX event type: " .. tostring(p1))
	end,
	StopEvent = function(p1)
		-- upvalues: questVR (ref), firstPersonToggleEventModule (ref), moveToGoalEventModule (ref), jumpEventModule (ref), perspectiveTooltipEventModule (ref), movementTooltipEventModule (ref), leaveGameIconHighlightEventModule (ref)
		if p1 == questVR.FirstPersonToggleEvent then
			task.spawn(firstPersonToggleEventModule.StopEvent)
			
			return
		elseif p1 == questVR.MoveToGoalEvent then
			task.spawn(moveToGoalEventModule.StopEvent)
			
			return
		elseif p1 == questVR.JumpEvent then
			task.spawn(jumpEventModule.StopEvent)
			
			return
		elseif p1 == questVR.PerspectiveTooltipEvent then
			task.spawn(perspectiveTooltipEventModule.StopEvent)
			
			return
		elseif p1 == questVR.MovementTooltipEvent then
			task.spawn(movementTooltipEventModule.StopEvent)
			
			return
		elseif p1 == questVR.LeaveGameIconHighlightEvent then
			task.spawn(leaveGameIconHighlightEventModule.StopEvent)
			
			return
		elseif p1 == questVR.HapticFeedbackTwiceEvent then return end
		if p1 == questVR.HapticFeedbackEvent then return end
		if p1 == questVR.SoundFeedbackEvent then
			return
		end
		warn("Unmapped VRFTUX event type: " .. tostring(p1))
	end
}