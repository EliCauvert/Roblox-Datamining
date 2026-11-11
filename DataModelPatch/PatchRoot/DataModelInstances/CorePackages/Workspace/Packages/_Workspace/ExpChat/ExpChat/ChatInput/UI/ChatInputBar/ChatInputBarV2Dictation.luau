local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ConfigModule = require(ExpChat.Config)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatFixBackspaceNilTargetChannel = ExpChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local FFlagExpChatDictationFTUXModule = require(ExpChat.Flags.FFlagExpChatDictationFTUX)
local FFlagExpChatEnableFocusNavigationModule = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local ExpChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local ChannelChipModule = require(script.Parent.ChannelChip)
local StopCountdownModule = require(script.Parent.StopCountdown)
local DictationFTUXModule = require(script.Parent.Dictation.DictationFTUX)
local DictationWaveformModule = require(script.Parent.Dictation.DictationWaveform)
local UseDictationInputBarModule = require(script.Parent.Dictation.useDictationInputBar)
local UseDictationTextAreaModule = require(script.Parent.Dictation.useDictationTextArea)
local DictationAffordancesModule = require(script.Parent.Dictation.DictationAffordances)

local function _(p1, p2, p3)
	return p1 + (p2 - p1) * p3
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), UseDictationInputBarModule (copy), DictationAffordancesModule (copy), ReactModule (copy), UseDictationTextAreaModule (copy), StopCountdownModule (copy), FFlagEnableConsoleExpControls (copy), FFlagExpChatEnableFocusNavigationModule (copy), ChannelChipModule (copy), FFlagExpChatFixBackspaceNilTargetChannel (copy), FFlagExpChatUseMessagesStore (copy), ConfigModule (copy), ExpChatFocusablePlaceholderText (copy), FFlagExpChatPresetChatEnabled (copy), DictationWaveformModule (copy), FFlagExpChatDictationFTUXModule (copy), DictationFTUXModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local SetTransparencyFunction = p1.setTransparency
	local ChatInputBarSettings = p1.chatInputBarSettings
	local IsSpatialUIEnabled = p1.isSpatialUIEnabled
	local CanLocalUserChatDerived = p1.canLocalUserChatDerived
	local TargetChannelWidth = p1.targetChannelWidth
	local ShowPlaceholderText = p1.showPlaceholderText
	local IsHasEmptyInputText = p1.hasEmptyInputText == true
	local Cursor = p1.cursor
	local UseDictationInputBarModuleResult = UseDictationInputBarModule({
		inputText = p1.inputText,
		setInputText = p1.setInputText,
		chatInputBarSettings = ChatInputBarSettings,
		customTextBoxRef = p1.customTextBoxRef,
		textBoxRef = p1.textBoxRef,
		targetTextChannel = p1.targetTextChannel,
		isGlobalChatTabActive = p1.isGlobalChatTabActive,
		onDictationActivityChanged = p1.onDictationActivityChanged,
		onSendActivated = p1.onSendActivated,
		onSendRecordingTap = p1.onSendRecordingTap,
		onTranscriptionStaged = p1.onTranscriptionStaged
	})
	local DeriveMicSendButtonResult = DictationAffordancesModule.deriveMicSendButton(UseDictationInputBarModuleResult, {
		hasEmptyInputText = IsHasEmptyInputText,
		idleSendIcon = FoundationModule.Enums.IconName.ArrowMediumUp,
		idleSendVariant = if IsHasEmptyInputText then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Emphasis,
		idleSendActivated = p1.onSendActivated,
		idleSendDisabled = IsHasEmptyInputText
	})
	local DeriveBackgroundColorsResult = DictationAffordancesModule.deriveBackgroundColors(UseDictationInputBarModuleResult, {
		defaultColor3 = ChatInputBarSettings.BackgroundColor3,
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
		showPlaceholderText = ShowPlaceholderText
	})
	local UseLongPressOverlay = DeriveMicSendButtonResult.useLongPressOverlay
	local MicGestureHandlers = UseDictationInputBarModuleResult.micGestureHandlers
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Container = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			InputGroup = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center auto-y padding-x-xxsmall radius-circle",
				LayoutOrder = 1,
				backgroundStyle = UseMemoResult,
				stroke = {
					Color = UseTokensResult.Color.Stroke.Default.Color3,
					Transparency = SetTransparencyFunction(UseTokensResult.Color.Stroke.Default.Transparency, p1.transparencyValue)
				},
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 0)
			}, {
				StopCountdown = ReactModule.createElement(StopCountdownModule, {
					LayoutOrder = 1,
					countdownProgress = UseDictationInputBarModuleResult.dictation.bindings.countdownProgress,
					onActivated = UseDictationInputBarModuleResult.dictation.stopDictation,
					Visible = UseDictationInputBarModuleResult.dictation.bindings.isRecording
				}),
				TextContainer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					SelectionBehaviorDown = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
					SelectionBehaviorLeft = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
					SelectionBehaviorRight = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
					SelectionBehaviorUp = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
					SelectionGroup = FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule or nil,
					Size = UDim2.fromScale(0, 0)
				}, {
					TargetChannelChip = ReactModule.createElement(ChannelChipModule, {
						transparency = SetTransparencyFunction(0, p1.transparencyValue),
						onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
						onChannelChipActivated = if FFlagExpChatFixBackspaceNilTargetChannel then function()
							-- upvalues: p1 (copy)
							p1.resetTargetChannel(p1.isGlobalChatTabActive)
						end else p1.resetTargetChannel,
						targetTextChannelDisplayName = p1.targetTextChannelDisplayName or "",
						isChannelBarVisible = p1.isChannelBarVisible,
						developerChannelTabsEnabled = p1.developerChannelTabsEnabled
					}),
					DisabledPlaceholderLabel = (if FFlagExpChatUseMessagesStore then not CanLocalUserChatDerived else not p1.canLocalUserChat) and ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = ConfigModule.ChatInputBarFont,
						Text = p1.disabledChatPlaceholderText,
						Position = UDim2.fromScale(1, 0),
						Size = TargetChannelWidth:map(function(p2: number): UDim2
							return UDim2.new(1, -(p2 + 8), 0, 0)
						end),
						TextColor3 = ShowPlaceholderText and ChatInputBarSettings.PlaceholderColor3 or ChatInputBarSettings.TextColor3,
						TextSize = if IsSpatialUIEnabled then ChatInputBarSettings.SpatialPanelTextSize else ChatInputBarSettings.TextSize,
						TextTransparency = SetTransparencyFunction(if ShowPlaceholderText then 0.5 else 0, p1.transparencyValue),
						Selectable = if ExpChatFocusablePlaceholderText then true else nil,
						SelectionImageObject = if ExpChatFocusablePlaceholderText then Cursor else nil,
						TextWrapped = not (FFlagExpChatPresetChatEnabled and (ShowPlaceholderText and p1.shouldTruncatePlaceholder)),
						TextTruncate = if FFlagExpChatPresetChatEnabled and ShowPlaceholderText then Enum.TextTruncate.AtEnd else nil,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						ref = if ExpChatFocusablePlaceholderText then p1.placeholderRef else nil
					}),
					TextBoxContainer = (if FFlagExpChatUseMessagesStore then CanLocalUserChatDerived else p1.canLocalUserChat) and ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Position = UDim2.fromScale(1, 0),
						Size = TargetChannelWidth:map(function(p2: number): UDim2
							return UDim2.new(1, -(p2 + 8), 0, 0)
						end)
					}, {
						TextBox = (if FFlagExpChatUseMessagesStore then CanLocalUserChatDerived else p1.canLocalUserChat) and ReactModule.createElement("TextBox", {
							AnchorPoint = Vector2.new(0, 0),
							AutomaticSize = Enum.AutomaticSize.XY,
							BackgroundTransparency = 1,
							ClearTextOnFocus = false,
							FontFace = ChatInputBarSettings.FontFace,
							PlaceholderText = ShowPlaceholderText and p1.placeholderText or "",
							Selectable = if FFlagEnableConsoleExpControls then true else nil,
							SelectionImageObject = Cursor,
							Size = UDim2.fromScale(1, 0),
							Text = "",
							PlaceholderColor3 = ChatInputBarSettings.PlaceholderColor3,
							TextColor3 = ChatInputBarSettings.TextColor3,
							TextSize = if IsSpatialUIEnabled then ChatInputBarSettings.SpatialPanelTextSize else ChatInputBarSettings.TextSize,
							TextTransparency = UseDictationTextAreaModuleResult.textTransparency,
							TextStrokeTransparency = UseDictationTextAreaModuleResult.textStrokeTransparency,
							TextStrokeColor3 = ChatInputBarSettings.TextStrokeColor3,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							ZIndex = 2,
							[ReactModule.Event.Focused] = p1.onFocused,
							[ReactModule.Event.FocusLost] = p1.onFocusLost,
							[ReactModule.Change.Text] = p1.onTextChanged,
							[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.onReturnPressedFromOnScreenKeyboard,
							ref = if ChatInputBarSettings.TextBox then p1.customTextBoxRef else p1.textBoxRef
						})
					}),
					WaveformOverlay = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ClipsDescendants = true,
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.fromScale(0, 0.5),
						Size = UDim2.new(1, 0, 0, if IsSpatialUIEnabled then ChatInputBarSettings.SpatialPanelTextSize else ChatInputBarSettings.TextSize),
						Visible = UseDictationInputBarModuleResult.dictation.bindings.isAudioActive
					}, {
						List = ReactModule.createElement(DictationWaveformModule, {
							isActive = UseDictationInputBarModuleResult.isRecording or UseDictationInputBarModuleResult.isListening,
							audioDeviceInput = UseDictationInputBarModuleResult.dictation.audioDeviceInput,
							transcribedSamplesBinding = UseDictationInputBarModuleResult.transcribedSamplesBinding,
							onSample = UseDictationInputBarModuleResult.onWaveformSample
						})
					}),
					UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, 10),
						PaddingLeft = UDim.new(0, UseTokensResult.Padding.Medium),
						PaddingRight = UDim.new(0, UseTokensResult.Padding.Medium),
						PaddingTop = UDim.new(0, 10)
					})
				}),
				SendButtonContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy padding-xxsmall",
					LayoutOrder = 3,
					ref = UseDictationInputBarModuleResult.micButtonSlotRef,
					GroupTransparency = UseMemoResult1
				}, {
					SendButton = ReactModule.createElement(FoundationModule.IconButton, {
						isCircular = true,
						icon = DeriveMicSendButtonResult.icon,
						variant = DeriveMicSendButtonResult.variant,
						size = FoundationModule.Enums.InputSize.Small,
						isDisabled = DeriveMicSendButtonResult.isDisabled,
						Selectable = not UseLongPressOverlay and nil,
						onActivated = if UseLongPressOverlay then function() end else DeriveMicSendButtonResult.onActivated
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
				}),
				FTUX = if FFlagExpChatDictationFTUXModule and UseDictationInputBarModuleResult.ftux and UseDictationInputBarModuleResult.ftux.shouldShow then ReactModule.createElement(DictationFTUXModule, {
					anchorRef = UseDictationInputBarModuleResult.micButtonSlotRef,
					onDismiss = if FFlagExpChatDictationFTUXModule then UseDictationInputBarModuleResult.ftux.dismiss else nil
				}) else nil
			})
		})
	})
end)