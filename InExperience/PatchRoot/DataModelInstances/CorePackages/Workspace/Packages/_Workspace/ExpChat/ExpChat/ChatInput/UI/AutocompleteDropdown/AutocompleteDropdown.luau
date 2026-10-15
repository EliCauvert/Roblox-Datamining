local expChat = script:FindFirstAncestor("ExpChat")
local textChatService = game:GetService("TextChatService")
local parent = expChat.Parent
local reactModule = require(parent.React)
local expChatSharedModule = require(parent.ExpChatShared)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local list = require(parent.llama).List
local dictionary = require(parent.llama).Dictionary
local configModule = require(expChat.Config)
local autocompleteEntryModule = require(script.Parent.AutocompleteEntry)
local constantsModule = require(expChat.PresetChat.Constants)
local fFlagExpChatEmojiDropdownShowAnalyticsModule = require(expChat.Flags.FFlagExpChatEmojiDropdownShowAnalytics)
local fFlagExpChatEmojiDropdownDismissAnalyticsModule = require(expChat.Flags.FFlagExpChatEmojiDropdownDismissAnalytics)
local useEmojiDropdownDismissAnalyticsModule = require(script.Parent.useEmojiDropdownDismissAnalytics)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useStyle (ref), fFlagExpChatEmojiDropdownShowAnalyticsModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatEmojiDropdownDismissAnalyticsModule (ref), useEmojiDropdownDismissAnalyticsModule (ref), dictionary (ref), autocompleteEntryModule (ref), list (ref), configModule (ref), textChatService (ref)
	local var1 = reactModule.useRef(nil)
	local theme = useStyle().Theme
	
	if fFlagExpChatEmojiDropdownShowAnalyticsModule then
		local var2 = p1.activated and (#p1.results > 0 and (p1.autocompleteType == "emojis" and p1.isChatInputBarVisible ~= false))
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), expChatSharedModule (copy), constantsModule (copy)
			if var2 then
				expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
					event_type = constantsModule.Analytics.EventTypes.Show,
					component = constantsModule.Analytics.Components.EmojiDropdown
				}, constantsModule.Analytics.ExtendedStandardizedFields)
			end
		end, { var2 })
		
		if fFlagExpChatEmojiDropdownDismissAnalyticsModule then
			useEmojiDropdownDismissAnalyticsModule(var2, p1.results, p1.chosenEmojiForAnalyticsRef)
		end
	end
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: dictionary (copy), reactModule (copy), autocompleteEntryModule (copy), p1 (ref), list (copy)
		local var4 = dictionary.map(p2, function(p3, p4)
			-- upvalues: reactModule (copy), autocompleteEntryModule (copy), p1 (copy), list (copy), p2 (ref)
			return reactModule.createElement(autocompleteEntryModule, {
				result = p3,
				layoutOrder = p4,
				chatInputBarSettings = p1.chatInputBarSettings,
				setTransparency = p1.setTransparency,
				transparencyValue = p1.transparencyValue,
				isDividerVisible = list.count(p2) ~= p4,
				selectedIndex = p1.selectedIndex,
				autocompleteType = p1.autocompleteType,
				onAutocompleteDropdownHover = p1.onAutocompleteDropdownHover,
				onAutocompleteSelected = p1.onAutocompleteSelected
			}), p3
		end)
		var4["$layout"] = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
		
		return var4
	end)
	
	local function setCanvasPosition()
		-- upvalues: var1 (ref), p1 (ref), configModule (copy)
		if not var1.current then
			return Vector2.new(0, 0)
		end
		local current = p1.autocompleteDropdownRef.current
		local var4 = if current then current.AbsoluteSize.Y else configModule.AutocompleteFrameDefaultSizeY
		local var5 = p1.chatInputBarSettings.TextSize + 16
		local var6 = 0
		
		if current and current:FindFirstChild("ScrollBarFrame") and (current.ScrollBarFrame:FindFirstChild("ScrollViewFrame") and current.ScrollBarFrame.ScrollViewFrame:FindFirstChild("ScrollView")) and current.ScrollBarFrame.ScrollViewFrame.ScrollView:FindFirstChild("OffsetFrame") then
			for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
				if v.ClassName == "Frame" and v.LayoutOrder <= p1.selectedIndex then
					var6 += v.AbsoluteSize.Y
					
					if v.LayoutOrder == p1.selectedIndex then
						var5 = v.AbsoluteSize.Y
					end
				end
			end
		end
		local y = var1.current.CanvasPosition.Y
		local var7 = var6 - var5
		
		return Vector2.new(0, if var7 < y then var7 elseif y + var4 < var6 then var6 - var4 else y)
	end
	
	local verticalAlignment = nil
	local enabled = false
	local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	
	if chatWindowConfiguration then
		verticalAlignment = chatWindowConfiguration.VerticalAlignment
		enabled = chatWindowConfiguration.Enabled
	end
	local y
	local var8 = verticalAlignment == Enum.VerticalAlignment.Top and not enabled
	local var9 = p1.textBoxRef.current and p1.textBoxRef.current.AbsoluteSize.Y + 20
	local chatWindow = p1.autocompleteDropdownRef.current and (p1.autocompleteDropdownRef.current:FindFirstAncestor("appLayout") and (p1.autocompleteDropdownRef.current:FindFirstAncestor("appLayout"):FindFirstChild("chatWindow") or nil))
	local createElement = reactModule.createElement
	local var10 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		ZIndex = 2,
		AnchorPoint = var8 and Vector2.new(0, 0) or Vector2.new(0, 1),
		Size = UDim2.new(0.95, 0, 0, if #p1.results > 3 then configModule.AutocompleteFrameDefaultSizeY else #p1.results * configModule.AutocompleteEntryDefaultSizeY),
		Position = UDim2.new(0, 0, 0, if var8 then var9 else 0),
		Visible = p1.activated and #p1.results > 0,
		ref = p1.autocompleteDropdownRef
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var11 = "UISizeConstraint"
	local t_2 = {}
	local new = Vector2.new
	local chatWindowMaxWidth = configModule.ChatWindowMaxWidth
	
	if chatWindow and not var8 then
		y = chatWindow.AbsoluteSize.Y or 1e999
	end
	t_2.MaxSize = new(chatWindowMaxWidth, y)
	t_1.UISizeConstraint = createElement_1(var11, t_2)
	t_1.ScrollBarFrame = reactModule.createElement("Frame", {
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = p1.setTransparency(0, p1.transparencyValue),
		BackgroundColor3 = p1.chatInputBarSettings.BackgroundColor3
	}, {
		Border = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChatInputBarBorderColor3,
			Transparency = p1.setTransparency(configModule.ChatInputBarBorderTransparency, p1.transparencyValue)
		}),
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) }),
		ScrollViewFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, {
			ScrollView = reactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ClipsDescendants = false,
				Selectable = false,
				ZIndex = 2,
				Size = UDim2.new(1, -4, 1, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, #p1.results * configModule.AutocompleteEntryDefaultSizeY),
				CanvasPosition = setCanvasPosition(),
				ScrollBarImageColor3 = theme.UIEmphasis.Color,
				ScrollBarImageTransparency = p1.setTransparency(0, p1.transparencyValue),
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				ref = var1
			}, {
				OffsetFrame = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 8, 1, 0) }, var3(p1.results))
			})
		})
	})
	
	return createElement(var10, t, t_1)
end)