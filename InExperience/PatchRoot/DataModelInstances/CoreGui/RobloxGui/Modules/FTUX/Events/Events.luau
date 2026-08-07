local parent = script.Parent.Parent
local platformEnumModule = require(parent.Enums.PlatformEnum)
local questVR = require(parent.Resources.FTUXEventTypes)[platformEnumModule.QuestVR]

return {
	[platformEnumModule.QuestVR] = {
		{
			questVR.PerspectiveTooltipEvent,
			questVR.FirstPersonToggleEvent,
			questVR.HapticFeedbackEvent
		},
		{
			questVR.MovementTooltipEvent,
			questVR.MoveToGoalEvent,
			questVR.SoundFeedbackEvent,
			questVR.HapticFeedbackTwiceEvent
		},
		{ questVR.HapticFeedbackEvent, questVR.SoundFeedbackEvent },
		{
			questVR.SoundFeedbackEvent,
			questVR.LeaveGameIconHighlightEvent
		}
	}
}