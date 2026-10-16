local FoundationModule = require(script:FindFirstAncestor("ExpChat").Parent.Foundation)

return {
	deriveMicSendButton = function(p1, p2) --[[ Line: 56 ]]
		-- upvalues: FoundationModule (copy)
		local IdleSendIcon = p2.idleSendIcon
		local IdleSendVariant = p2.idleSendVariant
		local IdleSendActivated = p2.idleSendActivated
		local IdleSendDisabled = p2.idleSendDisabled or false
		local Flag = false
		
		if p1.isRecording then
			IdleSendActivated = p1.onMicTap
			IdleSendDisabled = false
		elseif p1.isTranscribing then
			IdleSendDisabled = true
		elseif p1.isListening then
			IdleSendIcon = FoundationModule.Enums.IconName.X
			IdleSendVariant = FoundationModule.Enums.ButtonVariant.Standard
			IdleSendActivated = p1.dictation.cancel
			IdleSendDisabled = false
		elseif p2.hasEmptyInputText and p1.isDictationEligible then
			if p2.isTextBoxFocused then
				IdleSendDisabled = true
			else
				IdleSendIcon = FoundationModule.Enums.IconName.Microphone
				IdleSendVariant = FoundationModule.Enums.ButtonVariant.Utility
				IdleSendActivated = p1.onMicTap
				IdleSendDisabled = false
				Flag = true
			end
		end
		return {
			icon = IdleSendIcon,
			variant = IdleSendVariant,
			isDisabled = IdleSendDisabled,
			onActivated = IdleSendActivated,
			useLongPressOverlay = Flag and p1.micGestureHandlers ~= nil
		}
	end,
	deriveBackgroundColors = function(p1, p2) --[[ Line: 115 ]]
		return if p1.isListening then {
			color3 = p2.listeningColor3,
			baseTransparency = p2.listeningTransparency
		} else {
			color3 = p2.defaultColor3,
			baseTransparency = p2.defaultTransparency
		}
	end,
	shouldPreventFade = function(p1) --[[ Line: 131 ]]
		return p1.isRecording or (p1.isTranscribing or p1.isListening)
	end
}