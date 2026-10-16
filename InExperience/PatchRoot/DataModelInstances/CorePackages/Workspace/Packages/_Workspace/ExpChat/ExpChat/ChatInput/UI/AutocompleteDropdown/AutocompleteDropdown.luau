local ExpChat = script:FindFirstAncestor("ExpChat")
local TextChatService = game:GetService("TextChatService")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local List = require(Parent.llama).List
local Dictionary = require(Parent.llama).Dictionary
local ConfigModule = require(ExpChat.Config)
local AutocompleteEntryModule = require(script.Parent.AutocompleteEntry)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local FFlagExpChatEmojiDropdownShowAnalyticsModule = require(ExpChat.Flags.FFlagExpChatEmojiDropdownShowAnalytics)
local FFlagExpChatEmojiDropdownDismissAnalyticsModule = require(ExpChat.Flags.FFlagExpChatEmojiDropdownDismissAnalytics)
local UseEmojiDropdownDismissAnalyticsModule = require(script.Parent.useEmojiDropdownDismissAnalytics)

return ReactModule.memo(function(p1) --[[ Line: 25 | Named "AutoCompleteDropdown" ]]
	-- upvalues: ReactModule (copy), UseStyleFunction (copy), FFlagExpChatEmojiDropdownShowAnalyticsModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), FFlagExpChatEmojiDropdownDismissAnalyticsModule (copy), UseEmojiDropdownDismissAnalyticsModule (copy), Dictionary (copy), AutocompleteEntryModule (copy), List (copy), ConfigModule (copy), TextChatService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local Theme = UseStyleFunction().Theme
	
	if FFlagExpChatEmojiDropdownShowAnalyticsModule then
		local IsIsChatInputBarVisible: boolean = p1.activated and (#p1.results > 0 and p1.autocompleteType == "emojis" and p1.isChatInputBarVisible ~= false)
		ReactModule.useEffect(function() --[[ Line: 37 ]]
			-- upvalues: IsIsChatInputBarVisible (copy), ExpChatSharedModule (upval), ConstantsModule (upval)
			if IsIsChatInputBarVisible then
				ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
					event_type = ConstantsModule.Analytics.EventTypes.Show,
					component = ConstantsModule.Analytics.Components.EmojiDropdown
				}, ConstantsModule.Analytics.ExtendedStandardizedFields)
			end
		end, { IsIsChatInputBarVisible })
		
		if FFlagExpChatEmojiDropdownDismissAnalyticsModule then
			UseEmojiDropdownDismissAnalyticsModule(IsIsChatInputBarVisible, p1.results, p1.chosenEmojiForAnalyticsRef)
		end
	end
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 51 ]]
		-- upvalues: Dictionary (upval), ReactModule (upval), AutocompleteEntryModule (upval), p1 (copy), List (upval)
		local MapResult = Dictionary.map(p2, function(Result, LayoutOrder) --[[ Line: 52 ]]
			-- upvalues: ReactModule (upval), AutocompleteEntryModule (upval), p1 (upval), List (upval), p2 (copy)
			return ReactModule.createElement(AutocompleteEntryModule, {
				result = Result,
				layoutOrder = LayoutOrder,
				chatInputBarSettings = p1.chatInputBarSettings,
				setTransparency = p1.setTransparency,
				transparencyValue = p1.transparencyValue,
				isDividerVisible = List.count(p2) ~= LayoutOrder,
				selectedIndex = p1.selectedIndex,
				autocompleteType = p1.autocompleteType,
				onAutocompleteDropdownHover = p1.onAutocompleteDropdownHover,
				onAutocompleteSelected = p1.onAutocompleteSelected
			}), Result
		end)
		MapResult["$layout"] = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
		
		return MapResult
	end)
	
	local function setCanvasPosition(): Vector2 --[[ Line: 76 ]]
		-- upvalues: UseRefResult (copy), p1 (copy), ConfigModule (upval)
		if not UseRefResult.current then
			return Vector2.new(0, 0)
		end
		local Current = p1.autocompleteDropdownRef.current
		local Y = Current and Current.AbsoluteSize.Y or ConfigModule.AutocompleteFrameDefaultSizeY
		local NewTextSize = p1.chatInputBarSettings.TextSize + 16
		local NewY = 0
		
		if Current and Current:FindFirstChild("ScrollBarFrame") and Current.ScrollBarFrame:FindFirstChild("ScrollViewFrame") and Current.ScrollBarFrame.ScrollViewFrame:FindFirstChild("ScrollView") and Current.ScrollBarFrame.ScrollViewFrame.ScrollView:FindFirstChild("OffsetFrame") then
			for _, Frame in ipairs(Current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
				if Frame.ClassName == "Frame" and Frame.LayoutOrder <= p1.selectedIndex then
					NewY += Frame.AbsoluteSize.Y
					
					if Frame.LayoutOrder == p1.selectedIndex then
						NewTextSize = Frame.AbsoluteSize.Y
					end
				end
			end
		end
		local Y1: number = UseRefResult.current.CanvasPosition.Y
		local NewYDelta = NewY - NewTextSize
		
		return Vector2.new(0, if Y1 + Y < NewY then if NewYDelta < Y1 then NewYDelta else NewY - Y elseif NewYDelta < Y1 then NewYDelta else Y1)
	end
	
	local VerticalAlignment = nil
	local Enabled = false
	local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	
	if ChatWindowConfiguration then
		VerticalAlignment = ChatWindowConfiguration.VerticalAlignment
		Enabled = ChatWindowConfiguration.Enabled
	end
	local NoEnabled: boolean = VerticalAlignment == Enum.VerticalAlignment.Top and not Enabled
	local NewY = p1.textBoxRef.current and p1.textBoxRef.current.AbsoluteSize.Y + 20
	local ChatWindow = p1.autocompleteDropdownRef.current and p1.autocompleteDropdownRef.current:FindFirstAncestor("appLayout") and p1.autocompleteDropdownRef.current:FindFirstAncestor("appLayout"):FindFirstChild("chatWindow") or nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		AnchorPoint = NoEnabled and Vector2.new(0, 0) or Vector2.new(0, 1),
		Size = UDim2.new(0.95, 0, 0, #p1.results > 3 and ConfigModule.AutocompleteFrameDefaultSizeY or #p1.results * ConfigModule.AutocompleteEntryDefaultSizeY),
		Position = UDim2.new(0, 0, 0, NoEnabled and NewY or 0),
		Visible = p1.activated and #p1.results > 0,
		ref = p1.autocompleteDropdownRef
	}, {
		UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(ConfigModule.ChatWindowMaxWidth, ChatWindow and not NoEnabled and ChatWindow.AbsoluteSize.Y or 1e999)
		}),
		ScrollBarFrame = ReactModule.createElement("Frame", {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = p1.setTransparency(0, p1.transparencyValue),
			BackgroundColor3 = p1.chatInputBarSettings.BackgroundColor3
		}, {
			Border = ReactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = ConfigModule.ChatInputBarBorderColor3,
				Transparency = p1.setTransparency(ConfigModule.ChatInputBarBorderTransparency, p1.transparencyValue)
			}),
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) }),
			ScrollViewFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				ScrollView = ReactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ScrollBarThickness = 4,
					ClipsDescendants = false,
					Selectable = false,
					ZIndex = 2,
					Size = UDim2.new(1, -4, 1, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(0, 0, 0, #p1.results * ConfigModule.AutocompleteEntryDefaultSizeY),
					CanvasPosition = setCanvasPosition(),
					ScrollBarImageColor3 = Theme.UIEmphasis.Color,
					ScrollBarImageTransparency = p1.setTransparency(0, p1.transparencyValue),
					VerticalScrollBarInset = Enum.ScrollBarInset.Always,
					ref = UseRefResult
				}, {
					OffsetFrame = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 8, 1, 0) }, UseResult(p1.results))
				})
			})
		})
	})
end)