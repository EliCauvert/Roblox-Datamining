local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 40 + UseStyleResult.Tokens.Size.Size_600 + 20),
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		AbuseReportsText = ReactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 0, 40 + UseStyleResult.Tokens.Size.Size_600),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color,
			PlaceholderText = p1.placeholderText,
			Font = UseStyleResult.Font.Body.Font,
			Text = p1.text,
			TextSize = UseStyleResult.Tokens.FontSize.FontSize_400,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			RichText = false,
			MultiLine = true,
			TextWrapped = true,
			ClearTextOnFocus = false,
			OverlayNativeInput = true,
			[ReactModule.Event.FocusLost] = function() end,
			[ReactModule.Event.Focused] = function() end,
			[ReactModule.Change.AbsoluteSize] = function() end,
			[ReactModule.Change.Text] = function(p2)
				-- upvalues: p1 (copy)
				if p1.text ~= p2.Text then
					p1.onUpdate(p2.Text)
				end
			end
		})
	})
end