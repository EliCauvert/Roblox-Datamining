local ExpChat = script:FindFirstAncestor("ExpChat")
local TextChatService = game:GetService("TextChatService")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FoundationModule = require(Parent.Foundation)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local List = require(Parent.llama).List
local Dictionary = require(Parent.llama).Dictionary
local ConfigModule = require(ExpChat.Config)
local AutocompleteEntryModule = require(script.Parent.AutocompleteEntry)
local AutocompleteEntryV2Module = require(script.Parent.AutocompleteEntryV2)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local FFlagExpChatAutocompleteDropdownRedesignModule = require(ExpChat.Flags.FFlagExpChatAutocompleteDropdownRedesign)
local FFlagExpChatEmojiDropdownShowAnalyticsModule = require(ExpChat.Flags.FFlagExpChatEmojiDropdownShowAnalytics)
local FFlagExpChatEmojiDropdownDismissAnalyticsModule = require(ExpChat.Flags.FFlagExpChatEmojiDropdownDismissAnalytics)
local UseEmojiDropdownDismissAnalyticsModule = require(script.Parent.useEmojiDropdownDismissAnalytics)
local AutocompleteEntryV2Module1 = if FFlagExpChatAutocompleteDropdownRedesignModule then AutocompleteEntryV2Module else AutocompleteEntryModule

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FFlagExpChatAutocompleteDropdownRedesignModule (copy), FoundationModule (copy), UseStyleFunction (copy), FFlagExpChatEmojiDropdownShowAnalyticsModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), FFlagExpChatEmojiDropdownDismissAnalyticsModule (copy), UseEmojiDropdownDismissAnalyticsModule (copy), Dictionary (copy), AutocompleteEntryV2Module1 (copy), List (copy), ConfigModule (copy), TextChatService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = if FFlagExpChatAutocompleteDropdownRedesignModule then FoundationModule.Hooks.useTokens() else nil
	local Theme = UseStyleFunction().Theme
	
	if FFlagExpChatEmojiDropdownShowAnalyticsModule then
		local IsIsChatInputBarVisible: boolean = p1.activated and (#p1.results > 0 and p1.autocompleteType == "emojis" and p1.isChatInputBarVisible ~= false)
		ReactModule.useEffect(function()
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
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: Dictionary (upval), ReactModule (upval), AutocompleteEntryV2Module1 (upval), FFlagExpChatAutocompleteDropdownRedesignModule (upval), p1 (copy), List (upval), UseTokensResult (copy)
		local MapResult = Dictionary.map(p2, function(Result, LayoutOrder)
			-- upvalues: ReactModule (upval), AutocompleteEntryV2Module1 (upval), FFlagExpChatAutocompleteDropdownRedesignModule (upval), p1 (upval), List (upval), p2 (copy)
			return ReactModule.createElement(AutocompleteEntryV2Module1, {
				result = Result,
				query = if FFlagExpChatAutocompleteDropdownRedesignModule then p1.query else nil,
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
		MapResult["$layout"] = ReactModule.createElement("UIListLayout", {
			Padding = if FFlagExpChatAutocompleteDropdownRedesignModule then UDim.new(0, UseTokensResult.Gap.XXSmall) else nil,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		
		return MapResult
	end)
	
	local function setCanvasPosition(): Vector2
		-- upvalues: UseRefResult (copy), p1 (copy), ConfigModule (upval), FFlagExpChatAutocompleteDropdownRedesignModule (upval), UseTokensResult (copy)
		if not UseRefResult.current then
			return Vector2.new(0, 0)
		end
		local Current = p1.autocompleteDropdownRef.current
		local Y = if Current then if FFlagExpChatAutocompleteDropdownRedesignModule then UseRefResult.current.AbsoluteSize.Y else Current.AbsoluteSize.Y or ConfigModule.AutocompleteFrameDefaultSizeY elseif FFlagExpChatAutocompleteDropdownRedesignModule then UseRefResult.current.AbsoluteSize.Y else ConfigModule.AutocompleteFrameDefaultSizeY
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
		local NewY1 = Y1 + Y
		local NewYDelta = NewY - NewTextSize
		
		if FFlagExpChatAutocompleteDropdownRedesignModule then
			local ScaledXXSmall = UseTokensResult.Gap.XXSmall * math.max(p1.selectedIndex - 1, 0)
			NewYDelta += ScaledXXSmall
			NewY += ScaledXXSmall
		end
		return Vector2.new(0, if NewY1 < NewY then if NewYDelta < Y1 then NewYDelta else NewY - Y elseif NewYDelta < Y1 then NewYDelta else Y1)
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
	local _UDim2 = nil
	local _UDim2_1 = nil
	
	if FFlagExpChatAutocompleteDropdownRedesignModule then
		local Smallest = math.min(#p1.results, 3.5)
		_UDim2 = UDim2.new(1, 0, 0, 2 * UseTokensResult.Padding.Small + Smallest * UseTokensResult.Size.Size_1000 + math.max(math.ceil(Smallest) - 1, 0) * UseTokensResult.Gap.XXSmall)
		local XSmall = UseTokensResult.Gap.XSmall
		_UDim2_1 = UDim2.new(0, 0, 0, if NoEnabled then (NewY or 0) + XSmall else -XSmall)
	else
		_UDim2 = UDim2.new(0.95, 0, 0, #p1.results > 3 and ConfigModule.AutocompleteFrameDefaultSizeY or #p1.results * ConfigModule.AutocompleteEntryDefaultSizeY)
		_UDim2_1 = UDim2.new(0, 0, 0, NoEnabled and NewY or 0)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		AnchorPoint = NoEnabled and Vector2.new(0, 0) or Vector2.new(0, 1),
		Size = _UDim2,
		Position = _UDim2_1,
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
				Color = if FFlagExpChatAutocompleteDropdownRedesignModule then UseTokensResult.Color.Stroke.Default.Color3 else ConfigModule.ChatInputBarBorderColor3,
				Transparency = p1.setTransparency(if FFlagExpChatAutocompleteDropdownRedesignModule then UseTokensResult.Color.Stroke.Default.Transparency else ConfigModule.ChatInputBarBorderTransparency, p1.transparencyValue)
			}),
			Corner = ReactModule.createElement("UICorner", {
				CornerRadius = if FFlagExpChatAutocompleteDropdownRedesignModule then UDim.new(0, UseTokensResult.Radius.Large) else UDim.new(0, 3)
			}),
			ScrollViewFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				UIPadding = if FFlagExpChatAutocompleteDropdownRedesignModule then ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingRight = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingTop = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingBottom = UDim.new(0, UseTokensResult.Padding.Small)
				}) else nil,
				ScrollView = ReactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ScrollBarThickness = 4,
					Selectable = false,
					ZIndex = 2,
					Size = if FFlagExpChatAutocompleteDropdownRedesignModule then UDim2.fromScale(1, 1) else UDim2.new(1, -4, 1, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = if FFlagExpChatAutocompleteDropdownRedesignModule then UDim2.new() else UDim2.new(0, 0, 0, #p1.results * ConfigModule.AutocompleteEntryDefaultSizeY),
					CanvasPosition = setCanvasPosition(),
					ScrollBarImageColor3 = Theme.UIEmphasis.Color,
					ScrollBarImageTransparency = p1.setTransparency(0, p1.transparencyValue),
					VerticalScrollBarInset = if FFlagExpChatAutocompleteDropdownRedesignModule then Enum.ScrollBarInset.ScrollBar else Enum.ScrollBarInset.Always,
					ClipsDescendants = if FFlagExpChatAutocompleteDropdownRedesignModule then true else false,
					ref = UseRefResult
				}, {
					OffsetFrame = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = if FFlagExpChatAutocompleteDropdownRedesignModule then Enum.AutomaticSize.Y else nil,
						Size = if FFlagExpChatAutocompleteDropdownRedesignModule then UDim2.fromScale(1, 0) else UDim2.new(1, 8, 1, 0)
					}, UseResult(p1.results))
				})
			})
		})
	})
end)