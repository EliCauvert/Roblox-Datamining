local Parent = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent
local _ = require(Parent.InteractionFeedback)
local Sounds = require(Parent.SoundManager).Sounds

return {
	PlayExperienceButton = { Release = { Sound = Sounds.NotificationHigh.Name } },
	MakePurchase = {
		Press = {
			Sound = Sounds.Purchase.Name,
			Haptic = Enum.HapticEffectType.UIClick
		}
	},
	TileLongPress = { Press = { Haptic = Enum.HapticEffectType.UIClick } }
}