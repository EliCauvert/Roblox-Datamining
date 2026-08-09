local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local expChatSharedModule = require(parent.ExpChatShared)
local configModule = require(expChat.Config)
local channelChipModule = require(script.Parent.ChannelChip)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
local expChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
local fFlagExpChatInputBarV2CustomSendButtonModule = require(expChat.Flags.FFlagExpChatInputBarV2CustomSendButton)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)

local function renderCustomSendButton(p0, p1, p2, p3) --[[ line: 77 ]]
	-- upvalues: reactModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), foundationModule (ref)
	local var12 = if p2 then p1.Color.ActionStandard else p1.Color.ActionEmphasis
	local size800 = p1.Size.Size_800
	
	return reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		GroupTransparency = if p2 then p0.setTransparency(0.5, p0.transparencyValue) else p0.transparencyValue,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, p0.sendButtonContainerWidth + 6, 1, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundColor3 = var12.Background.Color3,
			BackgroundTransparency = var12.Background.Transparency,
			BorderSizePixel = 0,
			Selectable = if p2 then false elseif fFlagExpChatPresetChatGamepadEnabledModule then nil elseif fFlagExpChatEnableFocusNavigationModule then false else nil,
			Size = UDim2.fromOffset(size800, size800),
			Text = "",
			[reactModule.Event.Activated] = if p2 then nil else p3
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			IconLayout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Icon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.ArrowMediumUp,
				size = foundationModule.Enums.IconSize.Small,
				style = var12.Foreground
			})
		})
	})
end

return reactModule.memo(function(p4) --[[ line: 134 | named "ChatInputBarV2" ]]
	-- upvalues: foundationModule (ref), reactModule (ref), fFlagEnableConsoleExpControls (ref), fFlagExpChatEnableFocusNavigationModule (ref), channelChipModule (ref), fFlagExpChatUseMessagesStore (ref), configModule (ref), expChatFocusablePlaceholderText (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatInputBarV2CustomSendButtonModule (ref), renderCustomSendButton (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref)
	local var13 = foundationModule.Hooks.useTokens()
	local setTransparency = p4.setTransparency
	local chatInputBarSettings = p4.chatInputBarSettings
	local chatInputBarBackgroundTransparency = p4.chatInputBarBackgroundTransparency
	local isSpatialUIEnabled = p4.isSpatialUIEnabled
	local canLocalUserChatDerived = p4.canLocalUserChatDerived
	local targetChannelWidth = p4.targetChannelWidth
	local showPlaceholderText = p4.showPlaceholderText
	local hasEmptyInputText = p4.hasEmptyInputText
	local cursor = p4.cursor
	local placeholderRef = p4.placeholderRef
	local textBoxRef = p4.textBoxRef
	local customTextBoxRef = p4.customTextBoxRef
	local onAbsoluteSizeChanged = p4.onAbsoluteSizeChanged
	local onFocused = p4.onFocused
	local onFocusLost = p4.onFocusLost
	local onTextChanged = p4.onTextChanged
	local onReturnPressedFromOnScreenKeyboard = p4.onReturnPressedFromOnScreenKeyboard
	local onSendActivated = p4.onSendActivated
	local createElement = reactModule.createElement
	local var14 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var17 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var20 = "Frame"
	local t_4 = {
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = chatInputBarSettings.BackgroundColor3,
		BackgroundTransparency = setTransparency(chatInputBarBackgroundTransparency, p4.transparencyValue),
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 0)
	}
	local t_5 = {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var13.Color.Stroke.Default.Color3,
			Transparency = setTransparency(var13.Color.Stroke.Default.Transparency, p4.transparencyValue)
		}),
		UIPadding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 2) })
	}
	local createElement_3 = reactModule.createElement
	local var23 = "Frame"
	local t_6 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		SelectionBehaviorDown = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorLeft = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorRight = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorUp = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
		SelectionGroup = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then true else nil,
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.new(1, -(p4.sendButtonContainerWidth + 6), 0, 0)
	}
	local t_7 = {
		TargetChannelChip = reactModule.createElement(channelChipModule, {
			transparency = setTransparency(0, p4.transparencyValue),
			onAbsoluteSizeChanged = onAbsoluteSizeChanged,
			onChannelChipActivated = p4.resetTargetChannel,
			targetTextChannelDisplayName = p4.targetTextChannelDisplayName or "",
			isChannelBarVisible = p4.isChannelBarVisible,
			developerChannelTabsEnabled = p4.developerChannelTabsEnabled
		})
	}
	local var26 = if fFlagExpChatUseMessagesStore then not canLocalUserChatDerived else not p4.canLocalUserChat
	
	if var26 then
		var26 = reactModule.createElement
		var26 = var26("TextLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = configModule.ChatInputBarFont,
			Text = p4.disabledChatPlaceholderText,
			Position = UDim2.fromScale(1, 0),
			Size = targetChannelWidth:map(function(p5) --[[ line: 227 ]]
				return UDim2.new(1, -(p5 + 8), 0, 0)
			end),
			TextColor3 = if showPlaceholderText then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
			TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize,
			TextTransparency = setTransparency(if showPlaceholderText then 0.5 else 0, p4.transparencyValue),
			Selectable = if expChatFocusablePlaceholderText then true else nil,
			SelectionImageObject = if expChatFocusablePlaceholderText then cursor else nil,
			TextWrapped = not (fFlagExpChatPresetChatEnabled and (showPlaceholderText and p4.shouldTruncatePlaceholder)),
			TextTruncate = if fFlagExpChatPresetChatEnabled and showPlaceholderText then Enum.TextTruncate.AtEnd else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ref = if expChatFocusablePlaceholderText then placeholderRef else nil
		})
	end
	t_7.DisabledPlaceholderLabel = var26
	local var27 = if fFlagExpChatUseMessagesStore then canLocalUserChatDerived else p4.canLocalUserChat
	
	if var27 then
		var27 = reactModule.createElement
		local var28 = "Frame"
		local t_8 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromScale(1, 0),
			Size = targetChannelWidth:map(function(p6) --[[ line: 262 ]]
				return UDim2.new(1, -(p6 + 8), 0, 0)
			end)
		}
		local t_9 = {}
		local var31 = if fFlagExpChatUseMessagesStore then canLocalUserChatDerived else p4.canLocalUserChat
		
		if var31 then
			var31 = reactModule.createElement
			var31 = var31("TextBox", {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				FontFace = chatInputBarSettings.FontFace,
				PlaceholderText = if showPlaceholderText then p4.placeholderText else "",
				Selectable = if fFlagEnableConsoleExpControls then true else nil,
				SelectionImageObject = cursor,
				Size = UDim2.fromScale(1, 0),
				Text = "",
				PlaceholderColor3 = chatInputBarSettings.PlaceholderColor3,
				TextColor3 = chatInputBarSettings.TextColor3,
				TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize,
				TextTransparency = setTransparency(if showPlaceholderText then 0.5 else 0, p4.transparencyValue),
				TextStrokeTransparency = setTransparency(chatInputBarSettings.TextStrokeTransparency, p4.transparencyValue),
				TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3,
				TextWrapped = not (fFlagExpChatPresetChatEnabled and (showPlaceholderText and p4.shouldTruncatePlaceholder)),
				TextTruncate = if fFlagExpChatPresetChatEnabled and showPlaceholderText then Enum.TextTruncate.AtEnd else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ZIndex = 2,
				[reactModule.Event.Focused] = onFocused,
				[reactModule.Event.FocusLost] = onFocusLost,
				[reactModule.Change.Text] = onTextChanged,
				[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = onReturnPressedFromOnScreenKeyboard,
				ref = if chatInputBarSettings.TextBox then customTextBoxRef else textBoxRef
			})
		end
		t_9.TextBox = var31
		var27 = var27(var28, t_8, t_9)
	end
	t_7.TextBoxContainer = var27
	t_7.UIPadding = reactModule.createElement("UIPadding", {
		PaddingBottom = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 10)
	})
	t_5.TextContainer = createElement_3(var23, t_6, t_7)
	t_5.SendButtonContainer = if fFlagExpChatInputBarV2CustomSendButtonModule then renderCustomSendButton(p4, var13, hasEmptyInputText, onSendActivated) else reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		GroupTransparency = p4.transparencyValue,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, p4.sendButtonContainerWidth + 6, 1, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = foundationModule.Enums.IconName.ArrowMediumUp,
			variant = if hasEmptyInputText then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.InputSize.Small,
			isDisabled = hasEmptyInputText,
			Selectable = if fFlagExpChatPresetChatGamepadEnabledModule then nil elseif fFlagExpChatEnableFocusNavigationModule then false else nil,
			onActivated = onSendActivated
		})
	})
	t_3.InputGroup = createElement_2(var20, t_4, t_5)
	t_1.Container = createElement_1(var17, t_2, t_3)
	
	return createElement(var14, t, t_1)
end)