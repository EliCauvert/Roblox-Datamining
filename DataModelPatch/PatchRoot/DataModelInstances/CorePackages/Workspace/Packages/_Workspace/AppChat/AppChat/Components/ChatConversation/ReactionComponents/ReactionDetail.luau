local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local Colors = require(Parent.Style).Colors
local DetailListModule = require(script.Parent.DetailList)
local White = Colors.White
local Flint = Colors.Flint
local ArialBold = Enum.Font.ArialBold

return function(p1)
	-- upvalues: ReactModule (copy), RoactModule (copy), Flint (copy), White (copy), ArialBold (copy), Colors (copy), DetailListModule (copy)
	return {
		ReactionDetail = RoactModule.createElement("Frame", {
			Size = UDim2.new(0, 300, 0, 375),
			BackgroundColor3 = Flint
		}, {
			corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.05, 0) }),
			layout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
		}, {
			header = RoactModule.createElement("TextLabel", {
				Text = "Reactions",
				TextSize = 20,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				TextColor3 = White,
				Font = ArialBold,
				Size = UDim2.new(1, 0, 0, 40)
			}),
			bar = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.fromScale(1, 0)
			}, {
				RoactModule.createElement("Frame", {
					Size = UDim2.new(0.97, 0, 0, 0),
					BackgroundColor3 = Colors.White,
					BorderColor3 = Colors.White,
					Position = UDim2.new(0.015, 0, 0, 0)
				})
			}),
			padding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 10)
			}),
			detailList = RoactModule.createElement(DetailListModule, {
				LayoutOrder = 4,
				emoji = ReactModule.useState("All"),
				reactionData = p1.reactionData
			})
		})
	}
end