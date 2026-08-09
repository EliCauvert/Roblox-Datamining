local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local configModule = require(expChat.Config)
local fFlagExpChatPresetChatEnabled = require(parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatDictationFTUXModule = require(expChat.Flags.FFlagExpChatDictationFTUX)
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
local expChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
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

local function _(startValue, endValue, alpha) --[[ line: 43 | named "lerp" ]]
	return startValue + (endValue - startValue) * alpha
end

return reactModule.memo(function(p0) --[[ line: 88 | named "ChatInputBarV2Dictation" ]]
	-- upvalues: foundationModule (ref), useDictationInputBarModule (ref), dictationAffordancesModule (ref), reactModule (ref), useDictationTextAreaModule (ref), stopCountdownModule (ref), fFlagEnableConsoleExpControls (ref), fFlagExpChatEnableFocusNavigationModule (ref), channelChipModule (ref), fFlagExpChatUseMessagesStore (ref), configModule (ref), expChatFocusablePlaceholderText (ref), fFlagExpChatPresetChatEnabled (ref), dictationWaveformModule (ref), fFlagExpChatDictationFTUXModule (ref), dictationFTUXModule (ref)
	local var15 = foundationModule.Hooks.useTokens()
	local setTransparency = p0.setTransparency
	local chatInputBarSettings = p0.chatInputBarSettings
	local isSpatialUIEnabled = p0.isSpatialUIEnabled
	local canLocalUserChatDerived = p0.canLocalUserChatDerived
	local targetChannelWidth = p0.targetChannelWidth
	local showPlaceholderText = p0.showPlaceholderText
	local var16 = p0.hasEmptyInputText == true
	local cursor = p0.cursor
	local var17 = useDictationInputBarModule({
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
	local var18 = dictationAffordancesModule.deriveMicSendButton(var17, {
		hasEmptyInputText = var16,
		idleSendIcon = foundationModule.Enums.IconName.ArrowMediumUp,
		idleSendVariant = if var16 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
		idleSendActivated = p0.onSendActivated,
		idleSendDisabled = var16
	})
	local var19 = dictationAffordancesModule.deriveBackgroundColors(var17, {
		defaultColor3 = chatInputBarSettings.BackgroundColor3,
		defaultTransparency = p0.chatInputBarBackgroundTransparency,
		listeningColor3 = var15.Color.Shift.Shift_200.Color3,
		listeningTransparency = var15.Color.Shift.Shift_200.Transparency
	})
	local var20 = reactModule.useMemo(function() --[[ line: 131 ]]
		-- upvalues: p0 (ref), var19 (ref)
		return p0.transparencyValue:map(function(p1) --[[ line: 132 ]]
			-- upvalues: var19 (copy)
			local t = { Color3 = var19.color3 }
			local baseTransparency = var19.baseTransparency
			t.Transparency = baseTransparency + (1 - baseTransparency) * p1
			
			return t
		end)
	end, {
		p0.transparencyValue,
		var19.color3,
		var19.baseTransparency
	})
	local var21 = dictationAffordancesModule.shouldPreventFade(var17)
	local var22 = reactModule.useMemo(function() --[[ line: 141 ]]
		-- upvalues: var21 (ref), p0 (ref)
		return if var21 then p0.transparencyValue:map(function(_) --[[ line: 143 ]]
			return 0
		end) else p0.transparencyValue
	end, { var21, p0.transparencyValue })
	local var23 = useDictationTextAreaModule(var17, {
		transparencyValue = p0.transparencyValue,
		showPlaceholderText = showPlaceholderText
	})
	local useLongPressOverlay = var18.useLongPressOverlay
	local micGestureHandlers = var17.micGestureHandlers
	local createElement = reactModule.createElement
	local var24 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var27 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local view = foundationModule.View
	local t_4 = {
		tag = "row align-y-center auto-y padding-x-xxsmall radius-circle",
		LayoutOrder = 1,
		backgroundStyle = var20,
		stroke = {
			Color = var15.Color.Stroke.Default.Color3,
			Transparency = setTransparency(var15.Color.Stroke.Default.Transparency, p0.transparencyValue)
		},
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 0)
	}
	local t_5 = {
		StopCountdown = reactModule.createElement(stopCountdownModule, {
			LayoutOrder = 1,
			countdownProgress = var17.dictation.bindings.countdownProgress,
			onActivated = var17.dictation.stopDictation,
			Visible = var17.dictation.bindings.isRecording
		})
	}
	local createElement_3 = reactModule.createElement
	local var32 = "Frame"
	local t_6 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		SelectionBehaviorDown = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorLeft = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorRight = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorUp = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
		SelectionGroup = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then true else nil,
		Size = UDim2.fromScale(0, 0)
	}
	local t_7 = {
		TargetChannelChip = reactModule.createElement(channelChipModule, {
			transparency = setTransparency(0, p0.transparencyValue),
			onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
			onChannelChipActivated = p0.resetTargetChannel,
			targetTextChannelDisplayName = p0.targetTextChannelDisplayName or "",
			isChannelBarVisible = p0.isChannelBarVisible,
			developerChannelTabsEnabled = p0.developerChannelTabsEnabled
		})
	}
	local var35 = if fFlagExpChatUseMessagesStore then not canLocalUserChatDerived else not p0.canLocalUserChat
	
	if var35 then
		var35 = reactModule.createElement
		var35 = var35("TextLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = configModule.ChatInputBarFont,
			Text = p0.disabledChatPlaceholderText,
			Position = UDim2.fromScale(1, 0),
			Size = targetChannelWidth:map(function(p2) --[[ line: 229 ]]
				return UDim2.new(1, -(p2 + 8), 0, 0)
			end),
			TextColor3 = if showPlaceholderText then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
			TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize,
			TextTransparency = setTransparency(if showPlaceholderText then 0.5 else 0, p0.transparencyValue),
			Selectable = if expChatFocusablePlaceholderText then true else nil,
			SelectionImageObject = if expChatFocusablePlaceholderText then cursor else nil,
			TextWrapped = not (fFlagExpChatPresetChatEnabled and (showPlaceholderText and p0.shouldTruncatePlaceholder)),
			TextTruncate = if fFlagExpChatPresetChatEnabled and showPlaceholderText then Enum.TextTruncate.AtEnd else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ref = if expChatFocusablePlaceholderText then p0.placeholderRef else nil
		})
	end
	t_7.DisabledPlaceholderLabel = var35
	t_7.TextBoxContainer = (if fFlagExpChatUseMessagesStore then canLocalUserChatDerived else p0.canLocalUserChat) and reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(1, 0),
		Size = targetChannelWidth:map(function(p3) --[[ line: 263 ]]
			return UDim2.new(1, -(p3 + 8), 0, 0)
		end)
	}, {
		TextBox = (if fFlagExpChatUseMessagesStore then canLocalUserChatDerived else p0.canLocalUserChat) and reactModule.createElement("TextBox", {
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
			TextTransparency = var23.textTransparency,
			TextStrokeTransparency = var23.textStrokeTransparency,
			TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 2,
			[reactModule.Event.Focused] = p0.onFocused,
			[reactModule.Event.FocusLost] = p0.onFocusLost,
			[reactModule.Change.Text] = p0.onTextChanged,
			[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = p0.onReturnPressedFromOnScreenKeyboard,
			ref = if chatInputBarSettings.TextBox then p0.customTextBoxRef else p0.textBoxRef
		})
	})
	t_7.WaveformOverlay = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 3,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.new(1, 0, 0, if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize),
		Visible = var17.dictation.bindings.isAudioActive
	}, {
		List = reactModule.createElement(dictationWaveformModule, {
			isActive = var17.isRecording or var17.isListening,
			audioDeviceInput = var17.dictation.audioDeviceInput,
			transcribedSamplesBinding = var17.transcribedSamplesBinding,
			onSample = var17.onWaveformSample
		})
	})
	t_7.UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
	t_7.UIPadding = reactModule.createElement("UIPadding", {
		PaddingBottom = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, var15.Padding.Medium),
		PaddingRight = UDim.new(0, var15.Padding.Medium),
		PaddingTop = UDim.new(0, 10)
	})
	t_5.TextContainer = createElement_3(var32, t_6, t_7)
	t_5.SendButtonContainer = reactModule.createElement(foundationModule.View, {
		tag = "auto-xy padding-xxsmall",
		LayoutOrder = 3,
		ref = var17.micButtonSlotRef,
		GroupTransparency = var22
	}, {
		SendButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = var18.icon,
			variant = var18.variant,
			size = foundationModule.Enums.InputSize.Small,
			isDisabled = var18.isDisabled,
			Selectable = if useLongPressOverlay then false else nil,
			onActivated = if useLongPressOverlay then function() --[[ line: 359 ]] end else var18.onActivated
		}),
		InputTarget = if useLongPressOverlay and micGestureHandlers ~= nil then reactModule.createElement("TextButton", {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = "",
			ZIndex = 2,
			Selectable = true,
			SelectionImageObject = var17.micCursor,
			[reactModule.Event.Activated] = micGestureHandlers[reactModule.Event.Activated],
			[reactModule.Event.InputBegan] = micGestureHandlers[reactModule.Event.InputBegan],
			[reactModule.Event.InputEnded] = micGestureHandlers[reactModule.Event.InputEnded]
		}) else nil
	})
	t_5.FTUX = if fFlagExpChatDictationFTUXModule and var17.ftux and var17.ftux.shouldShow then reactModule.createElement(dictationFTUXModule, {
		anchorRef = var17.micButtonSlotRef,
		onDismiss = if fFlagExpChatDictationFTUXModule then var17.ftux.dismiss else nil
	}) else nil
	t_3.InputGroup = createElement_2(view, t_4, t_5)
	t_1.Container = createElement_1(var27, t_2, t_3)
	
	return createElement(var24, t, t_1)
end)