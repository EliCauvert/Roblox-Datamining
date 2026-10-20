local ExpChat = script:FindFirstAncestor("ExpChat")
local ReactModule = require(ExpChat.Parent.React)
local Parent = ExpChat.Parent
local EmojiListModule = require(Parent.EmojiList)
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor
local ConfigModule = require(ExpChat.Config)
local PresetEntryTextModule = require(ExpChat.Autocomplete.PresetEntryText)
local FFlagExpChatPresetChatAutocompleteEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatAutocompleteEnabled)

return function(p1)
	-- upvalues: UseCursorFunction (copy), ReactModule (copy), ConfigModule (copy), EmojiListModule (copy), FFlagExpChatPresetChatAutocompleteEnabledModule (copy), PresetEntryTextModule (copy)
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, ConfigModule.AutocompleteEntryDefaultSizeY),
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = 2,
		[ReactModule.Event.MouseEnter] = p1.onAutocompleteDropdownHover
	}, {
		TextLabelButton = ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, if p1.isDividerVisible then -1 else 0),
			BackgroundTransparency = p1.setTransparency(p1.layoutOrder == p1.selectedIndex and ConfigModule.AutocompleteSelectedTransparency or 1, p1.transparencyValue),
			BackgroundColor3 = p1.layoutOrder == p1.selectedIndex and ConfigModule.AutocompleteSelectedColor or nil,
			SelectionImageObject = UseCursorFunction(),
			Text = "",
			ZIndex = 3,
			[ReactModule.Event.Activated] = p1.onAutocompleteSelected
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 15),
				PaddingRight = UDim.new(0, 30),
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 8)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			EmojiLabel = p1.autocompleteType == "emojis" and ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				LayoutOrder = 1,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = p1.chatInputBarSettings.FontFace,
				Size = UDim2.new(0, 0, 0, 0),
				Text = string.format("%s", EmojiListModule[p1.result].base),
				TextColor3 = p1.chatInputBarSettings.TextColor3,
				TextSize = p1.chatInputBarSettings.TextSize,
				TextStrokeColor3 = p1.chatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p1.setTransparency(p1.chatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
				TextTransparency = p1.setTransparency(0, p1.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			SpaceLabel = p1.autocompleteType == "emojis" and ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				Text = "  ",
				TextSize = 14,
				TextWrapped = true,
				LayoutOrder = 2,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = p1.chatInputBarSettings.FontFace,
				Size = UDim2.new(0, 0, 0, 0),
				TextColor3 = p1.chatInputBarSettings.TextColor3,
				TextStrokeColor3 = p1.chatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p1.setTransparency(p1.chatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
				TextTransparency = p1.setTransparency(0, p1.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			TextLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				LayoutOrder = 3,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = p1.chatInputBarSettings.FontFace,
				Size = UDim2.new(0, 0, 0, 0),
				Text = if FFlagExpChatPresetChatAutocompleteEnabledModule and p1.autocompleteType == "presets" then PresetEntryTextModule.decorate(p1.result, p1.chatInputBarSettings.TextSize) else string.format("%s", p1.result),
				TextColor3 = p1.chatInputBarSettings.TextColor3,
				TextSize = p1.chatInputBarSettings.TextSize,
				TextStrokeColor3 = p1.chatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p1.setTransparency(p1.chatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
				TextTransparency = p1.setTransparency(0, p1.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		}),
		Divider = p1.isDividerVisible and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = p1.setTransparency(ConfigModule.ChatInputBarBorderTransparency, p1.transparencyValue),
			BackgroundColor3 = ConfigModule.ChatInputBarBorderColor3
		}) or nil
	})
end