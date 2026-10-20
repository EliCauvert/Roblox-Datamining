local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local _UDim = UDim.new(0, 3)
local config = {
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
	-- upvalues: config (copy), RoactModule (copy), ConstantsModule (copy), _UDim (copy)
	local Entry = config[p1.tag]
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = p1.layoutOrder
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 6)
		}),
		Timestamp = RoactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Text = p1.timestampText,
			Size = UDim2.new(0, 66, 1, 0),
			Font = ConstantsModule.Font.MainWindow,
			TextSize = ConstantsModule.DefaultFontSize.MainWindow + -2,
			TextColor3 = ConstantsModule.Color.BorderGray,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Tag = RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 30, 0, 16),
			BackgroundColor3 = Entry.background
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = _UDim }),
			Label = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = p1.tag,
				Size = UDim2.new(1, 0, 1, 0),
				Font = ConstantsModule.Font.MainWindow,
				TextSize = ConstantsModule.DefaultFontSize.MainWindow + -3,
				TextColor3 = Entry.text,
				TextXAlignment = Enum.TextXAlignment.Center
			})
		}),
		Name = RoactModule.createElement("TextLabel", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Text = p1.name,
			Size = UDim2.new(1, -108, 1, 0),
			Font = ConstantsModule.Font.MainWindow,
			TextSize = ConstantsModule.DefaultFontSize.MainWindow,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end