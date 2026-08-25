local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local channelChipModule = require(script.Parent.ChannelChip)
local chatAutocompleteDropdownModule = require(script.Parent.Autocomplete.ChatAutocompleteDropdown)
local useChatAutocompleteEngineModule = require(script.Parent.Autocomplete.useChatAutocompleteEngine)
local expChatFixInputBarSendEligibility = game:DefineFastFlag("ExpChatFixInputBarSendEligibility", false)
local expChatComposerFigmaParity = game:DefineFastFlag("ExpChatComposerFigmaParity", false)

local function _(p0, p1)
	return p0 + p1 * (1 - p0)
end

local _ = function(p2, p3)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p3) then p3:map(function(p4)
		-- upvalues: p2 (ref)
		return p2 + p4 * (1 - p2)
	end) else p2 + p3 * (1 - p2)
end

local function deriveBackgroundStyle(value, p5, p6)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p6) then p6:map(function(p7)
		-- upvalues: value (ref), p5 (ref)
		return { Color3 = value, Transparency = p5 + p7 * (1 - p5) }
	end) else { Color3 = value, Transparency = p5 + p6 * (1 - p5) }
end

return reactModule.memo(function(p8)
	-- upvalues: foundationModule (ref), fFlagExpChatEnableFriendsTab (ref), reactModule (ref), useChatAutocompleteEngineModule (ref), expChatFixInputBarSendEligibility (ref), chatAutocompleteDropdownModule (ref), expChatComposerFigmaParity (ref), deriveBackgroundStyle (ref), reactIsModule (ref), channelChipModule (ref)
	local var9 = foundationModule.Hooks.useTokens()
	local themedColors = p8.themedColors
	local var10 = if themedColors then var9.Color.Surface.Surface_100.Color3 else var9.DarkMode.Surface.Surface_100.Color3
	local var11 = if themedColors then var9.Color.Content.Muted.Color3 else var9.DarkMode.Content.Muted.Color3
	local var12 = if themedColors then var9.Color.Content.Emphasis.Color3 else var9.DarkMode.Content.Emphasis.Color3
	local onChange = p8.onChange
	local onSend = p8.onSend
	local canLocalUserChat = p8.canLocalUserChat
	local transparencyValue = p8.transparencyValue or 0
	local textSize = p8.textSize or var9.Typography.CaptionMedium.FontSize
	local maximumCharacterLimit = p8.maximumCharacterLimit
	local var15 = fFlagExpChatEnableFriendsTab and (not canLocalUserChat and p8.disabledOverlay ~= nil)
	local textBoxRef = p8.textBoxRef or reactModule.useRef(nil)
	local var17 = reactModule.useRef(nil)
	local var18 = useChatAutocompleteEngineModule(textBoxRef, p8.autocomplete)
	local var19 = reactModule.useRef(p8.defaultValue or "")
	local var20, var21 = reactModule.useState(function()
		-- upvalues: p8 (ref)
		return (p8.defaultValue or "") == ""
	end)
	local var22, var23 = reactModule.useBinding(0)
	local var24 = reactModule.useCallback(function(p9)
		-- upvalues: var23 (ref)
		var23(p9.AbsoluteSize.X)
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: textBoxRef (ref), onSend (ref), var21 (ref)
		local current = textBoxRef.current
		local var49 = if current then current.Text else ""
		
		if var49 == "" then return end
		onSend(var49)
		
		if current then
			current.Text = ""
		end
		var21(true)
	end, { onSend, textBoxRef })
	local var26 = reactModule.useCallback(function()
		-- upvalues: textBoxRef (ref)
		local current = textBoxRef.current
		
		if current then
			current:ReleaseFocus(true)
		end
	end, { textBoxRef })
	local var27 = reactModule.useCallback(function(p10)
		-- upvalues: maximumCharacterLimit (ref), var19 (ref), var21 (ref), onChange (ref), var18 (ref)
		local text = p10.Text
		
		if maximumCharacterLimit ~= nil then
			local normalized = utf8.nfcnormalize(text)
			
			if maximumCharacterLimit < (utf8.len(normalized) or #normalized) then
				p10.Text = var19.current
				
				return
			end
			var19.current = text
		end
		var21(text == "")
		
		if onChange then
			onChange(text)
		end
		var18.onTextChanged(text)
	end, { onChange, maximumCharacterLimit, var18.onTextChanged })
	local var28 = reactModule.useCallback(function()
		-- upvalues: p8 (ref)
		if p8.onFocusGained then
			p8.onFocusGained()
		end
	end, { p8.onFocusGained })
	local var29 = reactModule.useCallback(function(_, p11)
		-- upvalues: textBoxRef (ref), var18 (ref), var25 (ref), p8 (ref)
		local current = textBoxRef.current
		
		if (not current or not var18.interceptSend(current, p11)) and p11 then
			var25()
		end
		if p8.onFocusLost then
			p8.onFocusLost()
		end
	end, { var25, p8.onFocusLost, textBoxRef, var18.interceptSend })
	
	if expChatFixInputBarSendEligibility then
		reactModule.useEffect(function()
			-- upvalues: canLocalUserChat (ref), var21 (ref)
			if not canLocalUserChat then
				var21(true)
			end
		end, { canLocalUserChat })
	end
	local createElement_3
	local var30 = if expChatFixInputBarSendEligibility then var20 or not canLocalUserChat else var20
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		ref = var17
	}
	local t_1 = {
		Dropdown = if p8.autocomplete then reactModule.createElement(chatAutocompleteDropdownModule, {
			isOpen = var18.isOpen,
			results = var18.results,
			selectedIndex = var18.selectedIndex,
			keyboardIndex = var18.keyboardIndex,
			renderEntry = var18.renderEntry,
			anchorRef = var17,
			onHover = var18.setSelectedIndex,
			onSelect = var18.commitSelection,
			onDismiss = var18.dismiss
		}) else nil
	}
	local createElement_1 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_2 = { tag = "auto-y", Size = UDim2.fromScale(1, 0) }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local view_2 = foundationModule.View
	local t_4 = {
		cornerRadius = if expChatComposerFigmaParity then UDim.new(0, var9.Radius.Circle) else UDim.new(0, 20),
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = deriveBackgroundStyle(var10, 0.2, transparencyValue)
	}
	local t_5 = { Color = var9.Color.Stroke.Default.Color3 }
	local transparency = var9.Color.Stroke.Default.Transparency
	t_5.Transparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p12)
		-- upvalues: transparency (ref)
		return transparency + p12 * (1 - transparency)
	end) else transparency + transparencyValue * (1 - transparency)
	t_4.stroke = t_5
	t_4.padding = { right = UDim.new(0, 2) }
	local t_6 = {
		CustomDisabledContent = if var15 then p8.disabledOverlay else nil
	}
	
	if var15 then
		createElement_3 = nil
	else
		local createElement_4
		createElement_3 = reactModule.createElement
		local view_3 = foundationModule.View
		local t_7 = {
			tag = "auto-y",
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.new(1, -36, 0, 0),
			padding = {
				top = UDim.new(0, 10),
				bottom = UDim.new(0, 10),
				left = UDim.new(0, 10),
				right = UDim.new(0, 10)
			}
		}
		local t_8 = {
			SideChip = reactModule.createElement(channelChipModule, {
				transparency = transparencyValue,
				sideChipText = p8.sideChipText,
				showSideChip = p8.showSideChip,
				onSideChipActivated = p8.onSideChipActivated,
				onAbsoluteSizeChanged = var24
			})
		}
		
		if canLocalUserChat then
			createElement_4 = nil
		else
			local var42
			createElement_4 = reactModule.createElement
			local text = foundationModule.Text
			local t_9 = {
				tag = "position-top-right anchor-top-right auto-y text-caption-medium text-wrap text-align-x-left text-align-y-top content-muted",
				Text = p8.disabledChatPlaceholderText or "",
				Size = var22:map(function(p13)
					-- upvalues: var9 (ref)
					return UDim2.new(1, -(p13 + var9.Size.Size_200), 0, 0)
				end)
			}
			
			if reactIsModule.isBinding(transparencyValue) then
				local var41 = 0.5
				var42 = transparencyValue:map(function(p14)
					-- upvalues: var41 (ref)
					return var41 + p14 * (1 - var41)
				end)
			else
				var42 = transparencyValue * 0.5 + 0.5
			end
			t_9.TextTransparency = var42
			createElement_4 = createElement_4(text, t_9)
		end
		local createElement_5
		t_8.DisabledLabel = createElement_4
		
		if canLocalUserChat then
			local var47
			createElement_5 = reactModule.createElement
			local view_4 = foundationModule.View
			local t_9 = {
				tag = "position-top-right anchor-top-right auto-y",
				Size = var22:map(function(p15)
					-- upvalues: var9 (ref)
					return UDim2.new(1, -(p15 + var9.Size.Size_200), 0, 0)
				end)
			}
			local t_10 = {}
			local createElement_6 = reactModule.createElement
			local var45 = "TextBox"
			local t_11 = {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				MaxVisibleGraphemes = maximumCharacterLimit or -1,
				Font = if p8.fontFace then nil else var9.Typography.CaptionMedium.Font,
				FontFace = p8.fontFace,
				PlaceholderText = p8.placeholderText or "",
				PlaceholderColor3 = var11,
				Size = UDim2.fromScale(1, 0),
				Text = p8.defaultValue or "",
				TextColor3 = var12,
				TextSize = textSize
			}
			
			if reactIsModule.isBinding(transparencyValue) then
				local var48 = 0
				var47 = transparencyValue:map(function(p16)
					-- upvalues: var48 (ref)
					return var48 + p16 * (1 - var48)
				end)
			else
				var47 = transparencyValue * 1 + 0
			end
			t_11.TextTransparency = var47
			t_11.TextWrapped = true
			t_11.TextXAlignment = Enum.TextXAlignment.Left
			t_11.TextYAlignment = Enum.TextYAlignment.Top
			t_11.TextEditable = p8.enableFocusedWrite ~= false
			t_11.ZIndex = 2
			t_11[reactModule.Change.Text] = var27
			t_11[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var26
			t_11[reactModule.Event.Focused] = var28
			t_11[reactModule.Event.FocusLost] = var29
			t_11.ref = textBoxRef
			t_10.TextBox = createElement_6(var45, t_11)
			createElement_5 = createElement_5(view_4, t_9, t_10)
		else
			createElement_5 = nil
		end
		t_8.TextBoxContainer = createElement_5
		createElement_3 = createElement_3(view_3, t_7, t_8)
	end
	t_6.TextContainer = createElement_3
	t_6.SendButtonContainer = if not var15 then reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		GroupTransparency = transparencyValue,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, 36, 1, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = foundationModule.Enums.IconName.ArrowMediumUp,
			variant = if var30 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.InputSize.Small,
			isDisabled = var30,
			onActivated = var25
		})
	}) else nil
	t_6.DisabledOverlay = if fFlagExpChatEnableFriendsTab or canLocalUserChat or not p8.disabledOverlay then nil else reactModule.createElement(foundationModule.View, { ZIndex = 5, Size = UDim2.fromScale(1, 1) }, { Overlay = p8.disabledOverlay })
	t_3.InputGroup = createElement_2(view_2, t_4, t_6)
	t_1.Container = createElement_1(view_1, t_2, t_3)
	
	return createElement(view, t, t_1)
end)