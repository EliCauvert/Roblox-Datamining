local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local channelChipModule = require(script.Parent.ChannelChip)
local chatAutocompleteDropdownModule = require(script.Parent.Autocomplete.ChatAutocompleteDropdown)
local useChatAutocompleteEngineModule = require(script.Parent.Autocomplete.useChatAutocompleteEngine)

local function _(p1, p2)
	return p1 + p2 * (1 - p1)
end

local function deriveTransparency(p1, p2)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p2) then p2:map(function(p3)
		-- upvalues: p1 (ref)
		return p1 + p3 * (1 - p1)
	end) else p1 + p2 * (1 - p1)
end

local function deriveBackgroundStyle(value, p1, p2)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p2) then p2:map(function(p3)
		-- upvalues: value (ref), p1 (ref)
		return { Color3 = value, Transparency = p1 + p3 * (1 - p1) }
	end) else { Color3 = value, Transparency = p1 + p2 * (1 - p1) }
end

local function renderDropdown(p1)
	-- upvalues: reactModule (ref), chatAutocompleteDropdownModule (ref)
	if p1.props.autocomplete then
		local autocomplete = p1.autocomplete
		
		return reactModule.createElement(chatAutocompleteDropdownModule, {
			isOpen = autocomplete.isOpen,
			results = autocomplete.results,
			selectedIndex = autocomplete.selectedIndex,
			keyboardIndex = autocomplete.keyboardIndex,
			renderEntry = autocomplete.renderEntry,
			anchorRef = p1.barContainerRef,
			onHover = autocomplete.setSelectedIndex,
			onSelect = autocomplete.commitSelection,
			onDismiss = autocomplete.dismiss
		})
	end
	return nil
end

local function renderSideChip(p1)
	-- upvalues: reactModule (ref), channelChipModule (ref)
	return reactModule.createElement(channelChipModule, {
		transparency = p1.transparencyValue,
		sideChipText = p1.props.sideChipText,
		showSideChip = p1.props.showSideChip,
		onSideChipActivated = p1.props.onSideChipActivated,
		onAbsoluteSizeChanged = p1.onChannelChipAbsoluteSizeChanged
	})
end

local function renderSendButton(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.IconButton, {
		isCircular = true,
		icon = foundationModule.Enums.IconName.ArrowMediumUp,
		variant = if p1.isSendDisabled then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
		size = foundationModule.Enums.InputSize.Small,
		isDisabled = p1.isSendDisabled,
		onActivated = p1.onSendActivated
	})
end

local function renderFallbackDisabledOverlay(p1)
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), reactModule (ref), foundationModule (ref)
	return if fFlagExpChatEnableFriendsTab or p1.canChat or not p1.props.disabledOverlay then nil else reactModule.createElement(foundationModule.View, { ZIndex = 5, Size = UDim2.fromScale(1, 1) }, { Overlay = p1.props.disabledOverlay })
end

local function renderLegacy(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), renderDropdown (ref), deriveBackgroundStyle (ref), reactIsModule (ref), renderSideChip (ref), renderSendButton (ref), renderFallbackDisabledOverlay (ref)
	local createElement_3
	local tokens = p1.tokens
	local props = p1.props
	local textSize = props.textSize or tokens.Typography.CaptionMedium.FontSize
	local var1 = not p1.shouldReplaceDisabledContent and (not p1.hasLeadingAction or not p1.isEmpty and p1.canChat)
	local var2 = if p1.showLeadingAction then 36 else 0
	local var3 = if var1 then p1.sendButtonContainerWidth + 6 else 0
	local var4 = p1.channelChipWidth:map(function(p2)
		-- upvalues: tokens (ref)
		return UDim2.new(1, -(p2 + tokens.Size.Size_200), 0, 0)
	end)
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		ref = p1.barContainerRef
	}
	local t_1 = { Dropdown = renderDropdown(p1) }
	local createElement_1 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_2 = { tag = "auto-y", Size = UDim2.fromScale(1, 0) }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local view_2 = foundationModule.View
	local t_4 = {
		LayoutOrder = 2,
		cornerRadius = UDim.new(0, 20),
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = deriveBackgroundStyle(p1.surfaceColor, 0.2, p1.transparencyValue)
	}
	local t_5 = { Color = tokens.Color.Stroke.Default.Color3 }
	local transparency = tokens.Color.Stroke.Default.Transparency
	local transparencyValue = p1.transparencyValue
	t_5.Transparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p2)
		-- upvalues: transparency (ref)
		return transparency + p2 * (1 - transparency)
	end) else transparency + transparencyValue * (1 - transparency)
	t_4.stroke = t_5
	t_4.padding = { right = UDim.new(0, 2) }
	local t_6 = {
		CustomDisabledContent = if p1.shouldReplaceDisabledContent then props.disabledOverlay else nil,
		LeadingActionContainer = if p1.showLeadingAction then reactModule.createElement(foundationModule.View, {
			tag = "position-top-left",
			Size = UDim2.new(0, var2, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Action = props.leftAddon
		}) else nil
	}
	
	if p1.shouldReplaceDisabledContent then
		createElement_3 = nil
	else
		local createElement_4
		createElement_3 = reactModule.createElement
		local view_3 = foundationModule.View
		local t_7 = {
			tag = "auto-y",
			Position = UDim2.fromOffset(var2, 0),
			Size = UDim2.new(1, -(var2 + var3), 0, 0),
			padding = {
				top = UDim.new(0, 10),
				bottom = UDim.new(0, 10),
				left = UDim.new(0, 10),
				right = UDim.new(0, 10)
			}
		}
		local t_8 = { SideChip = renderSideChip(p1) }
		
		if p1.canChat then
			createElement_4 = nil
		else
			local var5
			createElement_4 = reactModule.createElement
			local text = foundationModule.Text
			local t_9 = {
				tag = "position-top-right anchor-top-right auto-y text-caption-medium text-wrap text-align-x-left text-align-y-top content-muted",
				Text = props.disabledChatPlaceholderText or "",
				Size = var4
			}
			local transparencyValue_1 = p1.transparencyValue
			
			if reactIsModule.isBinding(transparencyValue_1) then
				local var6 = 0.5
				var5 = transparencyValue_1:map(function(p2)
					-- upvalues: var6 (ref)
					return var6 + p2 * (1 - var6)
				end)
			else
				var5 = transparencyValue_1 * 0.5 + 0.5
			end
			t_9.TextTransparency = var5
			createElement_4 = createElement_4(text, t_9)
		end
		local createElement_5
		t_8.DisabledLabel = createElement_4
		
		if p1.canChat then
			local var7
			createElement_5 = reactModule.createElement
			local view_4 = foundationModule.View
			local t_9 = {
				tag = "position-top-right anchor-top-right auto-y",
				Size = var4
			}
			local t_10 = {}
			local createElement_6 = reactModule.createElement
			local var8 = "TextBox"
			local t_11 = {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				MaxVisibleGraphemes = props.maximumCharacterLimit or -1,
				Font = if props.fontFace then nil else tokens.Typography.CaptionMedium.Font,
				FontFace = props.fontFace,
				PlaceholderText = props.placeholderText or "",
				PlaceholderColor3 = p1.placeholderColor,
				Size = UDim2.fromScale(1, 0),
				Text = props.defaultValue or "",
				TextColor3 = p1.textColor,
				TextSize = textSize
			}
			local transparencyValue_1 = p1.transparencyValue
			
			if reactIsModule.isBinding(transparencyValue_1) then
				local var9 = 0
				var7 = transparencyValue_1:map(function(p2)
					-- upvalues: var9 (ref)
					return var9 + p2 * (1 - var9)
				end)
			else
				var7 = transparencyValue_1 * 1 + 0
			end
			t_11.TextTransparency = var7
			t_11.TextWrapped = true
			t_11.TextXAlignment = Enum.TextXAlignment.Left
			t_11.TextYAlignment = Enum.TextYAlignment.Top
			t_11.TextEditable = props.enableFocusedWrite ~= false
			t_11.ZIndex = 2
			t_11[reactModule.Change.Text] = p1.onTextChanged
			t_11[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.onReturnPressedFromOnScreenKeyboard
			t_11[reactModule.Event.Focused] = p1.onFocused
			t_11[reactModule.Event.FocusLost] = p1.onFocusLost
			t_11.ref = p1.textBoxRef
			t_10.TextBox = createElement_6(var8, t_11)
			createElement_5 = createElement_5(view_4, t_9, t_10)
		else
			createElement_5 = nil
		end
		t_8.TextBoxContainer = createElement_5
		createElement_3 = createElement_3(view_3, t_7, t_8)
	end
	t_6.TextContainer = createElement_3
	t_6.SendButtonContainer = if var1 then reactModule.createElement("CanvasGroup", {
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
		SendButton = renderSendButton(p1)
	}) else nil
	t_6.DisabledOverlay = renderFallbackDisabledOverlay(p1)
	t_3.InputGroup = createElement_2(view_2, t_4, t_6)
	t_1.Container = createElement_1(view_1, t_2, t_3)
	
	return createElement(view, t, t_1)
end

local function renderComposer(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), renderDropdown (ref), renderSideChip (ref), reactIsModule (ref), renderSendButton (ref), renderFallbackDisabledOverlay (ref)
	local createElement_3
	local tokens = p1.tokens
	local props = p1.props
	local fontSize = tokens.Typography.BodyMedium.FontSize
	local var1 = not p1.shouldReplaceDisabledContent
	local var2 = p1.sendButtonContainerWidth + 6
	local var3 = p1.channelChipWidth:map(function(p2)
		-- upvalues: tokens (ref)
		return UDim2.new(1, -(if p2 > 0 then p2 + tokens.Size.Size_200 else 0), 0, 0)
	end)
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = { tag = "size-full-0 auto-y", ref = p1.barContainerRef }
	local t_1 = { Dropdown = renderDropdown(p1) }
	local createElement_1 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_2 = { tag = "row align-y-center gap-small size-full-0 auto-y" }
	local t_3 = {
		LeadingButton = if p1.showLeadingAction then reactModule.createElement(foundationModule.View, { LayoutOrder = 1, tag = "auto-xy" }, { Action = props.leftAddon }) else nil
	}
	local createElement_2 = reactModule.createElement
	local view_2 = foundationModule.View
	local t_4 = {
		LayoutOrder = 2,
		tag = "grow size-0 auto-y",
		cornerRadius = UDim.new(0, tokens.Radius.Circle),
		backgroundStyle = p1.pillBackgroundStyle,
		stroke = p1.pillStroke,
		sizeConstraint = { MinSize = Vector2.new(0, 40) },
		padding = { right = UDim.new(0, 4) }
	}
	local t_5 = {
		CustomDisabledContent = if p1.shouldReplaceDisabledContent then props.disabledOverlay else nil
	}
	
	if p1.shouldReplaceDisabledContent then
		createElement_3 = nil
	else
		local createElement_4
		createElement_3 = reactModule.createElement
		local view_3 = foundationModule.View
		local t_6 = {
			tag = "auto-y",
			ClipsDescendants = true,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(1, -var2, 0, 0),
			padding = {
				left = UDim.new(0, 16),
				right = UDim.new(0, 4),
				top = UDim.new(0, 10),
				bottom = UDim.new(0, 10)
			}
		}
		local t_7 = { SideChip = renderSideChip(p1) }
		
		if p1.canChat then
			createElement_4 = nil
		else
			local var4
			createElement_4 = reactModule.createElement
			local text = foundationModule.Text
			local t_8 = {
				tag = "position-top-right anchor-top-right auto-y text-body-medium text-align-x-left text-truncate-end content-muted",
				Text = props.disabledChatPlaceholderText or "",
				Size = var3
			}
			local transparencyValue = p1.transparencyValue
			
			if reactIsModule.isBinding(transparencyValue) then
				local var5 = 0.5
				var4 = transparencyValue:map(function(p2)
					-- upvalues: var5 (ref)
					return var5 + p2 * (1 - var5)
				end)
			else
				var4 = transparencyValue * 0.5 + 0.5
			end
			t_8.TextTransparency = var4
			createElement_4 = createElement_4(text, t_8)
		end
		t_7.DisabledLabel = createElement_4
		t_7.TextBoxContainer = if p1.canChat then reactModule.createElement(foundationModule.View, {
			tag = "position-top-right anchor-top-right auto-y clip",
			Size = var3
		}, {
			TextBox = reactModule.createElement("TextBox", {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				MaxVisibleGraphemes = props.maximumCharacterLimit or -1,
				Font = if props.fontFace then nil else tokens.Typography.BodyMedium.Font,
				FontFace = props.fontFace,
				PlaceholderText = props.placeholderText or "",
				PlaceholderColor3 = p1.composerPlaceholderColor,
				Size = UDim2.fromScale(1, 0),
				Text = props.defaultValue or "",
				TextColor3 = p1.textColor,
				TextSize = fontSize,
				TextTransparency = p1.textTransparency,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextEditable = props.enableFocusedWrite ~= false,
				ZIndex = 2,
				[reactModule.Change.Text] = p1.onTextChanged,
				[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.onReturnPressedFromOnScreenKeyboard,
				[reactModule.Event.Focused] = p1.onFocused,
				[reactModule.Event.FocusLost] = p1.onFocusLost,
				ref = p1.textBoxRef
			})
		}) else nil
		createElement_3 = createElement_3(view_3, t_6, t_7)
	end
	t_5.TextContainer = createElement_3
	t_5.SendButtonContainer = if var1 then reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		GroupTransparency = p1.pillTransparency,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, 0, 1, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = renderSendButton(p1)
	}) else nil
	t_5.DisabledOverlay = renderFallbackDisabledOverlay(p1)
	t_3.InputGroup = createElement_2(view_2, t_4, t_5)
	t_1.Container = createElement_1(view_1, t_2, t_3)
	
	return createElement(view, t, t_1)
end

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), fFlagExpChatEnableFriendsTab (ref), reactModule (ref), reactIsModule (ref), deriveBackgroundStyle (ref), deriveTransparency (ref), useChatAutocompleteEngineModule (ref), renderComposer (ref), renderLegacy (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local themedColors = p1.themedColors
	local var2 = if themedColors then var1.Color.Surface.Surface_100.Color3 else var1.DarkMode.Surface.Surface_100.Color3
	local var3 = if themedColors then var1.Color.Content.Muted.Color3 else var1.DarkMode.Content.Muted.Color3
	local var4 = if themedColors then var1.Color.Content.Emphasis.Color3 else var1.DarkMode.Content.Emphasis.Color3
	local var5 = if themedColors then var1.Color.Content.Default.Color3 else var1.DarkMode.Content.Default.Color3
	local onChange = p1.onChange
	local onSend = p1.onSend
	local canLocalUserChat = p1.canLocalUserChat
	local transparencyValue = p1.transparencyValue or 0
	local maximumCharacterLimit = p1.maximumCharacterLimit
	local var6 = fFlagExpChatEnableFriendsTab and (not canLocalUserChat and p1.disabledOverlay ~= nil)
	local var7 = reactModule.useMemo(function()
		-- upvalues: canLocalUserChat (ref), transparencyValue (ref), reactIsModule (copy)
		if canLocalUserChat then
			return transparencyValue
		end
		local var8 = transparencyValue
		
		if reactIsModule.isBinding(var8) then
			local var9 = 0.5
			
			return var8:map(function(p2)
				-- upvalues: var9 (ref)
				return var9 + p2 * (1 - var9)
			end)
		end
		return var8 * 0.5 + 0.5
	end, { canLocalUserChat, transparencyValue })
	local var8 = reactModule.useMemo(function()
		-- upvalues: deriveBackgroundStyle (copy), var2 (ref), var7 (ref)
		return deriveBackgroundStyle(var2, 0.2, var7)
	end, { var2, var7 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var7 (ref), reactIsModule (copy)
		local t = { Color = var1.Color.Stroke.Default.Color3 }
		local transparency = var1.Color.Stroke.Default.Transparency
		t.Transparency = if reactIsModule.isBinding(var7) then var7:map(function(p2)
			-- upvalues: transparency (ref)
			return transparency + p2 * (1 - transparency)
		end) else transparency + var7 * (1 - transparency)
		
		return t
	end, { var1, var7 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: deriveTransparency (copy), transparencyValue (ref)
		return deriveTransparency(0, transparencyValue)
	end, { transparencyValue })
	local textBoxRef = p1.textBoxRef or reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12 = useChatAutocompleteEngineModule(textBoxRef, p1.autocomplete)
	local var13 = reactModule.useRef(p1.defaultValue or "")
	local var14, var15 = reactModule.useState(function()
		-- upvalues: p1 (ref)
		return (p1.defaultValue or "") == ""
	end)
	local var16, var17 = reactModule.useBinding(0)
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref)
		var17(p2.AbsoluteSize.X)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: textBoxRef (ref), onSend (ref), var15 (ref)
		local current = textBoxRef.current
		local var20 = if current then current.Text else ""
		
		if var20 == "" then return end
		onSend(var20)
		
		if current then
			current.Text = ""
		end
		var15(true)
	end, { onSend, textBoxRef })
	local var20 = reactModule.useCallback(function()
		-- upvalues: textBoxRef (ref)
		local current = textBoxRef.current
		
		if current then
			current:ReleaseFocus(true)
		end
	end, { textBoxRef })
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: maximumCharacterLimit (ref), var13 (ref), var15 (ref), onChange (ref), var12 (ref)
		local text = p2.Text
		
		if maximumCharacterLimit ~= nil then
			local normalized = utf8.nfcnormalize(text)
			
			if maximumCharacterLimit < (utf8.len(normalized) or #normalized) then
				p2.Text = var13.current
				
				return
			end
			var13.current = text
		end
		var15(text == "")
		
		if onChange then
			onChange(text)
		end
		var12.onTextChanged(text)
	end, { onChange, maximumCharacterLimit, var12.onTextChanged })
	local var22 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onFocusGained then
			p1.onFocusGained()
		end
	end, { p1.onFocusGained })
	local var23 = reactModule.useCallback(function(_, p2)
		-- upvalues: textBoxRef (ref), var12 (ref), var19 (ref), p1 (ref)
		local current = textBoxRef.current
		
		if (not current or not var12.interceptSend(current, p2)) and p2 then
			var19()
		end
		if p1.onFocusLost then
			p1.onFocusLost()
		end
	end, { var19, p1.onFocusLost, textBoxRef, var12.interceptSend })
	reactModule.useEffect(function()
		-- upvalues: canLocalUserChat (ref), var15 (ref)
		if not canLocalUserChat then
			var15(true)
		end
	end, { canLocalUserChat })
	local var24 = if p1.leftAddon then true else false
	local t = {
		sendButtonContainerWidth = 30,
		tokens = var1,
		props = p1,
		canChat = canLocalUserChat,
		isEmpty = var14,
		isSendDisabled = var14 or not canLocalUserChat,
		hasLeadingAction = var24,
		showLeadingAction = var24 and (var14 and not var6),
		shouldReplaceDisabledContent = var6,
		transparencyValue = transparencyValue,
		textColor = var4,
		surfaceColor = var2,
		placeholderColor = var3,
		composerPlaceholderColor = var5,
		pillTransparency = var7,
		pillBackgroundStyle = var8,
		pillStroke = var9,
		textTransparency = var10,
		textBoxRef = textBoxRef,
		barContainerRef = var11,
		channelChipWidth = var16,
		autocomplete = var12,
		onChannelChipAbsoluteSizeChanged = var18,
		onSendActivated = var19,
		onReturnPressedFromOnScreenKeyboard = var20,
		onTextChanged = var21,
		onFocused = var22,
		onFocusLost = var23
	}
	
	return if p1.composerLayout == true then renderComposer(t) else renderLegacy(t)
end)