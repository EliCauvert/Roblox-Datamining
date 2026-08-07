local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local checkIconModule = require(script.Parent.CheckIcon)
local alertViewCheckbox = roact.Component:extend("AlertViewCheckbox")
alertViewCheckbox.defaultProps = {
	Text = "",
	LayoutOrder = 0,
	checked = false,
	onActivated = function() --[[ line: 12 ]] end
}

function alertViewCheckbox.render(p0) --[[ line: 16 ]]
	-- upvalues: UIBlox (ref), roact (ref), checkIconModule (ref)
	return UIBlox.Style.withStyle(function(p1) --[[ line: 17 ]]
		-- upvalues: roact (copy), p0 (ref), checkIconModule (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p0.props.LayoutOrder,
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
				checked = p0.props.checked,
				onActivated = p0.props.onActivated
			}),
			Label = roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(0.7, 0, 1, 0),
				Text = p0.props.Text,
				TextColor3 = p0.props.TextColor3 or p1.Theme.TextDefault.Color,
				TextSize = p0.props.TextSize or p1.Font.Body.RelativeSize * p1.Font.BaseSize,
				Font = p0.props.Font or p1.Font.CaptionSubHeader.Font,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	end)
end

return alertViewCheckbox