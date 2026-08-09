local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local channelChipModule = require(script.Parent.ChannelChip)

local function _(p0, p1) --[[ line: 15 | named "fade" ]]
	return p0 + p1 * (1 - p0)
end

local _ = function(p2, p3) --[[ line: 19 | named "deriveTransparency" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p3) then p3:map(function(p4) --[[ line: 24 ]]
		-- upvalues: p2 (ref)
		return p2 + p4 * (1 - p2)
	end) else p2 + p3 * (1 - p2)
end

local function deriveBackgroundStyle(value, p5, p6) --[[ line: 34 ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p6) then p6:map(function(p7) --[[ line: 40 ]]
		-- upvalues: value (ref), p5 (ref)
		return { Color3 = value, Transparency = p5 + p7 * (1 - p5) }
	end) else { Color3 = value, Transparency = p5 + p6 * (1 - p5) }
end

return reactModule.memo(function(p8) --[[ line: 71 | named "ChatInputBarView" ]]
	-- upvalues: foundationModule (ref), reactModule (ref), deriveBackgroundStyle (ref), reactIsModule (ref), channelChipModule (ref)
	local createElement_4
	local var5 = foundationModule.Hooks.useTokens()
	local onChange = p8.onChange
	local onSend = p8.onSend
	local canLocalUserChat = p8.canLocalUserChat
	local transparencyValue = p8.transparencyValue or 0
	local textSize = p8.textSize or var5.Typography.CaptionMedium.FontSize
	local maximumCharacterLimit = p8.maximumCharacterLimit
	local textBoxRef = p8.textBoxRef or reactModule.useRef(nil)
	local var9 = reactModule.useRef(p8.defaultValue or "")
	local var10, var11 = reactModule.useState(function() --[[ line: 84 ]]
		-- upvalues: p8 (ref)
		return (p8.defaultValue or "") == ""
	end)
	local var12, var13 = reactModule.useBinding(0)
	local var14 = reactModule.useCallback(function(p9) --[[ line: 90 ]]
		-- upvalues: var13 (ref)
		var13(p9.AbsoluteSize.X)
	end, {})
	local var15 = reactModule.useCallback(function() --[[ line: 94 ]]
		-- upvalues: textBoxRef (ref), onSend (ref), var11 (ref)
		local current = textBoxRef.current
		local var37 = if current then current.Text else ""
		
		if var37 == "" then return end
		onSend(var37)
		
		if current then
			current.Text = ""
		end
		var11(true)
	end, { onSend, textBoxRef })
	local var16 = reactModule.useCallback(function(p10) --[[ line: 107 ]]
		-- upvalues: maximumCharacterLimit (ref), var9 (ref), var11 (ref), onChange (ref)
		local text = p10.Text
		
		if maximumCharacterLimit ~= nil then
			local normalized = utf8.nfcnormalize(text)
			
			if maximumCharacterLimit < (utf8.len(normalized) or #normalized) then
				p10.Text = var9.current
				
				return
			end
			var9.current = text
		end
		var11(text == "")
		
		if onChange then
			onChange(text)
		end
	end, { onChange, maximumCharacterLimit })
	local var17 = reactModule.useCallback(function() --[[ line: 124 ]]
		-- upvalues: p8 (ref)
		if p8.onFocusGained then
			p8.onFocusGained()
		end
	end, { p8.onFocusGained })
	local var18 = reactModule.useCallback(function(_, p11) --[[ line: 130 ]]
		-- upvalues: var15 (ref), p8 (ref), textBoxRef (ref)
		if p11 then
			var15()
			
			if p8.retainFocusOnSend then
				task.delay(0, function() --[[ line: 134 ]]
					-- upvalues: textBoxRef (copy)
					local current = textBoxRef.current
					
					if current then
						current:CaptureFocus()
					end
				end)
			end
		end
		if p8.onFocusLost then
			p8.onFocusLost()
		end
	end, { var15, p8.onFocusLost, p8.retainFocusOnSend, textBoxRef })
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = { tag = "auto-xy", Size = UDim2.new(1, 0, 0, 0) }
	local t_1 = {}
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
		backgroundStyle = deriveBackgroundStyle(var5.DarkMode.Surface.Surface_100.Color3, 0.2, transparencyValue)
	}
	local t_5 = { Color = var5.Color.Stroke.Default.Color3 }
	local transparency = var5.Color.Stroke.Default.Transparency
	t_5.Transparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p12) --[[ line: 24 ]]
		-- upvalues: transparency (ref)
		return transparency + p12 * (1 - transparency)
	end) else transparency + transparencyValue * (1 - transparency)
	t_4.stroke = t_5
	t_4.padding = { right = UDim.new(0, 2) }
	local t_6 = {}
	local createElement_3 = reactModule.createElement
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
			onAbsoluteSizeChanged = var14
		})
	}
	
	if canLocalUserChat then
		createElement_4 = nil
	else
		local var30
		createElement_4 = reactModule.createElement
		local text = foundationModule.Text
		local t_9 = {
			tag = "text-caption-medium text-wrap text-align-x-left text-align-y-top content-muted",
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p8.disabledChatPlaceholderText or "",
			Position = UDim2.fromScale(1, 0),
			Size = var12:map(function(p13) --[[ line: 200 ]]
				return UDim2.new(1, -(p13 + 8), 0, 0)
			end)
		}
		
		if reactIsModule.isBinding(transparencyValue) then
			local var29 = 0.5
			var30 = transparencyValue:map(function(p14) --[[ line: 24 ]]
				-- upvalues: var29 (ref)
				return var29 + p14 * (1 - var29)
			end)
		else
			var30 = transparencyValue * 0.5 + 0.5
		end
		t_9.TextTransparency = var30
		createElement_4 = createElement_4(text, t_9)
	end
	local createElement_5
	t_8.DisabledLabel = createElement_4
	
	if canLocalUserChat then
		local var36
		createElement_5 = reactModule.createElement
		local view_4 = foundationModule.View
		local t_9 = {
			tag = "auto-y",
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = var12:map(function(p15) --[[ line: 212 ]]
				return UDim2.new(1, -(p15 + 8), 0, 0)
			end)
		}
		local t_10 = {}
		local createElement_6 = reactModule.createElement
		local var33 = "TextBox"
		local t_11 = {
			AnchorPoint = Vector2.new(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			MaxVisibleGraphemes = maximumCharacterLimit or -1,
			Font = var5.Typography.CaptionMedium.Font,
			PlaceholderText = p8.placeholderText or "",
			PlaceholderColor3 = var5.DarkMode.Content.Muted.Color3,
			Size = UDim2.fromScale(1, 0),
			Text = p8.defaultValue or "",
			TextColor3 = var5.DarkMode.Content.Emphasis.Color3,
			TextSize = textSize
		}
		
		if reactIsModule.isBinding(transparencyValue) then
			local var35 = 0
			var36 = transparencyValue:map(function(p16) --[[ line: 24 ]]
				-- upvalues: var35 (ref)
				return var35 + p16 * (1 - var35)
			end)
		else
			var36 = transparencyValue * 1 + 0
		end
		t_11.TextTransparency = var36
		t_11.TextWrapped = true
		t_11.TextXAlignment = Enum.TextXAlignment.Left
		t_11.TextYAlignment = Enum.TextYAlignment.Top
		t_11.TextEditable = p8.enableFocusedWrite ~= false
		t_11.ZIndex = 2
		t_11[reactModule.Change.Text] = var16
		t_11[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var15
		t_11[reactModule.Event.Focused] = var17
		t_11[reactModule.Event.FocusLost] = var18
		t_11.ref = textBoxRef
		t_10.TextBox = createElement_6(var33, t_11)
		createElement_5 = createElement_5(view_4, t_9, t_10)
	else
		createElement_5 = nil
	end
	t_8.TextBoxContainer = createElement_5
	t_6.TextContainer = createElement_3(view_3, t_7, t_8)
	t_6.SendButtonContainer = reactModule.createElement("CanvasGroup", {
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
			variant = if var10 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.InputSize.Small,
			isDisabled = var10,
			onActivated = var15
		})
	})
	t_6.DisabledOverlay = if canLocalUserChat or not p8.disabledOverlay then nil else reactModule.createElement(foundationModule.View, { ZIndex = 5, Size = UDim2.fromScale(1, 1) }, { Overlay = p8.disabledOverlay })
	t_3.InputGroup = createElement_2(view_2, t_4, t_6)
	t_1.Container = createElement_1(view_1, t_2, t_3)
	
	return createElement(view, t, t_1)
end)