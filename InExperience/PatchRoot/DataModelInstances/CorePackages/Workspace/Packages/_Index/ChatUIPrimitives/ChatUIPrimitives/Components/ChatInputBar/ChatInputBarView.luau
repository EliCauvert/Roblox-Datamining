local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local channelChipModule = require(script.Parent.ChannelChip)
local chatAutocompleteDropdownModule = require(script.Parent.Autocomplete.ChatAutocompleteDropdown)
local useChatAutocompleteEngineModule = require(script.Parent.Autocomplete.useChatAutocompleteEngine)
local expChatFixInputBarSendEligibility = game:DefineFastFlag("ExpChatFixInputBarSendEligibility", false)

local function _(p0, p1) --[[ line: 24 | named "fade" ]]
	return p0 + p1 * (1 - p0)
end

local _ = function(p2, p3) --[[ line: 28 | named "deriveTransparency" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p3) then p3:map(function(p4) --[[ line: 33 ]]
		-- upvalues: p2 (ref)
		return p2 + p4 * (1 - p2)
	end) else p2 + p3 * (1 - p2)
end

local function deriveBackgroundStyle(value, p5, p6) --[[ line: 43 ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p6) then p6:map(function(p7) --[[ line: 49 ]]
		-- upvalues: value (ref), p5 (ref)
		return { Color3 = value, Transparency = p5 + p7 * (1 - p5) }
	end) else { Color3 = value, Transparency = p5 + p6 * (1 - p5) }
end

return reactModule.memo(function(p8) --[[ line: 83 | named "ChatInputBarView" ]]
	-- upvalues: foundationModule (ref), fFlagExpChatEnableFriendsTab (ref), reactModule (ref), useChatAutocompleteEngineModule (ref), expChatFixInputBarSendEligibility (ref), chatAutocompleteDropdownModule (ref), deriveBackgroundStyle (ref), reactIsModule (ref), channelChipModule (ref)
	local var8 = foundationModule.Hooks.useTokens()
	local onChange = p8.onChange
	local onSend = p8.onSend
	local canLocalUserChat = p8.canLocalUserChat
	local transparencyValue = p8.transparencyValue or 0
	local textSize = p8.textSize or var8.Typography.CaptionMedium.FontSize
	local maximumCharacterLimit = p8.maximumCharacterLimit
	local var11 = fFlagExpChatEnableFriendsTab and (not canLocalUserChat and p8.disabledOverlay ~= nil)
	local textBoxRef = p8.textBoxRef or reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local var14 = useChatAutocompleteEngineModule(textBoxRef, p8.autocomplete)
	local var15 = reactModule.useRef(p8.defaultValue or "")
	local var16, var17 = reactModule.useState(function() --[[ line: 99 ]]
		-- upvalues: p8 (ref)
		return (p8.defaultValue or "") == ""
	end)
	local var18, var19 = reactModule.useBinding(0)
	local var20 = reactModule.useCallback(function(p9) --[[ line: 105 ]]
		-- upvalues: var19 (ref)
		var19(p9.AbsoluteSize.X)
	end, {})
	local var21 = reactModule.useCallback(function() --[[ line: 109 ]]
		-- upvalues: textBoxRef (ref), onSend (ref), var17 (ref)
		local current = textBoxRef.current
		local var45 = if current then current.Text else ""
		
		if var45 == "" then return end
		onSend(var45)
		
		if current then
			current.Text = ""
		end
		var17(true)
	end, { onSend, textBoxRef })
	local var22 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: textBoxRef (ref)
		local current = textBoxRef.current
		
		if current then
			current:ReleaseFocus(true)
		end
	end, { textBoxRef })
	local var23 = reactModule.useCallback(function(p10) --[[ line: 129 ]]
		-- upvalues: maximumCharacterLimit (ref), var15 (ref), var17 (ref), onChange (ref), var14 (ref)
		local text = p10.Text
		
		if maximumCharacterLimit ~= nil then
			local normalized = utf8.nfcnormalize(text)
			
			if maximumCharacterLimit < (utf8.len(normalized) or #normalized) then
				p10.Text = var15.current
				
				return
			end
			var15.current = text
		end
		var17(text == "")
		
		if onChange then
			onChange(text)
		end
		var14.onTextChanged(text)
	end, { onChange, maximumCharacterLimit, var14.onTextChanged })
	local var24 = reactModule.useCallback(function() --[[ line: 147 ]]
		-- upvalues: p8 (ref)
		if p8.onFocusGained then
			p8.onFocusGained()
		end
	end, { p8.onFocusGained })
	local var25 = reactModule.useCallback(function(_, p11) --[[ line: 154 ]]
		-- upvalues: textBoxRef (ref), var14 (ref), var21 (ref), p8 (ref)
		local current = textBoxRef.current
		
		if (not current or not var14.interceptSend(current, p11)) and p11 then
			var21()
		end
		if p8.onFocusLost then
			p8.onFocusLost()
		end
	end, { var21, p8.onFocusLost, textBoxRef, var14.interceptSend })
	
	if expChatFixInputBarSendEligibility then
		reactModule.useEffect(function() --[[ line: 174 ]]
			-- upvalues: canLocalUserChat (ref), var17 (ref)
			if not canLocalUserChat then
				var17(true)
			end
		end, { canLocalUserChat })
	end
	local createElement_3
	local var26 = if expChatFixInputBarSendEligibility then var16 or not canLocalUserChat else var16
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		ref = var13
	}
	local t_1 = {
		Dropdown = if p8.autocomplete then reactModule.createElement(chatAutocompleteDropdownModule, {
			isOpen = var14.isOpen,
			results = var14.results,
			selectedIndex = var14.selectedIndex,
			keyboardIndex = var14.keyboardIndex,
			renderEntry = var14.renderEntry,
			anchorRef = var13,
			onHover = var14.setSelectedIndex,
			onSelect = var14.commitSelection,
			onDismiss = var14.dismiss
		}) else nil
	}
	local createElement_1 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_2 = { tag = "auto-y", Size = UDim2.fromScale(1, 0) }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local view_2 = foundationModule.View
	local t_4 = {
		cornerRadius = UDim.new(0, 20),
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = deriveBackgroundStyle(var8.DarkMode.Surface.Surface_100.Color3, 0.2, transparencyValue)
	}
	local t_5 = { Color = var8.Color.Stroke.Default.Color3 }
	local transparency = var8.Color.Stroke.Default.Transparency
	t_5.Transparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p12) --[[ line: 33 ]]
		-- upvalues: transparency (ref)
		return transparency + p12 * (1 - transparency)
	end) else transparency + transparencyValue * (1 - transparency)
	t_4.stroke = t_5
	t_4.padding = { right = UDim.new(0, 2) }
	local t_6 = {
		CustomDisabledContent = if var11 then p8.disabledOverlay else nil
	}
	
	if var11 then
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
				onAbsoluteSizeChanged = var20
			})
		}
		
		if canLocalUserChat then
			createElement_4 = nil
		else
			local var38
			createElement_4 = reactModule.createElement
			local text = foundationModule.Text
			local t_9 = {
				tag = "text-caption-medium text-wrap text-align-x-left text-align-y-top content-muted",
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p8.disabledChatPlaceholderText or "",
				Position = UDim2.fromScale(1, 0),
				Size = var18:map(function(p13) --[[ line: 250 ]]
					return UDim2.new(1, -(p13 + 8), 0, 0)
				end)
			}
			
			if reactIsModule.isBinding(transparencyValue) then
				local var37 = 0.5
				var38 = transparencyValue:map(function(p14) --[[ line: 33 ]]
					-- upvalues: var37 (ref)
					return var37 + p14 * (1 - var37)
				end)
			else
				var38 = transparencyValue * 0.5 + 0.5
			end
			t_9.TextTransparency = var38
			createElement_4 = createElement_4(text, t_9)
		end
		local createElement_5
		t_8.DisabledLabel = createElement_4
		
		if canLocalUserChat then
			local var44
			createElement_5 = reactModule.createElement
			local view_4 = foundationModule.View
			local t_9 = {
				tag = "auto-y",
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.fromScale(1, 0),
				Size = var18:map(function(p15) --[[ line: 262 ]]
					return UDim2.new(1, -(p15 + 8), 0, 0)
				end)
			}
			local t_10 = {}
			local createElement_6 = reactModule.createElement
			local var41 = "TextBox"
			local t_11 = {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				MaxVisibleGraphemes = maximumCharacterLimit or -1,
				Font = var8.Typography.CaptionMedium.Font,
				PlaceholderText = p8.placeholderText or "",
				PlaceholderColor3 = var8.DarkMode.Content.Muted.Color3,
				Size = UDim2.fromScale(1, 0),
				Text = p8.defaultValue or "",
				TextColor3 = var8.DarkMode.Content.Emphasis.Color3,
				TextSize = textSize
			}
			
			if reactIsModule.isBinding(transparencyValue) then
				local var43 = 0
				var44 = transparencyValue:map(function(p16) --[[ line: 33 ]]
					-- upvalues: var43 (ref)
					return var43 + p16 * (1 - var43)
				end)
			else
				var44 = transparencyValue * 1 + 0
			end
			t_11.TextTransparency = var44
			t_11.TextWrapped = true
			t_11.TextXAlignment = Enum.TextXAlignment.Left
			t_11.TextYAlignment = Enum.TextYAlignment.Top
			t_11.TextEditable = p8.enableFocusedWrite ~= false
			t_11.ZIndex = 2
			t_11[reactModule.Change.Text] = var23
			t_11[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var22
			t_11[reactModule.Event.Focused] = var24
			t_11[reactModule.Event.FocusLost] = var25
			t_11.ref = textBoxRef
			t_10.TextBox = createElement_6(var41, t_11)
			createElement_5 = createElement_5(view_4, t_9, t_10)
		else
			createElement_5 = nil
		end
		t_8.TextBoxContainer = createElement_5
		createElement_3 = createElement_3(view_3, t_7, t_8)
	end
	t_6.TextContainer = createElement_3
	t_6.SendButtonContainer = if not var11 then reactModule.createElement("CanvasGroup", {
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
			variant = if var26 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.InputSize.Small,
			isDisabled = var26,
			onActivated = var21
		})
	}) else nil
	t_6.DisabledOverlay = if fFlagExpChatEnableFriendsTab or canLocalUserChat or not p8.disabledOverlay then nil else reactModule.createElement(foundationModule.View, { ZIndex = 5, Size = UDim2.fromScale(1, 1) }, { Overlay = p8.disabledOverlay })
	t_3.InputGroup = createElement_2(view_2, t_4, t_6)
	t_1.Container = createElement_1(view_1, t_2, t_3)
	
	return createElement(view, t, t_1)
end)