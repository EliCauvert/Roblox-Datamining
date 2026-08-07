local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagExpChatDictationFTUXModule = require(expChat.Flags.FFlagExpChatDictationFTUX)
local configModule = require(expChat.Config)
local channelChipModule = require(script.Parent.Parent.ChannelChip)
local dictationFTUXModule = require(script.Parent.DictationFTUX)
local stopCountdownModule = require(script.Parent.Parent.StopCountdown)
local dictationWaveformModule = require(script.Parent.DictationWaveform)
local useDictationInputBarModule = require(script.Parent.useDictationInputBar)
local useDictationTextAreaModule = require(script.Parent.useDictationTextArea)
local dictationAffordancesModule = require(script.Parent.DictationAffordances)

local function _(startValue, endValue, alpha) --[[ line: 23 | named "lerp" ]]
	return startValue + (endValue - startValue) * alpha
end

local _ = function(value, p0) --[[ line: 29 | named "setTransparency" ]]
	return p0:map(function(p1) --[[ line: 30 ]]
		-- upvalues: value (ref)
		return value + (1 - value) * p1
	end)
end

return reactModule.memo(function(p2) --[[ line: 35 | named "DictationInputBar" ]]
	-- upvalues: foundationModule (ref), useDictationInputBarModule (ref), dictationAffordancesModule (ref), reactModule (ref), useDictationTextAreaModule (ref), configModule (ref), stopCountdownModule (ref), channelChipModule (ref), dictationWaveformModule (ref), fFlagExpChatDictationFTUXModule (ref), dictationFTUXModule (ref)
	local var12 = foundationModule.Hooks.useTokens()
	local var13 = useDictationInputBarModule({
		inputText = p2.inputText,
		setInputText = p2.setInputText,
		chatInputBarSettings = p2.chatInputBarSettings,
		customTextBoxRef = p2.customTextBoxRef,
		textBoxRef = p2.textBoxRef,
		targetTextChannel = p2.targetTextChannel,
		isGlobalChatTabActive = p2.isGlobalChatTabActive,
		onDictationActivityChanged = p2.onDictationActivityChanged,
		onSendRecordingTap = p2.onSendRecordingTap,
		onTranscriptionStaged = p2.onTranscriptionStaged
	})
	local var14 = dictationAffordancesModule.deriveMicSendButton(var13, {
		idleSendDisabled = false,
		hasEmptyInputText = p2.inputText == "",
		idleSendIcon = foundationModule.Enums.IconName.PaperAirplane,
		idleSendVariant = foundationModule.Enums.ButtonVariant.Emphasis,
		idleSendActivated = p2.onSendActivated
	})
	local var15 = dictationAffordancesModule.deriveBackgroundColors(var13, {
		defaultColor3 = p2.chatInputBarSettings.BackgroundColor3,
		defaultTransparency = p2.chatInputBarBackgroundTransparency,
		listeningColor3 = var12.Color.Shift.Shift_200.Color3,
		listeningTransparency = var12.Color.Shift.Shift_200.Transparency
	})
	local var16 = reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: p2 (ref), var15 (ref)
		return p2.transparencyValue:map(function(p3) --[[ line: 71 ]]
			-- upvalues: var15 (copy)
			local t = { Color3 = var15.color3 }
			local baseTransparency = var15.baseTransparency
			t.Transparency = baseTransparency + (1 - baseTransparency) * p3
			
			return t
		end)
	end, {
		p2.transparencyValue,
		var15.color3,
		var15.baseTransparency
	})
	local var17 = dictationAffordancesModule.shouldPreventFade(var13)
	local var18 = reactModule.useMemo(function() --[[ line: 83 ]]
		-- upvalues: var17 (ref), p2 (ref)
		return if var17 then p2.transparencyValue:map(function(_) --[[ line: 85 ]]
			return 0
		end) else p2.transparencyValue
	end, { var17, p2.transparencyValue })
	local var19 = useDictationTextAreaModule(var13, {
		transparencyValue = p2.transparencyValue,
		showPlaceholderText = p2.showPlaceholderText
	})
	local useLongPressOverlay = var14.useLongPressOverlay
	local micGestureHandlers = var13.micGestureHandlers
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		Name = "Background",
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xsmall radius-medium",
		backgroundStyle = var16
	}
	local t_1 = { Color = configModule.ChatInputBarBorderColor3 }
	local chatInputBarBorderTransparency = configModule.ChatInputBarBorderTransparency
	t_1.Transparency = p2.transparencyValue:map(function(p4) --[[ line: 30 ]]
		-- upvalues: chatInputBarBorderTransparency (ref)
		return chatInputBarBorderTransparency + (1 - chatInputBarBorderTransparency) * p4
	end)
	t.stroke = t_1
	local t_2 = {
		StopCountdown = reactModule.createElement(stopCountdownModule, {
			LayoutOrder = 1,
			countdownProgress = var13.dictation.bindings.countdownProgress,
			onActivated = var13.dictation.stopDictation,
			Visible = var13.dictation.bindings.isRecording
		})
	}
	local createElement_1 = reactModule.createElement
	local var23 = "Frame"
	local t_3 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(0, 0),
		SelectionBehaviorDown = p2.selectionBehavior,
		SelectionBehaviorLeft = p2.selectionBehavior,
		SelectionBehaviorRight = p2.selectionBehavior,
		SelectionBehaviorUp = p2.selectionBehavior,
		SelectionGroup = p2.selectionGroup
	}
	local t_4 = {}
	local createElement_2 = reactModule.createElement
	local t_5 = {}
	local var27 = 0
	t_5.transparency = p2.transparencyValue:map(function(p5) --[[ line: 30 ]]
		-- upvalues: var27 (ref)
		return var27 + (1 - var27) * p5
	end)
	t_5.onAbsoluteSizeChanged = p2.onChannelChipAbsoluteSizeChanged
	t_5.onChannelChipActivated = p2.onChannelChipActivated
	t_5.targetTextChannelDisplayName = p2.targetTextChannelDisplayName or ""
	t_5.isChannelBarVisible = p2.isChannelBarVisible
	t_5.developerChannelTabsEnabled = p2.developerChannelTabsEnabled
	t_4.TargetChannelChip = createElement_2(channelChipModule, t_5)
	local var28 = not p2.canLocalUserChat
	
	if var28 then
		var28 = reactModule.createElement
		local var29 = "TextLabel"
		local t_6 = {
			BackgroundTransparency = 1,
			TextWrapped = true,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = configModule.ChatInputBarFont,
			Text = p2.disabledChatPlaceholderText,
			Position = UDim2.fromScale(1, 0),
			Size = p2.targetChannelWidth:map(function(p6) --[[ line: 141 ]]
				return UDim2.new(1, -(p6 + 8), 0, 0)
			end),
			TextColor3 = if p2.showPlaceholderText then p2.chatInputBarSettings.PlaceholderColor3 else p2.chatInputBarSettings.TextColor3,
			TextSize = if p2.isSpatialUIEnabled then p2.chatInputBarSettings.SpatialPanelTextSize else p2.chatInputBarSettings.TextSize
		}
		local var31 = if p2.showPlaceholderText then 0.5 else 0
		t_6.TextTransparency = p2.transparencyValue:map(function(p7) --[[ line: 30 ]]
			-- upvalues: var31 (ref)
			return var31 + (1 - var31) * p7
		end)
		t_6.Selectable = p2.isPlaceholderSelectable
		t_6.SelectionImageObject = p2.placeholderSelectionImageObject
		t_6.TextXAlignment = Enum.TextXAlignment.Left
		t_6.TextYAlignment = Enum.TextYAlignment.Top
		t_6.ref = p2.placeholderRef
		var28 = var28(var29, t_6)
	end
	t_4.DisabledPlaceholderLabel = var28
	t_4.TextBoxContainer = p2.canLocalUserChat and (reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(1, 0),
		Size = p2.targetChannelWidth:map(function(p8) --[[ line: 165 ]]
			return UDim2.new(1, -(p8 + 8), 0, 0)
		end)
	}, {
		TextBox = reactModule.createElement("TextBox", {
			AnchorPoint = Vector2.new(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			FontFace = p2.chatInputBarSettings.FontFace,
			PlaceholderText = if p2.showPlaceholderText then p2.placeholderText else "",
			Selectable = p2.isTextBoxSelectable,
			SelectionImageObject = p2.cursor,
			Size = UDim2.fromScale(1, 0),
			Text = "",
			PlaceholderColor3 = p2.chatInputBarSettings.PlaceholderColor3,
			TextColor3 = p2.chatInputBarSettings.TextColor3,
			TextSize = if p2.isSpatialUIEnabled then p2.chatInputBarSettings.SpatialPanelTextSize else p2.chatInputBarSettings.TextSize,
			TextTransparency = var19.textTransparency,
			TextStrokeTransparency = var19.textStrokeTransparency,
			TextStrokeColor3 = p2.chatInputBarSettings.TextStrokeColor3,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 2,
			[reactModule.Event.Focused] = p2.onFocused,
			[reactModule.Event.FocusLost] = p2.onFocusLost,
			[reactModule.Change.Text] = p2.onTextChanged,
			[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = p2.onReturnPressedFromOnScreenKeyboard,
			ref = if p2.chatInputBarSettings.TextBox then p2.customTextBoxRef else p2.textBoxRef
		})
	}) or nil)
	t_4.WaveformOverlay = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 3,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.new(1, 0, 0, if p2.isSpatialUIEnabled then p2.chatInputBarSettings.SpatialPanelTextSize else p2.chatInputBarSettings.TextSize),
		Visible = var13.dictation.bindings.isAudioActive
	}, {
		List = reactModule.createElement(dictationWaveformModule, {
			isActive = var13.isRecording or var13.isListening,
			audioDeviceInput = var13.dictation.audioDeviceInput,
			transcribedSamplesBinding = var13.transcribedSamplesBinding,
			onSample = var13.onWaveformSample
		})
	})
	t_4.UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
	t_2.TextArea = createElement_1(var23, t_3, t_4)
	t_2.MicButton = reactModule.createElement(foundationModule.View, {
		tag = "auto-xy padding-xsmall",
		LayoutOrder = 3,
		ref = var13.micButtonSlotRef,
		GroupTransparency = var18
	}, {
		IconButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = var14.icon,
			size = foundationModule.Enums.InputSize.Small,
			variant = var14.variant,
			isDisabled = var14.isDisabled,
			onActivated = if useLongPressOverlay then function() --[[ line: 253 ]] end else var14.onActivated,
			Selectable = if useLongPressOverlay then false else nil
		}),
		InputTarget = if useLongPressOverlay and micGestureHandlers ~= nil then reactModule.createElement("TextButton", {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = "",
			ZIndex = 2,
			Selectable = true,
			SelectionImageObject = var13.micCursor,
			[reactModule.Event.Activated] = micGestureHandlers[reactModule.Event.Activated],
			[reactModule.Event.InputBegan] = micGestureHandlers[reactModule.Event.InputBegan],
			[reactModule.Event.InputEnded] = micGestureHandlers[reactModule.Event.InputEnded]
		}) else nil
	})
	t_2.FTUX = if fFlagExpChatDictationFTUXModule and var13.ftux and var13.ftux.shouldShow then reactModule.createElement(dictationFTUXModule, {
		anchorRef = var13.micButtonSlotRef,
		onDismiss = if fFlagExpChatDictationFTUXModule then var13.ftux.dismiss else nil
	}) else nil
	t_2.SendIcon = reactModule.createElement(foundationModule.Icon, {
		Visible = false,
		name = foundationModule.Enums.IconName.PaperAirplane,
		style = {
			Transparency = 0,
			Color3 = p2.chatInputBarSettings.PlaceholderColor3
		},
		size = foundationModule.Enums.IconSize.Small
	})
	
	return createElement(view, t, t_2)
end)