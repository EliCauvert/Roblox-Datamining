local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local checkIconModule = require(script.Parent.CheckIcon)
local alertViewCheckbox = roact.Component:extend("AlertViewCheckbox")
alertViewCheckbox.defaultProps = {
	Text = "",
	LayoutOrder = 0,
	checked = false,
	onActivated = function() end
}

function alertViewCheckbox.render(p1)
	-- upvalues: UIBlox (ref), roact (ref), checkIconModule (ref)
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: roact (copy), p1 (ref), checkIconModule (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 35)
		}, {
			List = roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10)
			}),
			Checkbox = roact.createElement(checkIconModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				checked = p1.props.checked,
				onActivated = p1.props.onActivated
			}),
			Label = roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(0.7, 0, 1, 0),
				Text = p1.props.Text,
				TextColor3 = p1.props.TextColor3 or p2.Theme.TextDefault.Color,
				TextSize = p1.props.TextSize or p2.Font.Body.RelativeSize * p2.Font.BaseSize,
				Font = p1.props.Font or p2.Font.CaptionSubHeader.Font,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	end)
end

return alertViewCheckbox