local _ = require(script:FindFirstAncestor("AppChat").Parent.InteractionFeedback)

return {
	HapticFeedbackContext = { Default = "Default" },
	HapticFeedbackType = { Press = "Press", Hover = "Hover", Release = "Release" },
	HapticFeedbackConfig = {
		Default = {
			Press = { Haptic = Enum.HapticEffectType.UIClick },
			Hover = { Haptic = Enum.HapticEffectType.UIHover },
			Release = { Haptic = Enum.HapticEffectType.UIClick }
		}
	}
}