local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref)
	local var1 = useStyle()
	local theme = var1.Theme
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 40 + var1.Tokens.Size.Size_600 + 20),
		BackgroundTransparency = var1.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = var1.Theme.BackgroundUIDefault.Color,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		AbuseReportsText = reactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 0, 40 + var1.Tokens.Size.Size_600),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = theme.BackgroundUIDefault.Color,
			PlaceholderText = p1.placeholderText,
			Font = var1.Font.Body.Font,
			Text = p1.text,
			TextSize = var1.Tokens.FontSize.FontSize_400,
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
			[reactModule.Event.FocusLost] = function() end,
			[reactModule.Event.Focused] = function() end,
			[reactModule.Change.AbsoluteSize] = function() end,
			[reactModule.Change.Text] = function(p2)
				-- upvalues: p1 (ref)
				if p1.text ~= p2.Text then
					p1.onUpdate(p2.Text)
				end
			end
		})
	})
end