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
local expChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
local fFlagExpChatInputBarV2CustomSendButtonModule = require(expChat.Flags.FFlagExpChatInputBarV2CustomSendButton)
local fFlagExpChatInputBarV2CornerAndTruncationFixModule = require(expChat.Flags.FFlagExpChatInputBarV2CornerAndTruncationFix)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatFixBackspaceNilTargetChannel = expChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)

local function renderCustomSendButton(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), foundationModule (ref)
	local var1 = if p3 then p2.Color.ActionStandard else p2.Color.ActionEmphasis
	local size800 = p2.Size.Size_800
	
	return reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		GroupTransparency = if p3 then p1.setTransparency(0.5, p1.transparencyValue) else p1.transparencyValue,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, p1.sendButtonContainerWidth + 6, 1, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundColor3 = var1.Background.Color3,
			BackgroundTransparency = var1.Background.Transparency,
			BorderSizePixel = 0,
			Selectable = if p3 then false elseif fFlagExpChatPresetChatGamepadEnabledModule then nil else false,
			Size = UDim2.fromOffset(size800, size800),
			Text = "",
			[reactModule.Event.Activated] = if p3 then nil else p4
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			IconLayout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Icon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.ArrowMediumUp,
				size = foundationModule.Enums.IconSize.Small,
				style = var1.Foreground
			})
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), fFlagExpChatInputBarV2CornerAndTruncationFixModule (ref), channelChipModule (ref), fFlagExpChatFixBackspaceNilTargetChannel (ref), fFlagExpChatUseMessagesStore (ref), configModule (ref), expChatFocusablePlaceholderText (ref), fFlagExpChatPresetChatEnabled (ref), fFlagEnableConsoleExpControls (ref), fFlagExpChatInputBarV2CustomSendButtonModule (ref), renderCustomSendButton (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local setTransparency = p1.setTransparency
	local chatInputBarSettings = p1.chatInputBarSettings
	local chatInputBarBackgroundTransparency = p1.chatInputBarBackgroundTransparency
	local isSpatialUIEnabled = p1.isSpatialUIEnabled
	local canLocalUserChatDerived = p1.canLocalUserChatDerived
	local targetChannelWidth = p1.targetChannelWidth
	local showPlaceholderText = p1.showPlaceholderText
	local hasEmptyInputText = p1.hasEmptyInputText
	local cursor = p1.cursor
	local placeholderRef = p1.placeholderRef
	local textBoxRef = p1.textBoxRef
	local customTextBoxRef = p1.customTextBoxRef
	local onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	local onFocused = p1.onFocused
	local onFocusLost = p1.onFocusLost
	local onTextChanged = p1.onTextChanged
	local onReturnPressedFromOnScreenKeyboard = p1.onReturnPressedFromOnScreenKeyboard
	local onSendActivated = p1.onSendActivated
	local createElement = reactModule.createElement
	local var2 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var3 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var4 = "Frame"
	local t_4 = {
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = chatInputBarSettings.BackgroundColor3,
		BackgroundTransparency = setTransparency(chatInputBarBackgroundTransparency, p1.transparencyValue),
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 0)
	}
	local t_5 = {
		UICorner = reactModule.createElement("UICorner", {
			CornerRadius = if fFlagExpChatInputBarV2CornerAndTruncationFixModule then UDim.new(0, 20) else UDim.new(1, 0)
		}),
		UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var1.Color.Stroke.Default.Color3,
			Transparency = setTransparency(var1.Color.Stroke.Default.Transparency, p1.transparencyValue)
		}),
		UIPadding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 2) })
	}
	local createElement_3 = reactModule.createElement
	local var5 = "Frame"
	local t_6 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.new(1, -(p1.sendButtonContainerWidth + 6), 0, 0)
	}
	local t_7 = {
		TargetChannelChip = reactModule.createElement(channelChipModule, {
			transparency = setTransparency(0, p1.transparencyValue),
			onAbsoluteSizeChanged = onAbsoluteSizeChanged,
			onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function()
				-- upvalues: p1 (ref)
				p1.resetTargetChannel(p1.isGlobalChatTabActive)
			end else p1.resetTargetChannel,
			targetTextChannelDisplayName = p1.targetTextChannelDisplayName or "",
			isChannelBarVisible = p1.isChannelBarVisible,
			developerChannelTabsEnabled = p1.developerChannelTabsEnabled
		})
	}
	local var6 = if fFlagExpChatUseMessagesStore then not canLocalUserChatDerived else not p1.canLocalUserChat
	
	if var6 then
		var6 = reactModule.createElement
		var6 = var6("TextLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = configModule.ChatInputBarFont,
			Text = p1.disabledChatPlaceholderText,
			Position = UDim2.fromScale(1, 0),
			Size = targetChannelWidth:map(function(p2)
				return UDim2.new(1, -(p2 + 8), 0, 0)
			end),
			TextColor3 = if showPlaceholderText then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
			TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize,
			TextTransparency = setTransparency(if showPlaceholderText then 0.5 else 0, p1.transparencyValue),
			Selectable = if expChatFocusablePlaceholderText then true else nil,
			SelectionImageObject = if expChatFocusablePlaceholderText then cursor else nil,
			TextWrapped = if fFlagExpChatInputBarV2CornerAndTruncationFixModule then not showPlaceholderText else not (fFlagExpChatPresetChatEnabled and (showPlaceholderText and p1.shouldTruncatePlaceholder)),
			TextTruncate = if fFlagExpChatInputBarV2CornerAndTruncationFixModule and showPlaceholderText then Enum.TextTruncate.AtEnd elseif fFlagExpChatPresetChatEnabled and showPlaceholderText then Enum.TextTruncate.AtEnd else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ref = if expChatFocusablePlaceholderText then placeholderRef else nil
		})
	end
	t_7.DisabledPlaceholderLabel = var6
	local var7 = if fFlagExpChatUseMessagesStore then canLocalUserChatDerived else p1.canLocalUserChat
	
	if var7 then
		var7 = reactModule.createElement
		local var8 = "Frame"
		local t_8 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromScale(1, 0),
			Size = targetChannelWidth:map(function(p2)
				return UDim2.new(1, -(p2 + 8), 0, 0)
			end)
		}
		local t_9 = {}
		local var9 = if fFlagExpChatUseMessagesStore then canLocalUserChatDerived else p1.canLocalUserChat
		
		if var9 then
			var9 = reactModule.createElement
			var9 = var9("TextBox", {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				FontFace = chatInputBarSettings.FontFace,
				PlaceholderText = if showPlaceholderText then p1.placeholderText else "",
				Selectable = if fFlagEnableConsoleExpControls then true else nil,
				SelectionImageObject = cursor,
				Size = UDim2.fromScale(1, 0),
				Text = "",
				PlaceholderColor3 = chatInputBarSettings.PlaceholderColor3,
				TextColor3 = chatInputBarSettings.TextColor3,
				TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize,
				TextTransparency = setTransparency(if showPlaceholderText then 0.5 else 0, p1.transparencyValue),
				TextStrokeTransparency = setTransparency(chatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
				TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3,
				TextWrapped = if fFlagExpChatInputBarV2CornerAndTruncationFixModule then not showPlaceholderText else not (fFlagExpChatPresetChatEnabled and (showPlaceholderText and p1.shouldTruncatePlaceholder)),
				TextTruncate = if fFlagExpChatInputBarV2CornerAndTruncationFixModule and showPlaceholderText then Enum.TextTruncate.AtEnd elseif fFlagExpChatPresetChatEnabled and showPlaceholderText then Enum.TextTruncate.AtEnd else nil,
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
		t_9.TextBox = var9
		var7 = var7(var8, t_8, t_9)
	end
	t_7.TextBoxContainer = var7
	t_7.UIPadding = reactModule.createElement("UIPadding", {
		PaddingBottom = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 10)
	})
	t_5.TextContainer = createElement_3(var5, t_6, t_7)
	t_5.SendButtonContainer = if fFlagExpChatInputBarV2CustomSendButtonModule then renderCustomSendButton(p1, var1, hasEmptyInputText, onSendActivated) else reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		GroupTransparency = p1.transparencyValue,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, p1.sendButtonContainerWidth + 6, 1, 0)
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
			Selectable = if fFlagExpChatPresetChatGamepadEnabledModule then nil else false,
			onActivated = onSendActivated
		})
	})
	t_3.InputGroup = createElement_2(var4, t_4, t_5)
	t_1.Container = createElement_1(var3, t_2, t_3)
	
	return createElement(var2, t, t_1)
end)