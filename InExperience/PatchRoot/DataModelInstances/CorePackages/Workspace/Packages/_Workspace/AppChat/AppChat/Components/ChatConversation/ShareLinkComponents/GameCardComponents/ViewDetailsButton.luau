local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local buttonModule = require(script.Parent.Button)
local viewDetailsButton = roactModule.PureComponent:extend("ViewDetailsButton")
viewDetailsButton.defaultProps = {
	text = nil,
	LayoutOrder = nil,
	onActivated = function()
		print("View details button pressed!")
	end
}

function viewDetailsButton.render(p1)
	-- upvalues: UIBloxModule (ref), roactModule (ref), buttonModule (ref)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: roactModule (copy), buttonModule (copy), p1 (ref)
		return roactModule.createElement(buttonModule, {
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

return viewDetailsButton