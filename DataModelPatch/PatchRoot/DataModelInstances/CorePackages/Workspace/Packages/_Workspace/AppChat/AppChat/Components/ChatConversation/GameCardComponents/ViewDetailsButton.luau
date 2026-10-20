local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local ButtonModule = require(script.Parent.Button)
local ViewDetailsButton = RoactModule.PureComponent:extend("ViewDetailsButton")
ViewDetailsButton.defaultProps = {
	text = nil,
	LayoutOrder = nil,
	onActivated = function()
		print("View details button pressed!")
	end
}

function ViewDetailsButton.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), ButtonModule (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: RoactModule (upval), ButtonModule (upval), p1 (copy)
		return RoactModule.createElement(ButtonModule, {
			text = p1.props.text,
			textColor = p2.Theme.SystemPrimaryContent.Color,
			textSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize,
			font = p2.Font.Body.Font,
			transparency = p2.Theme.SystemPrimaryDefault.Transparency,
			color = p2.Theme.SystemPrimaryDefault.Color,
			LayoutOrder = p1.props.LayoutOrder or 0,
			onActivated = p1.props.onActivated
		})
	end)
end

return ViewDetailsButton