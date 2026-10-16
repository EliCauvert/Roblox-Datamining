local Parent = script.Parent.Parent
local PlatformEnumModule = require(Parent.Enums.PlatformEnum)
local FTUXEventTypesModuleEntry = require(Parent.Resources.FTUXEventTypes)[PlatformEnumModule.QuestVR]

return {
	[PlatformEnumModule.QuestVR] = {
		{
			FTUXEventTypesModuleEntry.PerspectiveTooltipEvent,
			FTUXEventTypesModuleEntry.FirstPersonToggleEvent,
			FTUXEventTypesModuleEntry.HapticFeedbackEvent
		},
		{
			FTUXEventTypesModuleEntry.MovementTooltipEvent,
			FTUXEventTypesModuleEntry.MoveToGoalEvent,
			FTUXEventTypesModuleEntry.SoundFeedbackEvent,
			FTUXEventTypesModuleEntry.HapticFeedbackTwiceEvent
		},
		{
			FTUXEventTypesModuleEntry.HapticFeedbackEvent,
			FTUXEventTypesModuleEntry.SoundFeedbackEvent
		},
		{
			FTUXEventTypesModuleEntry.SoundFeedbackEvent,
			FTUXEventTypesModuleEntry.LeaveGameIconHighlightEvent
		}
	}
}