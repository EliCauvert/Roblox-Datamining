local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local expChatSharedModule = require(parent.ExpChatShared)
local configModule = require(expChat.Config)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatFixBackspaceNilTargetChannel = expChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local fFlagExpChatDictationFTUXModule = require(expChat.Flags.FFlagExpChatDictationFTUX)
local expChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
local fFlagExpChatInputBarV2CornerAndTruncationFixModule = require(expChat.Flags.FFlagExpChatInputBarV2CornerAndTruncationFix)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local channelChipModule = require(script.Parent.ChannelChip)
local stopCountdownModule = require(script.Parent.StopCountdown)
local dictationFTUXModule = require(script.Parent.Dictation.DictationFTUX)
local dictationWaveformModule = require(script.Parent.Dictation.DictationWaveform)
local useDictationInputBarModule = require(script.Parent.Dictation.useDictationInputBar)
local useDictationTextAreaModule = require(script.Parent.Dictation.useDictationTextArea)
local dictationAffordancesModule = require(script.Parent.Dictation.DictationAffordances)

local function _(startValue, endValue, alpha) --[[ line: 45 | named "lerp" ]]
	return startValue + (endValue - startValue) * alpha
end

return reactModule.memo(function(p0) --[[ line: 90 | named "ChatInputBarV2Dictation" ]]
	-- upvalues: foundationModule (ref), useDictationInputBarModule (ref), dictationAffordancesModule (ref), reactModule (ref), useDictationTextAreaModule (ref), fFlagExpChatInputBarV2CornerAndTruncationFixModule (ref), stopCountdownModule (ref), channelChipModule (ref), fFlagExpChatFixBackspaceNilTargetChannel (ref), fFlagExpChatUseMessagesStore (ref), configModule (ref), expChatFocusablePlaceholderText (ref), fFlagExpChatPresetChatEnabled (ref), fFlagEnableConsoleExpControls (ref), dictationWaveformModule (ref), fFlagExpChatDictationFTUXModule (ref), dictationFTUXModule (ref)
	local var16 = foundationModule.Hooks.useTokens()
	local setTransparency = p0.setTransparency
	local chatInputBarSettings = p0.chatInputBarSettings
	local isSpatialUIEnabled = p0.isSpatialUIEnabled
	local canLocalUserChatDerived = p0.canLocalUserChatDerived
	local targetChannelWidth = p0.targetChannelWidth
	local showPlaceholderText = p0.showPlaceholderText
	local var17 = p0.hasEmptyInputText == true
	local cursor = p0.cursor
	local var18 = useDictationInputBarModule({
		inputText = p0.inputText,
		setInputText = p0.setInputText,
		chatInputBarSettings = chatInputBarSettings,
		customTextBoxRef = p0.customTextBoxRef,
		textBoxRef = p0.textBoxRef,
		targetTextChannel = p0.targetTextChannel,
		isGlobalChatTabActive = p0.isGlobalChatTabActive,
		onDictationActivityChanged = p0.onDictationActivityChanged,
		onSendActivated = p0.onSendActivated,
		onSendRecordingTap = p0.onSendRecordingTap,
		onTranscriptionStaged = p0.onTranscriptionStaged
	})
	local var19 = dictationAffordancesModule.deriveMicSendButton(var18, {
		hasEmptyInputText = var17,
		idleSendIcon = foundationModule.Enums.IconName.ArrowMediumUp,
		idleSendVariant = if var17 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
		idleSendActivated = p0.onSendActivated,
		idleSendDisabled = var17
	})
	local var20 = dictationAffordancesModule.deriveBackgroundColors(var18, {
		defaultColor3 = chatInputBarSettings.BackgroundColor3,
		defaultTransparency = p0.chatInputBarBackgroundTransparency,
		listeningColor3 = var16.Color.Shift.Shift_200.Color3,
		listeningTransparency = var16.Color.Shift.Shift_200.Transparency
	})
	local var21 = reactModule.useMemo(function() --[[ line: 133 ]]
		-- upvalues: p0 (ref), var20 (ref)
		return p0.transparencyValue:map(function(p1) --[[ line: 134 ]]
			-- upvalues: var20 (copy)
			local t = { Color3 = var20.color3 }
			local baseTransparency = var20.baseTransparency
			t.Transparency = baseTransparency + (1 - baseTransparency) * p1
			
			return t
		end)
	end, {
		p0.transparencyValue,
		var20.color3,
		var20.baseTransparency
	})
	local var22 = dictationAffordancesModule.shouldPreventFade(var18)
	local var23 = reactModule.useMemo(function() --[[ line: 143 ]]
		-- upvalues: var22 (ref), p0 (ref)
		return if var22 then p0.transparencyValue:map(function(_) --[[ line: 145 ]]
			return 0
		end) else p0.transparencyValue
	end, { var22, p0.transparencyValue })
	local var24 = useDictationTextAreaModule(var18, {
		transparencyValue = p0.transparencyValue,
		showPlaceholderText = showPlaceholderText
	})
	local useLongPressOverlay = var19.useLongPressOverlay
	local micGestureHandlers = var18.micGestureHandlers
	local createElement = reactModule.createElement
	local var25 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var28 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local view = foundationModule.View
	local t_4 = {
		LayoutOrder = 1,
		tag = {
			["row align-y-center auto-y padding-x-xxsmall"] = true,
			["radius-circle"] = not fFlagExpChatInputBarV2CornerAndTruncationFixModule
		},
		cornerRadius = if fFlagExpChatInputBarV2CornerAndTruncationFixModule then UDim.new(0, 20) else nil,
		backgroundStyle = var21,
		stroke = {
			Color = var16.Color.Stroke.Default.Color3,
			Transparency = setTransparency(var16.Color.Stroke.Default.Transparency, p0.transparencyValue)
		},
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 0)
	}
	local t_5 = {
		StopCountdown = reactModule.createElement(stopCountdownModule, {
			LayoutOrder = 1,
			countdownProgress = var18.dictation.bindings.countdownProgress,
			onActivated = var18.dictation.stopDictation,
			Visible = var18.dictation.bindings.isRecording
		})
	}
	local createElement_3 = reactModule.createElement
	local var33 = "Frame"
	local t_6 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(0, 0)
	}
	local t_7 = {
		TargetChannelChip = reactModule.createElement(channelChipModule, {
			transparency = setTransparency(0, p0.transparencyValue),
			onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
			onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function() --[[ line: 203 ]]
				-- upvalues: p0 (ref)
				p0.resetTargetChannel(p0.isGlobalChatTabActive)
			end else p0.resetTargetChannel,
			targetTextChannelDisplayName = p0.targetTextChannelDisplayName or "",
			isChannelBarVisible = p0.isChannelBarVisible,
			developerChannelTabsEnabled = p0.developerChannelTabsEnabled
		})
	}
	local var36 = if fFlagExpChatUseMessagesStore then not canLocalUserChatDerived else not p0.canLocalUserChat
	
	if var36 then
		var36 = reactModule.createElement
		var36 = var36("TextLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = configModule.ChatInputBarFont,
			Text = p0.disabledChatPlaceholderText,
			Position = UDim2.fromScale(1, 0),
			Size = targetChannelWidth:map(function(p2) --[[ line: 220 ]]
				return UDim2.new(1, -(p2 + 8), 0, 0)
			end),
			TextColor3 = if showPlaceholderText then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
			TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize,
			TextTransparency = setTransparency(if showPlaceholderText then 0.5 else 0, p0.transparencyValue),
			Selectable = if expChatFocusablePlaceholderText then true else nil,
			SelectionImageObject = if expChatFocusablePlaceholderText then cursor else nil,
			TextWrapped = if fFlagExpChatInputBarV2CornerAndTruncationFixModule then not showPlaceholderText else not (fFlagExpChatPresetChatEnabled and (showPlaceholderText and p0.shouldTruncatePlaceholder)),
			TextTruncate = if fFlagExpChatInputBarV2CornerAndTruncationFixModule and showPlaceholderText then Enum.TextTruncate.AtEnd elseif fFlagExpChatPresetChatEnabled and showPlaceholderText then Enum.TextTruncate.AtEnd else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ref = if expChatFocusablePlaceholderText then p0.placeholderRef else nil
		})
	end
	t_7.DisabledPlaceholderLabel = var36
	local var37 = if fFlagExpChatUseMessagesStore then canLocalUserChatDerived else p0.canLocalUserChat
	
	if var37 then
		var37 = reactModule.createElement
		local var38 = "Frame"
		local t_8 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromScale(1, 0),
			Size = targetChannelWidth:map(function(p3) --[[ line: 257 ]]
				return UDim2.new(1, -(p3 + 8), 0, 0)
			end)
		}
		local t_9 = {}
		local var41 = if fFlagExpChatUseMessagesStore then canLocalUserChatDerived else p0.canLocalUserChat
		
		if var41 then
			var41 = reactModule.createElement
			var41 = var41("TextBox", {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				FontFace = chatInputBarSettings.FontFace,
				PlaceholderText = if showPlaceholderText then p0.placeholderText else "",
				Selectable = if fFlagEnableConsoleExpControls then true else nil,
				SelectionImageObject = cursor,
				Size = UDim2.fromScale(1, 0),
				Text = "",
				PlaceholderColor3 = chatInputBarSettings.PlaceholderColor3,
				TextColor3 = chatInputBarSettings.TextColor3,
				TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize,
				TextTransparency = var24.textTransparency,
				TextStrokeTransparency = var24.textStrokeTransparency,
				TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3,
				TextWrapped = if fFlagExpChatInputBarV2CornerAndTruncationFixModule then not showPlaceholderText else true,
				TextTruncate = if fFlagExpChatInputBarV2CornerAndTruncationFixModule and showPlaceholderText then Enum.TextTruncate.AtEnd else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ZIndex = 2,
				[reactModule.Event.Focused] = p0.onFocused,
				[reactModule.Event.FocusLost] = p0.onFocusLost,
				[reactModule.Change.Text] = p0.onTextChanged,
				[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = p0.onReturnPressedFromOnScreenKeyboard,
				ref = if chatInputBarSettings.TextBox then p0.customTextBoxRef else p0.textBoxRef
			})
		end
		t_9.TextBox = var41
		var37 = var37(var38, t_8, t_9)
	end
	t_7.TextBoxContainer = var37
	t_7.WaveformOverlay = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 3,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.new(1, 0, 0, if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize),
		Visible = var18.dictation.bindings.isAudioActive
	}, {
		List = reactModule.createElement(dictationWaveformModule, {
			isActive = var18.isRecording or var18.isListening,
			audioDeviceInput = var18.dictation.audioDeviceInput,
			transcribedSamplesBinding = var18.transcribedSamplesBinding,
			onSample = var18.onWaveformSample
		})
	})
	t_7.UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
	t_7.UIPadding = reactModule.createElement("UIPadding", {
		PaddingBottom = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, var16.Padding.Medium),
		PaddingRight = UDim.new(0, var16.Padding.Medium),
		PaddingTop = UDim.new(0, 10)
	})
	t_5.TextContainer = createElement_3(var33, t_6, t_7)
	t_5.SendButtonContainer = reactModule.createElement(foundationModule.View, {
		tag = "auto-xy padding-xxsmall",
		LayoutOrder = 3,
		ref = var18.micButtonSlotRef,
		GroupTransparency = var23
	}, {
		SendButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = var19.icon,
			variant = var19.variant,
			size = foundationModule.Enums.InputSize.Small,
			isDisabled = var19.isDisabled,
			Selectable = if useLongPressOverlay then false else nil,
			onActivated = if useLongPressOverlay then function() --[[ line: 359 ]] end else var19.onActivated
		}),
		InputTarget = if useLongPressOverlay and micGestureHandlers ~= nil then reactModule.createElement("TextButton", {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = "",
			ZIndex = 2,
			Selectable = true,
			SelectionImageObject = var18.micCursor,
			[reactModule.Event.Activated] = micGestureHandlers[reactModule.Event.Activated],
			[reactModule.Event.InputBegan] = micGestureHandlers[reactModule.Event.InputBegan],
			[reactModule.Event.InputEnded] = micGestureHandlers[reactModule.Event.InputEnded]
		}) else nil
	})
	t_5.FTUX = if fFlagExpChatDictationFTUXModule and var18.ftux and var18.ftux.shouldShow then reactModule.createElement(dictationFTUXModule, {
		anchorRef = var18.micButtonSlotRef,
		onDismiss = if fFlagExpChatDictationFTUXModule then var18.ftux.dismiss else nil
	}) else nil
	t_3.InputGroup = createElement_2(view, t_4, t_5)
	t_1.Container = createElement_1(var28, t_2, t_3)
	
	return createElement(var25, t, t_1)
end)