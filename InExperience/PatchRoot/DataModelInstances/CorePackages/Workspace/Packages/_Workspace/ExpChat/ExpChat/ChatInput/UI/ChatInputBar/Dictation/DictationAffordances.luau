local foundationModule = require(script:FindFirstAncestor("ExpChat").Parent.Foundation)

return {
	deriveMicSendButton = function(p0, p1) --[[ line: 56 ]]
		-- upvalues: foundationModule (ref)
		local idleSendIcon = p1.idleSendIcon
		local idleSendVariant = p1.idleSendVariant
		local idleSendActivated = p1.idleSendActivated
		local idleSendDisabled = p1.idleSendDisabled or false
		local var2 = false
		
		if p0.isRecording then
			idleSendActivated = p0.onMicTap
			idleSendDisabled = false
		elseif p0.isTranscribing then
			idleSendDisabled = true
		elseif p0.isListening then
			idleSendIcon = foundationModule.Enums.IconName.X
			idleSendVariant = foundationModule.Enums.ButtonVariant.Standard
			idleSendActivated = p0.dictation.cancel
			idleSendDisabled = false
		elseif p1.hasEmptyInputText and p0.isDictationEligible then
			if p1.isTextBoxFocused then
				idleSendDisabled = true
			else
				idleSendIcon = foundationModule.Enums.IconName.Microphone
				idleSendVariant = foundationModule.Enums.ButtonVariant.Utility
				idleSendActivated = p0.onMicTap
				idleSendDisabled = false
				var2 = true
			end
		end
		return {
			icon = idleSendIcon,
			variant = idleSendVariant,
			isDisabled = idleSendDisabled,
			onActivated = idleSendActivated,
			useLongPressOverlay = var2 and p0.micGestureHandlers ~= nil
		}
	end,
	deriveBackgroundColors = function(value, p2) --[[ line: 115 ]]
		return if value.isListening then {
			color3 = p2.listeningColor3,
			baseTransparency = p2.listeningTransparency
		} else {
			color3 = p2.defaultColor3,
			baseTransparency = p2.defaultTransparency
		}
	end,
	shouldPreventFade = function(p3) --[[ line: 131 ]]
		return p3.isRecording or (p3.isTranscribing or p3.isListening)
	end
}