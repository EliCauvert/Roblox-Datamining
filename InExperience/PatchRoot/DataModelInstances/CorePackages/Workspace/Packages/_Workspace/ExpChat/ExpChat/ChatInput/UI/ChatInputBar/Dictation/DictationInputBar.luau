local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagExpChatDictationFTUXModule = require(ExpChat.Flags.FFlagExpChatDictationFTUX)
local ConfigModule = require(ExpChat.Config)
local ChannelChipModule = require(script.Parent.Parent.ChannelChip)
local DictationFTUXModule = require(script.Parent.DictationFTUX)
local StopCountdownModule = require(script.Parent.Parent.StopCountdown)
local DictationWaveformModule = require(script.Parent.DictationWaveform)
local UseDictationInputBarModule = require(script.Parent.useDictationInputBar)
local UseDictationTextAreaModule = require(script.Parent.useDictationTextArea)
local DictationAffordancesModule = require(script.Parent.DictationAffordances)

local function _(p1, p2, p3)
	return p1 + (p2 - p1) * p3
end

local _ = function(p1, p2)
	return p2:map(function(p3): number
		-- upvalues: p1 (copy)
		return p1 + (1 - p1) * p3
	end)
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), UseDictationInputBarModule (copy), DictationAffordancesModule (copy), ReactModule (copy), UseDictationTextAreaModule (copy), ConfigModule (copy), StopCountdownModule (copy), ChannelChipModule (copy), DictationWaveformModule (copy), FFlagExpChatDictationFTUXModule (copy), DictationFTUXModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseDictationInputBarModuleResult = UseDictationInputBarModule({
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
	local DeriveMicSendButtonResult = DictationAffordancesModule.deriveMicSendButton(UseDictationInputBarModuleResult, {
		idleSendDisabled = false,
		hasEmptyInputText = p1.inputText == "",
		idleSendIcon = FoundationModule.Enums.IconName.PaperAirplane,
		idleSendVariant = FoundationModule.Enums.ButtonVariant.Emphasis,
		idleSendActivated = p1.onSendActivated
	})
	local DeriveBackgroundColorsResult = DictationAffordancesModule.deriveBackgroundColors(UseDictationInputBarModuleResult, {
		defaultColor3 = p1.chatInputBarSettings.BackgroundColor3,
		defaultTransparency = p1.chatInputBarBackgroundTransparency,
		listeningColor3 = UseTokensResult.Color.Shift.Shift_200.Color3,
		listeningTransparency = UseTokensResult.Color.Shift.Shift_200.Transparency
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), DeriveBackgroundColorsResult (copy)
		return p1.transparencyValue:map(function(p2)
			-- upvalues: DeriveBackgroundColorsResult (upval)
			local BaseTransparency: number = DeriveBackgroundColorsResult.baseTransparency
			
			return {
				Color3 = DeriveBackgroundColorsResult.color3,
				Transparency = BaseTransparency + (1 - BaseTransparency) * p2
			}
		end)
	end, {
		p1.transparencyValue,
		DeriveBackgroundColorsResult.color3,
		DeriveBackgroundColorsResult.baseTransparency
	})
	local ShouldPreventFade = DictationAffordancesModule.shouldPreventFade(UseDictationInputBarModuleResult)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ShouldPreventFade (copy), p1 (copy)
		return if ShouldPreventFade then p1.transparencyValue:map(function(_): number
			return 0
		end) else p1.transparencyValue
	end, { ShouldPreventFade, p1.transparencyValue })
	local UseDictationTextAreaModuleResult = UseDictationTextAreaModule(UseDictationInputBarModuleResult, {
		transparencyValue = p1.transparencyValue,
		showPlaceholderText = p1.showPlaceholderText
	})
	local UseLongPressOverlay = DeriveMicSendButtonResult.useLongPressOverlay
	local MicGestureHandlers = UseDictationInputBarModuleResult.micGestureHandlers
	local CreateElementFunction1 = ReactModule.createElement
	local View = FoundationModule.View
	local ChatInputBarBorderTransparency = ConfigModule.ChatInputBarBorderTransparency
	local config = {
		Name = "Background",
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xsmall radius-medium",
		backgroundStyle = UseMemoResult,
		stroke = {
			Color = ConfigModule.ChatInputBarBorderColor3,
			Transparency = p1.transparencyValue:map(function(p2): number
				-- upvalues: ChatInputBarBorderTransparency (copy)
				return ChatInputBarBorderTransparency + (1 - ChatInputBarBorderTransparency) * p2
			end)
		}
	}
	local config1 = {
		StopCountdown = ReactModule.createElement(StopCountdownModule, {
			LayoutOrder = 1,
			countdownProgress = UseDictationInputBarModuleResult.dictation.bindings.countdownProgress,
			onActivated = UseDictationInputBarModuleResult.dictation.stopDictation,
			Visible = UseDictationInputBarModuleResult.dictation.bindings.isRecording
		})
	}
	local CreateElementFunction = ReactModule.createElement
	local v1 = "Frame"
	local config2 = {
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
	local v2 = 0
	local config3 = {
		TargetChannelChip = ReactModule.createElement(ChannelChipModule, {
			transparency = p1.transparencyValue:map(function(p2): number
				-- upvalues: v2 (copy)
				return v2 + (1 - v2) * p2
			end),
			onAbsoluteSizeChanged = p1.onChannelChipAbsoluteSizeChanged,
			onChannelChipActivated = p1.onChannelChipActivated,
			targetTextChannelDisplayName = p1.targetTextChannelDisplayName or "",
			isChannelBarVisible = p1.isChannelBarVisible,
			developerChannelTabsEnabled = p1.developerChannelTabsEnabled
		})
	}
	local NoCanLocalUserChat = not p1.canLocalUserChat
	
	if NoCanLocalUserChat then
		local v3: number = if p1.showPlaceholderText then 0.5 else 0
		NoCanLocalUserChat = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = ConfigModule.ChatInputBarFont,
			Text = p1.disabledChatPlaceholderText,
			Position = UDim2.fromScale(1, 0),
			Size = p1.targetChannelWidth:map(function(p2: number): UDim2
				return UDim2.new(1, -(p2 + 8), 0, 0)
			end),
			TextColor3 = p1.showPlaceholderText and p1.chatInputBarSettings.PlaceholderColor3 or p1.chatInputBarSettings.TextColor3,
			TextSize = if p1.isSpatialUIEnabled then p1.chatInputBarSettings.SpatialPanelTextSize else p1.chatInputBarSettings.TextSize,
			TextTransparency = p1.transparencyValue:map(function(p2): number
				-- upvalues: v3 (copy)
				return v3 + (1 - v3) * p2
			end),
			Selectable = p1.isPlaceholderSelectable,
			SelectionImageObject = p1.placeholderSelectionImageObject,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ref = p1.placeholderRef
		})
	end
	config3.DisabledPlaceholderLabel = NoCanLocalUserChat
	config3.TextBoxContainer = p1.canLocalUserChat and ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(1, 0),
		Size = p1.targetChannelWidth:map(function(p2: number): UDim2
			return UDim2.new(1, -(p2 + 8), 0, 0)
		end)
	}, {
		TextBox = ReactModule.createElement("TextBox", {
			AnchorPoint = Vector2.new(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			FontFace = p1.chatInputBarSettings.FontFace,
			PlaceholderText = p1.showPlaceholderText and p1.placeholderText or "",
			Selectable = p1.isTextBoxSelectable,
			SelectionImageObject = p1.cursor,
			Size = UDim2.fromScale(1, 0),
			Text = "",
			PlaceholderColor3 = p1.chatInputBarSettings.PlaceholderColor3,
			TextColor3 = p1.chatInputBarSettings.TextColor3,
			TextSize = if p1.isSpatialUIEnabled then p1.chatInputBarSettings.SpatialPanelTextSize else p1.chatInputBarSettings.TextSize,
			TextTransparency = UseDictationTextAreaModuleResult.textTransparency,
			TextStrokeTransparency = UseDictationTextAreaModuleResult.textStrokeTransparency,
			TextStrokeColor3 = p1.chatInputBarSettings.TextStrokeColor3,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 2,
			[ReactModule.Event.Focused] = p1.onFocused,
			[ReactModule.Event.FocusLost] = p1.onFocusLost,
			[ReactModule.Change.Text] = p1.onTextChanged,
			[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.onReturnPressedFromOnScreenKeyboard,
			ref = if p1.chatInputBarSettings.TextBox then p1.customTextBoxRef else p1.textBoxRef
		})
	}) or nil
	config3.WaveformOverlay = ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 3,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.new(1, 0, 0, if p1.isSpatialUIEnabled then p1.chatInputBarSettings.SpatialPanelTextSize else p1.chatInputBarSettings.TextSize),
		Visible = UseDictationInputBarModuleResult.dictation.bindings.isAudioActive
	}, {
		List = ReactModule.createElement(DictationWaveformModule, {
			isActive = UseDictationInputBarModuleResult.isRecording or UseDictationInputBarModuleResult.isListening,
			audioDeviceInput = UseDictationInputBarModuleResult.dictation.audioDeviceInput,
			transcribedSamplesBinding = UseDictationInputBarModuleResult.transcribedSamplesBinding,
			onSample = UseDictationInputBarModuleResult.onWaveformSample
		})
	})
	config3.UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
	config1.TextArea = CreateElementFunction(v1, config2, config3)
	config1.MicButton = ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy padding-xsmall",
		LayoutOrder = 3,
		ref = UseDictationInputBarModuleResult.micButtonSlotRef,
		GroupTransparency = UseMemoResult1
	}, {
		IconButton = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			icon = DeriveMicSendButtonResult.icon,
			size = FoundationModule.Enums.InputSize.Small,
			variant = DeriveMicSendButtonResult.variant,
			isDisabled = DeriveMicSendButtonResult.isDisabled,
			onActivated = if UseLongPressOverlay then function() end else DeriveMicSendButtonResult.onActivated,
			Selectable = not UseLongPressOverlay and nil
		}),
		InputTarget = if UseLongPressOverlay and MicGestureHandlers ~= nil then ReactModule.createElement("TextButton", {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = "",
			ZIndex = 2,
			Selectable = true,
			SelectionImageObject = UseDictationInputBarModuleResult.micCursor,
			[ReactModule.Event.Activated] = MicGestureHandlers[ReactModule.Event.Activated],
			[ReactModule.Event.InputBegan] = MicGestureHandlers[ReactModule.Event.InputBegan],
			[ReactModule.Event.InputEnded] = MicGestureHandlers[ReactModule.Event.InputEnded]
		}) else nil
	})
	config1.FTUX = if FFlagExpChatDictationFTUXModule and UseDictationInputBarModuleResult.ftux and UseDictationInputBarModuleResult.ftux.shouldShow then ReactModule.createElement(DictationFTUXModule, {
		anchorRef = UseDictationInputBarModuleResult.micButtonSlotRef,
		onDismiss = if FFlagExpChatDictationFTUXModule then UseDictationInputBarModuleResult.ftux.dismiss else nil
	}) else nil
	config1.SendIcon = ReactModule.createElement(FoundationModule.Icon, {
		Visible = false,
		name = FoundationModule.Enums.IconName.PaperAirplane,
		style = {
			Transparency = 0,
			Color3 = p1.chatInputBarSettings.PlaceholderColor3
		},
		size = FoundationModule.Enums.IconSize.Small
	})
	
	return CreateElementFunction1(View, config, config1)
end)