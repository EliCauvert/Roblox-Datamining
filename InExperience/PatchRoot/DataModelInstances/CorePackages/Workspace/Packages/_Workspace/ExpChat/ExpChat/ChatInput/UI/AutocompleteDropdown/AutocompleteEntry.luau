local expChat = script:FindFirstAncestor("ExpChat")
local reactModule = require(expChat.Parent.React)
local parent = expChat.Parent
local emojiListModule = require(parent.EmojiList)
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor
local configModule = require(expChat.Config)
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)

return function(p0) --[[ line: 14 ]]
	-- upvalues: fFlagExpChatEnableFocusNavigationModule (ref), useCursor (ref), reactModule (ref), configModule (ref), emojiListModule (ref)
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, configModule.AutocompleteEntryDefaultSizeY),
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		ZIndex = 2,
		[reactModule.Event.MouseEnter] = p0.onAutocompleteDropdownHover
	}, {
		TextLabelButton = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, if p0.isDividerVisible then -1 else 0),
			BackgroundTransparency = p0.setTransparency(if p0.layoutOrder == p0.selectedIndex then configModule.AutocompleteSelectedTransparency else 1, p0.transparencyValue),
			BackgroundColor3 = if p0.layoutOrder == p0.selectedIndex then configModule.AutocompleteSelectedColor else nil,
			SelectionImageObject = if fFlagExpChatEnableFocusNavigationModule then useCursor() else nil,
			Text = "",
			ZIndex = 3,
			[reactModule.Event.Activated] = p0.onAutocompleteSelected
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 15),
				PaddingRight = UDim.new(0, 30),
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 8)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			EmojiLabel = p0.autocompleteType == "emojis" and reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				LayoutOrder = 1,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = p0.chatInputBarSettings.FontFace,
				Size = UDim2.new(0, 0, 0, 0),
				Text = string.format("%s", emojiListModule[p0.result].base),
				TextColor3 = p0.chatInputBarSettings.TextColor3,
				TextSize = p0.chatInputBarSettings.TextSize,
				TextStrokeColor3 = p0.chatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p0.setTransparency(p0.chatInputBarSettings.TextStrokeTransparency, p0.transparencyValue),
				TextTransparency = p0.setTransparency(0, p0.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			SpaceLabel = p0.autocompleteType == "emojis" and reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				Text = "  ",
				TextSize = 14,
				TextWrapped = true,
				LayoutOrder = 2,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = p0.chatInputBarSettings.FontFace,
				Size = UDim2.new(0, 0, 0, 0),
				TextColor3 = p0.chatInputBarSettings.TextColor3,
				TextStrokeColor3 = p0.chatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p0.setTransparency(p0.chatInputBarSettings.TextStrokeTransparency, p0.transparencyValue),
				TextTransparency = p0.setTransparency(0, p0.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			TextLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				LayoutOrder = 3,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = p0.chatInputBarSettings.FontFace,
				Size = UDim2.new(0, 0, 0, 0),
				Text = string.format("%s", p0.result),
				TextColor3 = p0.chatInputBarSettings.TextColor3,
				TextSize = p0.chatInputBarSettings.TextSize,
				TextStrokeColor3 = p0.chatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p0.setTransparency(p0.chatInputBarSettings.TextStrokeTransparency, p0.transparencyValue),
				TextTransparency = p0.setTransparency(0, p0.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		}),
		Divider = p0.isDividerVisible and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = p0.setTransparency(configModule.ChatInputBarBorderTransparency, p0.transparencyValue),
			BackgroundColor3 = configModule.ChatInputBarBorderColor3
		}) or nil
	})
end