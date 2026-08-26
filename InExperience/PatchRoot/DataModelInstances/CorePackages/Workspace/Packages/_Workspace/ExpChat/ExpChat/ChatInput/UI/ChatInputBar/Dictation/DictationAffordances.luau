local foundationModule = require(script:FindFirstAncestor("ExpChat").Parent.Foundation)

return {
	deriveMicSendButton = function(p1, p2)
		-- upvalues: foundationModule (ref)
		local idleSendIcon = p2.idleSendIcon
		local idleSendVariant = p2.idleSendVariant
		local idleSendActivated = p2.idleSendActivated
		local idleSendDisabled = p2.idleSendDisabled or false
		local var1 = false
		
		if p1.isRecording then
			idleSendActivated = p1.onMicTap
			idleSendDisabled = false
		elseif p1.isTranscribing then
			idleSendDisabled = true
		elseif p1.isListening then
			idleSendIcon = foundationModule.Enums.IconName.X
			idleSendVariant = foundationModule.Enums.ButtonVariant.Standard
			idleSendActivated = p1.dictation.cancel
			idleSendDisabled = false
		elseif p2.hasEmptyInputText and p1.isDictationEligible then
			if p2.isTextBoxFocused then
				idleSendDisabled = true
			else
				idleSendIcon = foundationModule.Enums.IconName.Microphone
				idleSendVariant = foundationModule.Enums.ButtonVariant.Utility
				idleSendActivated = p1.onMicTap
				idleSendDisabled = false
				var1 = true
			end
		end
		return {
			icon = idleSendIcon,
			variant = idleSendVariant,
			isDisabled = idleSendDisabled,
			onActivated = idleSendActivated,
			useLongPressOverlay = var1 and p1.micGestureHandlers ~= nil
		}
	end,
	deriveBackgroundColors = function(value, p1)
		return if value.isListening then {
			color3 = p1.listeningColor3,
			baseTransparency = p1.listeningTransparency
		} else {
			color3 = p1.defaultColor3,
			baseTransparency = p1.defaultTransparency
		}
	end,
	shouldPreventFade = function(p1)
		return p1.isRecording or (p1.isTranscribing or p1.isListening)
	end
}