local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ConfigModule = require(ExpChat.Config)
local ChannelChipModule = require(script.Parent.ChannelChip)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagExpChatEnableFocusNavigationModule = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local ExpChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
local FFlagExpChatInputBarV2CustomSendButtonModule = require(ExpChat.Flags.FFlagExpChatInputBarV2CustomSendButton)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatFixBackspaceNilTargetChannel = ExpChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)

local function renderCustomSendButton(p1, UseTokensResult, HasEmptyInputText, OnSendActivated)
	-- upvalues: ReactModule (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), FFlagExpChatEnableFocusNavigationModule (copy), FoundationModule (copy)
	local ActionStandard = if HasEmptyInputText then UseTokensResult.Color.ActionStandard else UseTokensResult.Color.ActionEmphasis
	local Size800 = UseTokensResult.Size.Size_800
	
	return ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		GroupTransparency = if HasEmptyInputText then p1.setTransparency(0.5, p1.transparencyValue) else p1.transparencyValue,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, p1.sendButtonContainerWidth + 6, 1, 0)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundColor3 = ActionStandard.Background.Color3,
			BackgroundTransparency = ActionStandard.Background.Transparency,
			BorderSizePixel = 0,
			Selectable = not HasEmptyInputText and (if FFlagExpChatPresetChatGamepadEnabledModule then nil else not FFlagExpChatEnableFocusNavigationModule and nil),
			Size = UDim2.fromOffset(Size800, Size800),
			Text = "",
			[ReactModule.Event.Activated] = if HasEmptyInputText then nil else OnSendActivated
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			IconLayout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Icon = ReactModule.createElement(FoundationModule.Icon, {
				name = FoundationModule.Enums.IconName.ArrowMediumUp,
				size = FoundationModule.Enums.IconSize.Small,
				style = ActionStandard.Foreground
			})
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), FFlagEnableConsoleExpControls (copy), FFlagExpChatEnableFocusNavigationModule (copy), ChannelChipModule (copy), FFlagExpChatFixBackspaceNilTargetChannel (copy), FFlagExpChatUseMessagesStore (copy), ConfigModule (copy), ExpChatFocusablePlaceholderText (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatInputBarV2CustomSendButtonModule (copy), renderCustomSendButton (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local SetTransparencyFunction = p1.setTransparency
	local ChatInputBarSettings = p1.chatInputBarSettings
	local IsSpatialUIEnabled = p1.isSpatialUIEnabled
	local CanLocalUserChatDerived = p1.canLocalUserChatDerived
	local TargetChannelWidth = p1.targetChannelWidth
	local ShowPlaceholderText = p1.showPlaceholderText
	local HasEmptyInputText = p1.hasEmptyInputText
	local Cursor = p1.cursor
	local PlaceholderRef = p1.placeholderRef
	local TextBoxRef = p1.textBoxRef
	local CustomTextBoxRef = p1.customTextBoxRef
	local OnFocused = p1.onFocused
	local OnFocusLost = p1.onFocusLost
	local OnTextChanged = p1.onTextChanged
	local OnReturnPressedFromOnScreenKeyboard = p1.onReturnPressedFromOnScreenKeyboard
	local OnSendActivated = p1.onSendActivated
	
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
			InputGroup = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = ChatInputBarSettings.BackgroundColor3,
				BackgroundTransparency = SetTransparencyFunction(p1.chatInputBarBackgroundTransparency, p1.transparencyValue),
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 0)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				UIStroke = ReactModule.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = UseTokensResult.Color.Stroke.Default.Color3,
					Transparency = SetTransparencyFunction(UseTokensResult.Color.Stroke.Default.Transparency, p1.transparencyValue)
				}),
				UIPadding = ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 2) }),
				TextContainer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					SelectionBehaviorDown = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
					SelectionBehaviorLeft = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
					SelectionBehaviorRight = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
					SelectionBehaviorUp = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
					SelectionGroup = FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule or nil,
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.new(1, -(p1.sendButtonContainerWidth + 6), 0, 0)
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
						ref = if ExpChatFocusablePlaceholderText then PlaceholderRef else nil
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
							TextTransparency = SetTransparencyFunction(if ShowPlaceholderText then 0.5 else 0, p1.transparencyValue),
							TextStrokeTransparency = SetTransparencyFunction(ChatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
							TextStrokeColor3 = ChatInputBarSettings.TextStrokeColor3,
							TextWrapped = not (FFlagExpChatPresetChatEnabled and (ShowPlaceholderText and p1.shouldTruncatePlaceholder)),
							TextTruncate = if FFlagExpChatPresetChatEnabled and ShowPlaceholderText then Enum.TextTruncate.AtEnd else nil,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							ZIndex = 2,
							[ReactModule.Event.Focused] = OnFocused,
							[ReactModule.Event.FocusLost] = OnFocusLost,
							[ReactModule.Change.Text] = OnTextChanged,
							[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = OnReturnPressedFromOnScreenKeyboard,
							ref = if ChatInputBarSettings.TextBox then CustomTextBoxRef else TextBoxRef
						})
					}),
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, 10),
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10),
						PaddingTop = UDim.new(0, 10)
					})
				}),
				SendButtonContainer = if FFlagExpChatInputBarV2CustomSendButtonModule then renderCustomSendButton(p1, UseTokensResult, HasEmptyInputText, OnSendActivated) else ReactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(1, 0),
					GroupTransparency = p1.transparencyValue,
					Position = UDim2.fromScale(1, 0),
					Size = UDim2.new(0, p1.sendButtonContainerWidth + 6, 1, 0)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					SendButton = ReactModule.createElement(FoundationModule.IconButton, {
						isCircular = true,
						icon = FoundationModule.Enums.IconName.ArrowMediumUp,
						variant = if HasEmptyInputText then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Emphasis,
						size = FoundationModule.Enums.InputSize.Small,
						isDisabled = HasEmptyInputText,
						Selectable = if FFlagExpChatPresetChatGamepadEnabledModule then nil else not FFlagExpChatEnableFocusNavigationModule and nil,
						onActivated = OnSendActivated
					})
				})
			})
		})
	})
end)