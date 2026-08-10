local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local buttonModule = require(script.Parent.Button)
local viewDetailsButton = roactModule.PureComponent:extend("ViewDetailsButton")
viewDetailsButton.defaultProps = {
	text = nil,
	LayoutOrder = nil,
	onActivated = function() --[[ line: 14 ]]
		print("View details button pressed!")
	end
}

function viewDetailsButton.render(p0) --[[ line: 19 ]]
	-- upvalues: UIBloxModule (ref), roactModule (ref), buttonModule (ref)
	return UIBloxModule.Style.withStyle(function(p1) --[[ line: 20 ]]
		-- upvalues: roactModule (copy), buttonModule (copy), p0 (ref)
		return roactModule.createElement(buttonModule, {
			text = p0.props.text,
			textColor = p1.Theme.SystemPrimaryContent.Color,
			textSize = p1.Font.Body.RelativeSize * p1.Font.BaseSize,
			font = p1.Font.Body.Font,
			transparency = p1.Theme.SystemPrimaryDefault.Transparency,
			color = p1.Theme.SystemPrimaryDefault.Color,
			LayoutOrder = p0.props.LayoutOrder or 0,
			onActivated = p0.props.onActivated
		})
	end)
end

return viewDetailsButton