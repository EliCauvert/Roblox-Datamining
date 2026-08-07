local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local text = require(parent.AppCommonLib).Text
local systemButton = roactModule.PureComponent:extend("SystemButton")
systemButton.defaultProps = { text = "Text", enabled = false, onActivated = nil }

function systemButton.render(p0) --[[ line: 17 ]]
	-- upvalues: UIBloxModule (ref), text (ref), roactModule (ref)
	return UIBloxModule.Style.withStyle(function(p1) --[[ line: 18 ]]
		-- upvalues: p0 (ref), text (copy), roactModule (copy)
		local text_1 = p0.props.text
		local font = p1.Font.Header1.Font
		local textWidth = text.GetTextWidth(text_1, font, 24)
		
		return roactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Text = "",
			Size = UDim2.new(0, textWidth + 8, 1, 0),
			[roactModule.Event.Activated] = p0.props.onActivated
		}, {
			layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			label = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 24,
				Size = UDim2.new(0, textWidth, 0, 24),
				Text = text_1,
				Font = font,
				TextColor3 = p1.Theme.SystemPrimaryDefault.Color,
				TextTransparency = if p0.props.enabled then 0 else 0.7
			})
		})
	end)
end

return systemButton