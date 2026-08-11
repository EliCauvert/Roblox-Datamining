local parent = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent
local _ = require(parent.InteractionFeedback)
local sounds = require(parent.SoundManager).Sounds

return {
	Default = {
		SecondaryActivated = { Haptic = Enum.HapticEffectType.UIHover }
	},
	PlayExperienceButton = { Release = { Sound = sounds.NotificationHigh.Name } },
	MakePurchase = {
		Press = {
			Sound = sounds.Purchase.Name,
			Haptic = Enum.HapticEffectType.UIClick
		}
	},
	TileLongPress = { Press = { Haptic = Enum.HapticEffectType.UIClick } }
}