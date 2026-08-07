local parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle

return function(p0) --[[ line: 13 | named "ReportTextEntry" ]]
	-- upvalues: useStyle (ref), reactModule (ref)
	local var1 = useStyle()
	local theme = var1.Theme
	
	return reactModule.createElement("Frame", {
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 60),
		BackgroundTransparency = var1.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = var1.Theme.BackgroundDefault.Color
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		ReportCommentTextBox = reactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 0, 40),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = theme.BackgroundDefault.Color,
			PlaceholderText = p0.placeholderText,
			Font = var1.Font.Body.Font,
			Text = p0.text,
			TextSize = var1.Font.BaseSize,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			BackgroundTransparency = theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			RichText = false,
			MultiLine = true,
			TextWrapped = true,
			ClearTextOnFocus = false,
			OverlayNativeInput = true,
			ClipsDescendants = true,
			[reactModule.Change.Text] = function(p1) --[[ line: 56 ]]
				-- upvalues: p0 (ref)
				if p0.text ~= p1.Text then
					p0.onUpdate(p1.Text)
				end
			end
		})
	})
end