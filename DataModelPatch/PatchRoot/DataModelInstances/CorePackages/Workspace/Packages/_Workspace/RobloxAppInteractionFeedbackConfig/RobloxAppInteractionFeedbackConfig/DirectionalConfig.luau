local Parent = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent
local _ = require(Parent.InteractionFeedback)
local Sounds = require(Parent.SoundManager).Sounds

return {
	Default = {
		Release = {
			Sound = Sounds.AppSelect.Name,
			Haptic = Enum.HapticEffectType.UIClick
		},
		Hover = {
			Sound = Sounds.AppHover1.Name,
			Haptic = Enum.HapticEffectType.UIHover
		}
	},
	PlayExperienceButton = {
		Release = {
			Sound = Sounds.NotificationHigh.Name,
			Haptic = Enum.HapticEffectType.UIClick
		},
		Hover = {
			Sound = Sounds.AppHover1.Name,
			Haptic = Enum.HapticEffectType.UIHover
		}
	},
	MakePurchase = {
		Press = {
			Sound = Sounds.Purchase.Name,
			Haptic = Enum.HapticEffectType.UIClick
		},
		Hover = {
			Sound = Sounds.AppHover1.Name,
			Haptic = Enum.HapticEffectType.UIHover
		}
	}
}