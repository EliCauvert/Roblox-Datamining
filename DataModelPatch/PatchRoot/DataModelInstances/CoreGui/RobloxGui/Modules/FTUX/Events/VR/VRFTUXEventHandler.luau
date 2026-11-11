local Parent = script.Parent.Parent.Parent
local FirstPersonToggleEventModule = require(Parent.Events.VR.FirstPersonToggleEvent)
local HapticFeedbackEventModule = require(Parent.Events.VR.HapticFeedbackEvent)
local HapticFeedbackTwiceEventModule = require(Parent.Events.VR.HapticFeedbackTwiceEvent)
local SoundFeedbackEventModule = require(Parent.Events.VR.SoundFeedbackEvent)
local JumpEventModule = require(Parent.Events.VR.JumpEvent)
local MoveToGoalEventModule = require(Parent.Events.VR.MoveToGoalEvent)
local PerspectiveTooltipEventModule = require(Parent.Events.VR.PerspectiveTooltipEvent)
local MovementTooltipEventModule = require(Parent.Events.VR.MovementTooltipEvent)
local LeaveGameIconHighlightEventModule = require(Parent.Events.VR.LeaveGameIconHighlightEvent)
local _ = require(script.Parent.Parent.EventType)
local FTUXEventTypesModuleEntry = require(Parent.Resources.FTUXEventTypes)[require(Parent.Enums.PlatformEnum).QuestVR]

return {
	Name = "VRFTUXEventHandler",
	StartEvent = function(FirstPersonToggleEvent, p1)
		-- upvalues: FTUXEventTypesModuleEntry (copy), FirstPersonToggleEventModule (copy), MoveToGoalEventModule (copy), JumpEventModule (copy), PerspectiveTooltipEventModule (copy), MovementTooltipEventModule (copy), HapticFeedbackEventModule (copy), SoundFeedbackEventModule (copy), HapticFeedbackTwiceEventModule (copy), LeaveGameIconHighlightEventModule (copy)
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.FirstPersonToggleEvent then
			task.spawn(FirstPersonToggleEventModule.StartEvent, p1)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.MoveToGoalEvent then
			task.spawn(MoveToGoalEventModule.StartEvent, p1)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.JumpEvent then
			task.spawn(JumpEventModule.StartEvent, p1)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.PerspectiveTooltipEvent then
			task.spawn(PerspectiveTooltipEventModule.StartEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.MovementTooltipEvent then
			task.spawn(MovementTooltipEventModule.StartEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.HapticFeedbackEvent then
			task.spawn(HapticFeedbackEventModule.StartEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.SoundFeedbackEvent then
			task.spawn(SoundFeedbackEventModule.StartEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.HapticFeedbackTwiceEvent then
			task.spawn(HapticFeedbackTwiceEventModule.StartEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.LeaveGameIconHighlightEvent then
			task.spawn(LeaveGameIconHighlightEventModule.StartEvent)
			
			return
		else
			warn("Unmapped VRFTUX event type: " .. tostring(FirstPersonToggleEvent))
		end
	end,
	StopEvent = function(FirstPersonToggleEvent)
		-- upvalues: FTUXEventTypesModuleEntry (copy), FirstPersonToggleEventModule (copy), MoveToGoalEventModule (copy), JumpEventModule (copy), PerspectiveTooltipEventModule (copy), MovementTooltipEventModule (copy), LeaveGameIconHighlightEventModule (copy)
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.FirstPersonToggleEvent then
			task.spawn(FirstPersonToggleEventModule.StopEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.MoveToGoalEvent then
			task.spawn(MoveToGoalEventModule.StopEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.JumpEvent then
			task.spawn(JumpEventModule.StopEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.PerspectiveTooltipEvent then
			task.spawn(PerspectiveTooltipEventModule.StopEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.MovementTooltipEvent then
			task.spawn(MovementTooltipEventModule.StopEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.LeaveGameIconHighlightEvent then
			task.spawn(LeaveGameIconHighlightEventModule.StopEvent)
			
			return
		end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.HapticFeedbackTwiceEvent then return end
		if FirstPersonToggleEvent == FTUXEventTypesModuleEntry.HapticFeedbackEvent then return end
		if FirstPersonToggleEvent ~= FTUXEventTypesModuleEntry.SoundFeedbackEvent then
			warn("Unmapped VRFTUX event type: " .. tostring(FirstPersonToggleEvent))
			
			return
		end
	end
}