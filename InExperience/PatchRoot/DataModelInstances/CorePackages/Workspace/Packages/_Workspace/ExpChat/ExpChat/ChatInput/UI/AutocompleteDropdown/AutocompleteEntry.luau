local expChat = script:FindFirstAncestor("ExpChat")
local reactModule = require(expChat.Parent.React)
local parent = expChat.Parent
local emojiListModule = require(parent.EmojiList)
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor
local configModule = require(expChat.Config)
local presetEntryTextModule = require(expChat.Autocomplete.PresetEntryText)
local fFlagExpChatPresetChatAutocompleteEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatAutocompleteEnabled)

return function(p1)
	-- upvalues: useCursor (ref), reactModule (ref), configModule (ref), emojiListModule (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (ref), presetEntryTextModule (ref)
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, configModule.AutocompleteEntryDefaultSizeY),
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = 2,
		[reactModule.Event.MouseEnter] = p1.onAutocompleteDropdownHover
	}, {
		TextLabelButton = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, if p1.isDividerVisible then -1 else 0),
			BackgroundTransparency = p1.setTransparency(if p1.layoutOrder == p1.selectedIndex then configModule.AutocompleteSelectedTransparency else 1, p1.transparencyValue),
			BackgroundColor3 = if p1.layoutOrder == p1.selectedIndex then configModule.AutocompleteSelectedColor else nil,
			SelectionImageObject = useCursor(),
			Text = "",
			ZIndex = 3,
			[reactModule.Event.Activated] = p1.onAutocompleteSelected
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
			EmojiLabel = p1.autocompleteType == "emojis" and reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				LayoutOrder = 1,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = p1.chatInputBarSettings.FontFace,
				Size = UDim2.new(0, 0, 0, 0),
				Text = string.format("%s", emojiListModule[p1.result].base),
				TextColor3 = p1.chatInputBarSettings.TextColor3,
				TextSize = p1.chatInputBarSettings.TextSize,
				TextStrokeColor3 = p1.chatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p1.setTransparency(p1.chatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
				TextTransparency = p1.setTransparency(0, p1.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			SpaceLabel = p1.autocompleteType == "emojis" and reactModule.createElement("TextLabel", {
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
			TextLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				LayoutOrder = 3,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = p1.chatInputBarSettings.FontFace,
				Size = UDim2.new(0, 0, 0, 0),
				Text = if fFlagExpChatPresetChatAutocompleteEnabledModule and p1.autocompleteType == "presets" then presetEntryTextModule.decorate(p1.result, p1.chatInputBarSettings.TextSize) else string.format("%s", p1.result),
				TextColor3 = p1.chatInputBarSettings.TextColor3,
				TextSize = p1.chatInputBarSettings.TextSize,
				TextStrokeColor3 = p1.chatInputBarSettings.TextStrokeColor3,
				TextStrokeTransparency = p1.setTransparency(p1.chatInputBarSettings.TextStrokeTransparency, p1.transparencyValue),
				TextTransparency = p1.setTransparency(0, p1.transparencyValue),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		}),
		Divider = p1.isDividerVisible and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = p1.setTransparency(configModule.ChatInputBarBorderTransparency, p1.transparencyValue),
			BackgroundColor3 = configModule.ChatInputBarBorderColor3
		}) or nil
	})
end