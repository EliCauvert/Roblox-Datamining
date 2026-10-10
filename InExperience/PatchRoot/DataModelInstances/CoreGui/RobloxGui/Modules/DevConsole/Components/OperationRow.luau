local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local uDim = UDim.new(0, 3)
local t = {
	snt = {
		background = Color3.fromRGB(16, 32, 16),
		text = Color3.fromRGB(120, 220, 110)
	},
	srv = {
		background = Color3.fromRGB(16, 30, 42),
		text = Color3.fromRGB(110, 185, 240)
	},
	op = {
		background = Color3.fromRGB(28, 22, 44),
		text = Color3.fromRGB(180, 150, 240)
	}
}

return function(p1)
	-- upvalues: t (ref), roactModule (ref), constantsModule (ref), uDim (ref)
	local tag = t[p1.tag]
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = p1.layoutOrder
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 6)
		}),
		Timestamp = roactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Text = p1.timestampText,
			Size = UDim2.new(0, 66, 1, 0),
			Font = constantsModule.Font.MainWindow,
			TextSize = constantsModule.DefaultFontSize.MainWindow + -2,
			TextColor3 = constantsModule.Color.BorderGray,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Tag = roactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 30, 0, 16),
			BackgroundColor3 = tag.background
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = uDim }),
			Label = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = p1.tag,
				Size = UDim2.new(1, 0, 1, 0),
				Font = constantsModule.Font.MainWindow,
				TextSize = constantsModule.DefaultFontSize.MainWindow + -3,
				TextColor3 = tag.text,
				TextXAlignment = Enum.TextXAlignment.Center
			})
		}),
		Name = roactModule.createElement("TextLabel", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Text = p1.name,
			Size = UDim2.new(1, -108, 1, 0),
			Font = constantsModule.Font.MainWindow,
			TextSize = constantsModule.DefaultFontSize.MainWindow,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end