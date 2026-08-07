local parent = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent
local _ = require(parent.InteractionFeedback)
local sounds = require(parent.SoundManager).Sounds

return {
	Default = { Release = { Sound = sounds.AppSelect.Name } },
	PlayExperienceButton = { Release = { Sound = sounds.NotificationHigh.Name } },
	MakePurchase = {
		Press = {
			Sound = sounds.Purchase.Name,
			Haptic = Enum.HapticEffectType.UIClick
		}
	}
}