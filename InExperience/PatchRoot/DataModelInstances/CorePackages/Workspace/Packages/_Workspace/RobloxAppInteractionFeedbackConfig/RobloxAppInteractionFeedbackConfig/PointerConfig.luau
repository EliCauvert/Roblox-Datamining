local Parent = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent
local _ = require(Parent.InteractionFeedback)
local Sounds = require(Parent.SoundManager).Sounds

return {
	Default = { Release = { Sound = Sounds.AppSelect.Name } },
	PlayExperienceButton = { Release = { Sound = Sounds.NotificationHigh.Name } },
	MakePurchase = {
		Press = {
			Sound = Sounds.Purchase.Name,
			Haptic = Enum.HapticEffectType.UIClick
		}
	}
}