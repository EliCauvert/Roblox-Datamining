local Parent = script:FindFirstAncestor("PhoneUpsell").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Colors = UIBloxModule.App.Style.Colors

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), Colors (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 0.3,
		BackgroundColor3 = Colors.Black,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		MiddleContent = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 24)
			}),
			Image = p1.image,
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseStyleResult.Tokens.Size.Size_600),
				PaddingRight = UDim.new(0, UseStyleResult.Tokens.Size.Size_600)
			}),
			VerifyingText = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header1.RelativeSize,
				TextColor3 = Colors.White,
				Text = p1.text,
				Font = UseStyleResult.Font.Header1.Font
			})
		})
	})
end