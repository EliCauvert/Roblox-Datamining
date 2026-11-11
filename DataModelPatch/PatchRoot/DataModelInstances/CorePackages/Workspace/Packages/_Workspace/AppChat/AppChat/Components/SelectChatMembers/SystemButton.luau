local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local Text = require(Parent.AppCommonLib).Text
local SystemButton = RoactModule.PureComponent:extend("SystemButton")
SystemButton.defaultProps = { text = "Text", enabled = false, onActivated = nil }

function SystemButton.render(p1)
	-- upvalues: UIBloxModule (copy), Text (copy), RoactModule (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: p1 (copy), Text (upval), RoactModule (upval)
		local Text1 = p1.props.text
		local HeaderFont = p2.Font.Header1.Font
		local TextWidth: number = Text.GetTextWidth(Text1, HeaderFont, 24)
		
		return RoactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Text = "",
			Size = UDim2.new(0, TextWidth + 8, 1, 0),
			[RoactModule.Event.Activated] = p1.props.onActivated
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			label = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 24,
				Size = UDim2.new(0, TextWidth, 0, 24),
				Text = Text1,
				Font = HeaderFont,
				TextColor3 = p2.Theme.SystemPrimaryDefault.Color,
				TextTransparency = if p1.props.enabled then 0 else 0.7
			})
		})
	end)
end

return SystemButton