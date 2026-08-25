local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local colors = require(parent.Style).Colors
local detailListModule = require(script.Parent.DetailList)
local white = colors.White
local flint = colors.Flint
local arialBold = Enum.Font.ArialBold

return function(p0)
	-- upvalues: reactModule (ref), roactModule (ref), flint (ref), white (ref), arialBold (ref), colors (ref), detailListModule (ref)
	return {
		ReactionDetail = roactModule.createElement("Frame", {
			Size = UDim2.new(0, 300, 0, 375),
			BackgroundColor3 = flint
		}, {
			corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.05, 0) }),
			layout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
		}, {
			header = roactModule.createElement("TextLabel", {
				Text = "Reactions",
				TextSize = 20,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				TextColor3 = white,
				Font = arialBold,
				Size = UDim2.new(1, 0, 0, 40)
			}),
			bar = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.fromScale(1, 0)
			}, {
				roactModule.createElement("Frame", {
					Size = UDim2.new(0.97, 0, 0, 0),
					BackgroundColor3 = colors.White,
					BorderColor3 = colors.White,
					Position = UDim2.new(0.015, 0, 0, 0)
				})
			}),
			padding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 10)
			}),
			detailList = roactModule.createElement(detailListModule, {
				LayoutOrder = 4,
				emoji = reactModule.useState("All"),
				reactionData = p0.reactionData
			})
		})
	}
end