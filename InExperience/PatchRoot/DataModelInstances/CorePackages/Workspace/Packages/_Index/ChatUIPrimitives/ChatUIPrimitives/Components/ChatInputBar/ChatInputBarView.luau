local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local channelChipModule = require(script.Parent.ChannelChip)
local chatAutocompleteDropdownModule = require(script.Parent.Autocomplete.ChatAutocompleteDropdown)
local useChatAutocompleteEngineModule = require(script.Parent.Autocomplete.useChatAutocompleteEngine)
local expChatComposerFigmaParity = game:DefineFastFlag("ExpChatComposerFigmaParity", false)

local function _(p1, p2)
	return p1 + p2 * (1 - p1)
end

local _ = function(p1, p2)
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

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), fFlagExpChatEnableFriendsTab (ref), reactModule (ref), useChatAutocompleteEngineModule (ref), chatAutocompleteDropdownModule (ref), expChatComposerFigmaParity (ref), deriveBackgroundStyle (ref), reactIsModule (ref), channelChipModule (ref)
	local createElement_3
	local var1 = foundationModule.Hooks.useTokens()
	local themedColors = p1.themedColors
	local var2 = if themedColors then var1.Color.Surface.Surface_100.Color3 else var1.DarkMode.Surface.Surface_100.Color3
	local var3 = if themedColors then var1.Color.Content.Muted.Color3 else var1.DarkMode.Content.Muted.Color3
	local var4 = if themedColors then var1.Color.Content.Emphasis.Color3 else var1.DarkMode.Content.Emphasis.Color3
	local onChange = p1.onChange
	local onSend = p1.onSend
	local canLocalUserChat = p1.canLocalUserChat
	local transparencyValue = p1.transparencyValue or 0
	local textSize = p1.textSize or var1.Typography.CaptionMedium.FontSize
	local maximumCharacterLimit = p1.maximumCharacterLimit
	local var5 = fFlagExpChatEnableFriendsTab and (not canLocalUserChat and p1.disabledOverlay ~= nil)
	local textBoxRef = p1.textBoxRef or reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = useChatAutocompleteEngineModule(textBoxRef, p1.autocomplete)
	local var8 = reactModule.useRef(p1.defaultValue or "")
	local var9, var10 = reactModule.useState(function()
		-- upvalues: p1 (ref)
		return (p1.defaultValue or "") == ""
	end)
	local var11, var12 = reactModule.useBinding(0)
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref)
		var12(p2.AbsoluteSize.X)
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: textBoxRef (ref), onSend (ref), var10 (ref)
		local current = textBoxRef.current
		local var15 = if current then current.Text else ""
		
		if var15 == "" then return end
		onSend(var15)
		
		if current then
			current.Text = ""
		end
		var10(true)
	end, { onSend, textBoxRef })
	local var15 = reactModule.useCallback(function()
		-- upvalues: textBoxRef (ref)
		local current = textBoxRef.current
		
		if current then
			current:ReleaseFocus(true)
		end
	end, { textBoxRef })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: maximumCharacterLimit (ref), var8 (ref), var10 (ref), onChange (ref), var7 (ref)
		local text = p2.Text
		
		if maximumCharacterLimit ~= nil then
			local normalized = utf8.nfcnormalize(text)
			
			if maximumCharacterLimit < (utf8.len(normalized) or #normalized) then
				p2.Text = var8.current
				
				return
			end
			var8.current = text
		end
		var10(text == "")
		
		if onChange then
			onChange(text)
		end
		var7.onTextChanged(text)
	end, { onChange, maximumCharacterLimit, var7.onTextChanged })
	local var17 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onFocusGained then
			p1.onFocusGained()
		end
	end, { p1.onFocusGained })
	local var18 = reactModule.useCallback(function(_, p2)
		-- upvalues: textBoxRef (ref), var7 (ref), var14 (ref), p1 (ref)
		local current = textBoxRef.current
		
		if (not current or not var7.interceptSend(current, p2)) and p2 then
			var14()
		end
		if p1.onFocusLost then
			p1.onFocusLost()
		end
	end, { var14, p1.onFocusLost, textBoxRef, var7.interceptSend })
	reactModule.useEffect(function()
		-- upvalues: canLocalUserChat (ref), var10 (ref)
		if not canLocalUserChat then
			var10(true)
		end
	end, { canLocalUserChat })
	local var19 = var9 or not canLocalUserChat
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		ref = var6
	}
	local t_1 = {
		Dropdown = if p1.autocomplete then reactModule.createElement(chatAutocompleteDropdownModule, {
			isOpen = var7.isOpen,
			results = var7.results,
			selectedIndex = var7.selectedIndex,
			keyboardIndex = var7.keyboardIndex,
			renderEntry = var7.renderEntry,
			anchorRef = var6,
			onHover = var7.setSelectedIndex,
			onSelect = var7.commitSelection,
			onDismiss = var7.dismiss
		}) else nil
	}
	local createElement_1 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_2 = { tag = "auto-y", Size = UDim2.fromScale(1, 0) }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local view_2 = foundationModule.View
	local t_4 = {
		cornerRadius = if expChatComposerFigmaParity then UDim.new(0, var1.Radius.Circle) else UDim.new(0, 20),
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = deriveBackgroundStyle(var2, 0.2, transparencyValue)
	}
	local t_5 = { Color = var1.Color.Stroke.Default.Color3 }
	local transparency = var1.Color.Stroke.Default.Transparency
	t_5.Transparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p2)
		-- upvalues: transparency (ref)
		return transparency + p2 * (1 - transparency)
	end) else transparency + transparencyValue * (1 - transparency)
	t_4.stroke = t_5
	t_4.padding = { right = UDim.new(0, 2) }
	local t_6 = {
		CustomDisabledContent = if var5 then p1.disabledOverlay else nil
	}
	
	if var5 then
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
				sideChipText = p1.sideChipText,
				showSideChip = p1.showSideChip,
				onSideChipActivated = p1.onSideChipActivated,
				onAbsoluteSizeChanged = var13
			})
		}
		
		if canLocalUserChat then
			createElement_4 = nil
		else
			local var20
			createElement_4 = reactModule.createElement
			local text = foundationModule.Text
			local t_9 = {
				tag = "position-top-right anchor-top-right auto-y text-caption-medium text-wrap text-align-x-left text-align-y-top content-muted",
				Text = p1.disabledChatPlaceholderText or "",
				Size = var11:map(function(p2)
					-- upvalues: var1 (ref)
					return UDim2.new(1, -(p2 + var1.Size.Size_200), 0, 0)
				end)
			}
			
			if reactIsModule.isBinding(transparencyValue) then
				local var21 = 0.5
				var20 = transparencyValue:map(function(p2)
					-- upvalues: var21 (ref)
					return var21 + p2 * (1 - var21)
				end)
			else
				var20 = transparencyValue * 0.5 + 0.5
			end
			t_9.TextTransparency = var20
			createElement_4 = createElement_4(text, t_9)
		end
		local createElement_5
		t_8.DisabledLabel = createElement_4
		
		if canLocalUserChat then
			local var22
			createElement_5 = reactModule.createElement
			local view_4 = foundationModule.View
			local t_9 = {
				tag = "position-top-right anchor-top-right auto-y",
				Size = var11:map(function(p2)
					-- upvalues: var1 (ref)
					return UDim2.new(1, -(p2 + var1.Size.Size_200), 0, 0)
				end)
			}
			local t_10 = {}
			local createElement_6 = reactModule.createElement
			local var23 = "TextBox"
			local t_11 = {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				MaxVisibleGraphemes = maximumCharacterLimit or -1,
				Font = if p1.fontFace then nil else var1.Typography.CaptionMedium.Font,
				FontFace = p1.fontFace,
				PlaceholderText = p1.placeholderText or "",
				PlaceholderColor3 = var3,
				Size = UDim2.fromScale(1, 0),
				Text = p1.defaultValue or "",
				TextColor3 = var4,
				TextSize = textSize
			}
			
			if reactIsModule.isBinding(transparencyValue) then
				local var24 = 0
				var22 = transparencyValue:map(function(p2)
					-- upvalues: var24 (ref)
					return var24 + p2 * (1 - var24)
				end)
			else
				var22 = transparencyValue * 1 + 0
			end
			t_11.TextTransparency = var22
			t_11.TextWrapped = true
			t_11.TextXAlignment = Enum.TextXAlignment.Left
			t_11.TextYAlignment = Enum.TextYAlignment.Top
			t_11.TextEditable = p1.enableFocusedWrite ~= false
			t_11.ZIndex = 2
			t_11[reactModule.Change.Text] = var16
			t_11[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var15
			t_11[reactModule.Event.Focused] = var17
			t_11[reactModule.Event.FocusLost] = var18
			t_11.ref = textBoxRef
			t_10.TextBox = createElement_6(var23, t_11)
			createElement_5 = createElement_5(view_4, t_9, t_10)
		else
			createElement_5 = nil
		end
		t_8.TextBoxContainer = createElement_5
		createElement_3 = createElement_3(view_3, t_7, t_8)
	end
	t_6.TextContainer = createElement_3
	t_6.SendButtonContainer = if not var5 then reactModule.createElement("CanvasGroup", {
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
			variant = if var19 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.InputSize.Small,
			isDisabled = var19,
			onActivated = var14
		})
	}) else nil
	t_6.DisabledOverlay = if fFlagExpChatEnableFriendsTab or canLocalUserChat or not p1.disabledOverlay then nil else reactModule.createElement(foundationModule.View, { ZIndex = 5, Size = UDim2.fromScale(1, 1) }, { Overlay = p1.disabledOverlay })
	t_3.InputGroup = createElement_2(view_2, t_4, t_6)
	t_1.Container = createElement_1(view_1, t_2, t_3)
	
	return createElement(view, t, t_1)
end)