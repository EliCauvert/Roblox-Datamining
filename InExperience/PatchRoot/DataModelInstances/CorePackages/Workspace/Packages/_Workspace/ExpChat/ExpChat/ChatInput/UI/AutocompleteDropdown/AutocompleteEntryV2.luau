local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local EmojiListModule = require(Parent.EmojiList)
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor
local ConfigModule = require(ExpChat.Config)
local PresetEntryTextModule = require(ExpChat.Autocomplete.PresetEntryText)
local HighlightMatchedTextModule = require(ExpChat.Autocomplete.highlightMatchedText)

return function(p1)
	-- upvalues: FoundationModule (copy), UseCursorFunction (copy), HighlightMatchedTextModule (copy), PresetEntryTextModule (copy), ReactModule (copy), ConfigModule (copy), EmojiListModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseCursorResult = UseCursorFunction()
	local ChatInputBarSettings = p1.chatInputBarSettings
	local IsLayoutOrderMatch = p1.layoutOrder == p1.selectedIndex
	local Size1000 = UseTokensResult.Size.Size_1000
	local HighlightMatchedTextModuleResult = HighlightMatchedTextModule(p1.result, p1.query, ChatInputBarSettings.TextColor3:Lerp(ChatInputBarSettings.BackgroundColor3, 0.3))
	
	if p1.autocompleteType == "presets" then
		HighlightMatchedTextModuleResult = PresetEntryTextModule.decorate(HighlightMatchedTextModuleResult, ChatInputBarSettings.TextSize)
	end
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, Size1000),
		ZIndex = 2,
		[ReactModule.Event.MouseEnter] = p1.onAutocompleteDropdownHover
	}, {
		TextLabelButton = ReactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = if IsLayoutOrderMatch then ConfigModule.AutocompleteSelectedColor else nil,
			BackgroundTransparency = p1.setTransparency(if IsLayoutOrderMatch then ConfigModule.AutocompleteSelectedTransparency else 1, p1.transparencyValue),
			SelectionImageObject = UseCursorResult,
			Size = UDim2.new(1, 0, 0, Size1000),
			Text = "",
			ZIndex = 3,
			[ReactModule.Event.Activated] = p1.onAutocompleteSelected
		}, {
			UICorner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseTokensResult.Padding.Small),
				PaddingRight = UDim.new(0, UseTokensResult.Padding.Small),
				PaddingTop = UDim.new(0, UseTokensResult.Padding.XSmall),
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.XSmall)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, UseTokensResult.Gap.Medium),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			EmojiLabel = if p1.autocompleteType == "emojis" then ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = ChatInputBarSettings.FontFace,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_600, 0),
				Text = EmojiListModule[p1.result].base,
				TextColor3 = ChatInputBarSettings.TextColor3,
				TextSize = ChatInputBarSettings.TextSize,
				TextStrokeColor3 = ChatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p1.setTransparency(ChatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
				TextTransparency = p1.setTransparency(0, p1.transparencyValue)
			}) else nil,
			TextLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				RichText = true,
				TextWrapped = true,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				FontFace = ChatInputBarSettings.FontFace,
				Size = UDim2.new(),
				Text = HighlightMatchedTextModuleResult,
				TextColor3 = ChatInputBarSettings.TextColor3,
				TextSize = ChatInputBarSettings.TextSize,
				TextStrokeColor3 = ChatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p1.setTransparency(ChatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
				TextTransparency = p1.setTransparency(0, p1.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
			})
		})
	})
end