local parent = script.Parent.Parent
local buttonEnumModule = require(parent.Enums.ButtonEnum)

return {
	[require(parent.Enums.PlatformEnum).QuestVR] = {
		{
			title = "CoreScripts.VRFTUX.Heading.Perspective",
			image = "rbxassetid://13251804809",
			text = {
				"CoreScripts.VRFTUX.Description.Perspective.Body1",
				"CoreScripts.VRFTUX.Description.Perspective.Body2"
			},
			button = buttonEnumModule.SkipButton
		},
		{
			title = "CoreScripts.VRFTUX.Heading.Movement",
			image = "rbxassetid://13251750527",
			text = {
				"CoreScripts.VRFTUX.Description.Movement.Body1",
				"CoreScripts.VRFTUX.Description.Movement.Body2",
				"CoreScripts.VRFTUX.Description.Movement.Body3"
			},
			button = buttonEnumModule.SkipButton
		},
		{
			title = "CoreScripts.VRFTUX.Heading.SafetyBubble.Title",
			image = "rbxassetid://13251806846",
			text = {
				"CoreScripts.VRFTUX.Description.SafetyBubble.Body1",
				"CoreScripts.VRFTUX.Description.SafetyBubble.Body2"
			},
			button = buttonEnumModule.NextButton
		},
		{
			title = "CoreScripts.VRFTUX.Heading.OtherSettings.Title",
			image = "",
			text = {
				"CoreScripts.VRFTUX.Description.OtherSettings.Body1",
				"CoreScripts.VRFTUX.Description.OtherSettings.Body2"
			},
			button = buttonEnumModule.NextButton
		}
	}
}