local ExpChat = script:FindFirstAncestor("ExpChat")
local ReactModule = require(ExpChat.Parent.React)
local FFlagExpChatComposerInputBarFigmaParityModule = require(ExpChat.Flags.FFlagExpChatComposerInputBarFigmaParity)
local LocalizationModule = require(ExpChat.Localization)
local _ = require(script.Parent.useDictationInputBar)

local function _(p1, p2, p3) --[[ Line: 28 | Named "lerp" ]]
	return p1 + (p2 - p1) * p3
end

return function(p1, p2) --[[ Line: 42 | Named "useDictationTextArea" ]]
	-- upvalues: LocalizationModule (copy), FFlagExpChatComposerInputBarFigmaParityModule (copy), ReactModule (copy)
	local UseLocalizationResult = LocalizationModule.useLocalization({
		transcribingText = "CoreScripts.TextChat.ChatWindow.Transcribing"
	})
	local TranscribingText = if UseLocalizationResult.transcribingText and UseLocalizationResult.transcribingText ~= "" then UseLocalizationResult.transcribingText else "Transcribing..."
	local IsAudioActive = if p1 then p1.dictation.bindings.isAudioActive else nil
	local ChatInputBarSettings = if p1 then p1.chatInputBarSettings else nil
	local IsTranscribing = if p1 then p1.isTranscribing else false
	local v1: number = if p2.showPlaceholderText and not FFlagExpChatComposerInputBarFigmaParityModule then 0.5 else 0
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 64 ]]
		-- upvalues: IsAudioActive (copy), p2 (copy), v1 (copy), ReactModule (upval)
		return if IsAudioActive == nil then p2.transparencyValue:map(function(p3): number --[[ Line: 66 ]]
			-- upvalues: v1 (upval)
			return v1 + (1 - v1) * p3
		end) else ReactModule.joinBindings({ fade = p2.transparencyValue, hide = IsAudioActive }):map(function(p3) --[[ Line: 73 ]]
			-- upvalues: v1 (upval)
			local v2 = if p3.hide then 1 else v1
			
			return v2 + (1 - v2) * p3.fade
		end)
	end, { p2.transparencyValue, IsAudioActive, v1 })
	local TextStrokeTransparency = if ChatInputBarSettings then ChatInputBarSettings.TextStrokeTransparency else 0
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 80 ]]
		-- upvalues: IsAudioActive (copy), p2 (copy), TextStrokeTransparency (copy), ReactModule (upval)
		return if IsAudioActive == nil then p2.transparencyValue:map(function(p3): number --[[ Line: 82 ]]
			-- upvalues: TextStrokeTransparency (upval)
			return TextStrokeTransparency + (1 - TextStrokeTransparency) * p3
		end) else ReactModule.joinBindings({ fade = p2.transparencyValue, hide = IsAudioActive }):map(function(p3) --[[ Line: 89 ]]
			-- upvalues: TextStrokeTransparency (upval)
			local TextStrokeTransparency1 = if p3.hide then 1 else TextStrokeTransparency
			
			return TextStrokeTransparency1 + (1 - TextStrokeTransparency1) * p3.fade
		end)
	end, {
		p2.transparencyValue,
		IsAudioActive,
		TextStrokeTransparency
	})
	local CustomTextBoxRef = if p1 then p1.customTextBoxRef else nil
	local TextBoxRef = if p1 then p1.textBoxRef else nil
	local PlaceholderColor3 = if ChatInputBarSettings then ChatInputBarSettings.PlaceholderColor3 else nil
	local TextColor3 = if ChatInputBarSettings then ChatInputBarSettings.TextColor3 else nil
	ReactModule.useEffect(function() --[[ Line: 103 ]]
		-- upvalues: CustomTextBoxRef (copy), TextBoxRef (copy), IsTranscribing (copy), TranscribingText (copy), PlaceholderColor3 (copy), TextColor3 (copy)
		if CustomTextBoxRef == nil or TextBoxRef == nil then return end
		local Current = if CustomTextBoxRef.current then CustomTextBoxRef.current else TextBoxRef.current
		
		if Current == nil then return end
		if IsTranscribing then
			Current.Text = TranscribingText
			Current.TextEditable = false
			Current.TextColor3 = PlaceholderColor3
			
			return
		end
		Current.TextEditable = true
		Current.TextColor3 = TextColor3
		
		if Current.Text == TranscribingText then
			Current.Text = ""
		end
	end, {
		if p1 then p1.state else nil, IsTranscribing, TranscribingText,
		CustomTextBoxRef, TextBoxRef, PlaceholderColor3, TextColor3
	})
	
	return {
		textTransparency = UseMemoResult,
		textStrokeTransparency = UseMemoResult1
	}
end