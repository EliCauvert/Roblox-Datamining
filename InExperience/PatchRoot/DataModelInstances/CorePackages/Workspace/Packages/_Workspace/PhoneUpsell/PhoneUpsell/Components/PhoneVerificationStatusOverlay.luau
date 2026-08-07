local parent = script:FindFirstAncestor("PhoneUpsell").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local colors = UIBloxModule.App.Style.Colors

return function(p0) --[[ line: 17 | named "PhoneVerificationStatusOverlay" ]]
	-- upvalues: useStyle (ref), reactModule (ref), colors (ref)
	local var2 = useStyle()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 0.3,
		BackgroundColor3 = colors.Black,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		MiddleContent = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 24)
			}),
			Image = p0.image,
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var2.Tokens.Size.Size_600),
				PaddingRight = UDim.new(0, var2.Tokens.Size.Size_600)
			}),
			VerifyingText = reactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = var2.Font.BaseSize * var2.Font.Header1.RelativeSize,
				TextColor3 = colors.White,
				Text = p0.text,
				Font = var2.Font.Header1.Font
			})
		})
	})
end