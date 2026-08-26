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

local function _(startValue, endValue, alpha)
	return startValue + (endValue - startValue) * alpha
end

local _ = function(value, p1)
	return p1:map(function(p2)
		-- upvalues: value (ref)
		return value + (1 - value) * p2
	end)
end

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), useDictationInputBarModule (ref), dictationAffordancesModule (ref), reactModule (ref), useDictationTextAreaModule (ref), configModule (ref), stopCountdownModule (ref), channelChipModule (ref), dictationWaveformModule (ref), fFlagExpChatDictationFTUXModule (ref), dictationFTUXModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = useDictationInputBarModule({
		inputText = p1.inputText,
		setInputText = p1.setInputText,
		chatInputBarSettings = p1.chatInputBarSettings,
		customTextBoxRef = p1.customTextBoxRef,
		textBoxRef = p1.textBoxRef,
		targetTextChannel = p1.targetTextChannel,
		isGlobalChatTabActive = p1.isGlobalChatTabActive,
		onDictationActivityChanged = p1.onDictationActivityChanged,
		onSendRecordingTap = p1.onSendRecordingTap,
		onTranscriptionStaged = p1.onTranscriptionStaged
	})
	local var3 = dictationAffordancesModule.deriveMicSendButton(var2, {
		idleSendDisabled = false,
		hasEmptyInputText = p1.inputText == "",
		idleSendIcon = foundationModule.Enums.IconName.PaperAirplane,
		idleSendVariant = foundationModule.Enums.ButtonVariant.Emphasis,
		idleSendActivated = p1.onSendActivated
	})
	local var4 = dictationAffordancesModule.deriveBackgroundColors(var2, {
		defaultColor3 = p1.chatInputBarSettings.BackgroundColor3,
		defaultTransparency = p1.chatInputBarBackgroundTransparency,
		listeningColor3 = var1.Color.Shift.Shift_200.Color3,
		listeningTransparency = var1.Color.Shift.Shift_200.Transparency
	})
	local var5 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var4 (ref)
		return p1.transparencyValue:map(function(p2)
			-- upvalues: var4 (copy)
			local t = { Color3 = var4.color3 }
			local baseTransparency = var4.baseTransparency
			t.Transparency = baseTransparency + (1 - baseTransparency) * p2
			
			return t
		end)
	end, {
		p1.transparencyValue,
		var4.color3,
		var4.baseTransparency
	})
	local var6 = dictationAffordancesModule.shouldPreventFade(var2)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), p1 (ref)
		return if var6 then p1.transparencyValue:map(function(_)
			return 0
		end) else p1.transparencyValue
	end, { var6, p1.transparencyValue })
	local var8 = useDictationTextAreaModule(var2, {
		transparencyValue = p1.transparencyValue,
		showPlaceholderText = p1.showPlaceholderText
	})
	local useLongPressOverlay = var3.useLongPressOverlay
	local micGestureHandlers = var2.micGestureHandlers
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		Name = "Background",
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xsmall radius-medium",
		backgroundStyle = var5
	}
	local t_1 = { Color = configModule.ChatInputBarBorderColor3 }
	local chatInputBarBorderTransparency = configModule.ChatInputBarBorderTransparency
	t_1.Transparency = p1.transparencyValue:map(function(p2)
		-- upvalues: chatInputBarBorderTransparency (ref)
		return chatInputBarBorderTransparency + (1 - chatInputBarBorderTransparency) * p2
	end)
	t.stroke = t_1
	local t_2 = {
		StopCountdown = reactModule.createElement(stopCountdownModule, {
			LayoutOrder = 1,
			countdownProgress = var2.dictation.bindings.countdownProgress,
			onActivated = var2.dictation.stopDictation,
			Visible = var2.dictation.bindings.isRecording
		})
	}
	local createElement_1 = reactModule.createElement
	local var9 = "Frame"
	local t_3 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(0, 0),
		SelectionBehaviorDown = p1.selectionBehavior,
		SelectionBehaviorLeft = p1.selectionBehavior,
		SelectionBehaviorRight = p1.selectionBehavior,
		SelectionBehaviorUp = p1.selectionBehavior,
		SelectionGroup = p1.selectionGroup
	}
	local t_4 = {}
	local createElement_2 = reactModule.createElement
	local t_5 = {}
	local var10 = 0
	t_5.transparency = p1.transparencyValue:map(function(p2)
		-- upvalues: var10 (ref)
		return var10 + (1 - var10) * p2
	end)
	t_5.onAbsoluteSizeChanged = p1.onChannelChipAbsoluteSizeChanged
	t_5.onChannelChipActivated = p1.onChannelChipActivated
	t_5.targetTextChannelDisplayName = p1.targetTextChannelDisplayName or ""
	t_5.isChannelBarVisible = p1.isChannelBarVisible
	t_5.developerChannelTabsEnabled = p1.developerChannelTabsEnabled
	t_4.TargetChannelChip = createElement_2(channelChipModule, t_5)
	local var11 = not p1.canLocalUserChat
	
	if var11 then
		var11 = reactModule.createElement
		local var12 = "TextLabel"
		local t_6 = {
			BackgroundTransparency = 1,
			TextWrapped = true,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = configModule.ChatInputBarFont,
			Text = p1.disabledChatPlaceholderText,
			Position = UDim2.fromScale(1, 0),
			Size = p1.targetChannelWidth:map(function(p2)
				return UDim2.new(1, -(p2 + 8), 0, 0)
			end),
			TextColor3 = if p1.showPlaceholderText then p1.chatInputBarSettings.PlaceholderColor3 else p1.chatInputBarSettings.TextColor3,
			TextSize = if p1.isSpatialUIEnabled then p1.chatInputBarSettings.SpatialPanelTextSize else p1.chatInputBarSettings.TextSize
		}
		local var13 = if p1.showPlaceholderText then 0.5 else 0
		t_6.TextTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var13 (ref)
			return var13 + (1 - var13) * p2
		end)
		t_6.Selectable = p1.isPlaceholderSelectable
		t_6.SelectionImageObject = p1.placeholderSelectionImageObject
		t_6.TextXAlignment = Enum.TextXAlignment.Left
		t_6.TextYAlignment = Enum.TextYAlignment.Top
		t_6.ref = p1.placeholderRef
		var11 = var11(var12, t_6)
	end
	t_4.DisabledPlaceholderLabel = var11
	t_4.TextBoxContainer = p1.canLocalUserChat and (reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(1, 0),
		Size = p1.targetChannelWidth:map(function(p2)
			return UDim2.new(1, -(p2 + 8), 0, 0)
		end)
	}, {
		TextBox = reactModule.createElement("TextBox", {
			AnchorPoint = Vector2.new(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			FontFace = p1.chatInputBarSettings.FontFace,
			PlaceholderText = if p1.showPlaceholderText then p1.placeholderText else "",
			Selectable = p1.isTextBoxSelectable,
			SelectionImageObject = p1.cursor,
			Size = UDim2.fromScale(1, 0),
			Text = "",
			PlaceholderColor3 = p1.chatInputBarSettings.PlaceholderColor3,
			TextColor3 = p1.chatInputBarSettings.TextColor3,
			TextSize = if p1.isSpatialUIEnabled then p1.chatInputBarSettings.SpatialPanelTextSize else p1.chatInputBarSettings.TextSize,
			TextTransparency = var8.textTransparency,
			TextStrokeTransparency = var8.textStrokeTransparency,
			TextStrokeColor3 = p1.chatInputBarSettings.TextStrokeColor3,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 2,
			[reactModule.Event.Focused] = p1.onFocused,
			[reactModule.Event.FocusLost] = p1.onFocusLost,
			[reactModule.Change.Text] = p1.onTextChanged,
			[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.onReturnPressedFromOnScreenKeyboard,
			ref = if p1.chatInputBarSettings.TextBox then p1.customTextBoxRef else p1.textBoxRef
		})
	}) or nil)
	t_4.WaveformOverlay = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 3,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.new(1, 0, 0, if p1.isSpatialUIEnabled then p1.chatInputBarSettings.SpatialPanelTextSize else p1.chatInputBarSettings.TextSize),
		Visible = var2.dictation.bindings.isAudioActive
	}, {
		List = reactModule.createElement(dictationWaveformModule, {
			isActive = var2.isRecording or var2.isListening,
			audioDeviceInput = var2.dictation.audioDeviceInput,
			transcribedSamplesBinding = var2.transcribedSamplesBinding,
			onSample = var2.onWaveformSample
		})
	})
	t_4.UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
	t_2.TextArea = createElement_1(var9, t_3, t_4)
	t_2.MicButton = reactModule.createElement(foundationModule.View, {
		tag = "auto-xy padding-xsmall",
		LayoutOrder = 3,
		ref = var2.micButtonSlotRef,
		GroupTransparency = var7
	}, {
		IconButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = var3.icon,
			size = foundationModule.Enums.InputSize.Small,
			variant = var3.variant,
			isDisabled = var3.isDisabled,
			onActivated = if useLongPressOverlay then function() end else var3.onActivated,
			Selectable = if useLongPressOverlay then false else nil
		}),
		InputTarget = if useLongPressOverlay and micGestureHandlers ~= nil then reactModule.createElement("TextButton", {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = "",
			ZIndex = 2,
			Selectable = true,
			SelectionImageObject = var2.micCursor,
			[reactModule.Event.Activated] = micGestureHandlers[reactModule.Event.Activated],
			[reactModule.Event.InputBegan] = micGestureHandlers[reactModule.Event.InputBegan],
			[reactModule.Event.InputEnded] = micGestureHandlers[reactModule.Event.InputEnded]
		}) else nil
	})
	t_2.FTUX = if fFlagExpChatDictationFTUXModule and var2.ftux and var2.ftux.shouldShow then reactModule.createElement(dictationFTUXModule, {
		anchorRef = var2.micButtonSlotRef,
		onDismiss = if fFlagExpChatDictationFTUXModule then var2.ftux.dismiss else nil
	}) else nil
	t_2.SendIcon = reactModule.createElement(foundationModule.Icon, {
		Visible = false,
		name = foundationModule.Enums.IconName.PaperAirplane,
		style = {
			Transparency = 0,
			Color3 = p1.chatInputBarSettings.PlaceholderColor3
		},
		size = foundationModule.Enums.IconSize.Small
	})
	
	return createElement(view, t, t_2)
end)