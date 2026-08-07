local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local button = roactModule.PureComponent:extend("Button")
button.defaultProps = {
	transparency = 0,
	textSize = 12,
	text = "",
	LayoutOrder = 0,
	color = Color3.new(0.9, 0.9, 0.9),
	textColor = Color3.new(0.1, 0.1, 0.1),
	font = Enum.Font.Gotham,
	onActivated = function() --[[ line: 17 ]]
		print("Game card button activated!")
	end
}

function button.render(p0) --[[ line: 22 ]]
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 32),
		LayoutOrder = p0.props.LayoutOrder or 0
	}, {
		layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		actionButton = roactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png",
			ImageColor3 = p0.props.color,
			ImageTransparency = p0.props.transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(3, 3, 4, 4),
			[roactModule.Event.Activated] = p0.props.onActivated
		}, {
			layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			actionLabel = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.8, 0, 0.8, 0),
				TextSize = p0.props.textSize,
				TextColor3 = p0.props.textColor,
				Font = p0.props.font,
				Text = p0.props.text or ""
			})
		})
	})
end

return button