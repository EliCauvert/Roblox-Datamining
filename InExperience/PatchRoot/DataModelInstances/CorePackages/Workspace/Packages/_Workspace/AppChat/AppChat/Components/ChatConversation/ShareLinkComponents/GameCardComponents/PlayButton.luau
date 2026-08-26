local parent = script:FindFirstAncestor("AppChat").Parent
local UIBloxModule = require(parent.UIBlox)
local roactModule = require(parent.Roact)
local buttonModule = require(script.Parent.Button)
local playButton = roactModule.PureComponent:extend("PlayButton")
playButton.defaultProps = {
	text = "Play!",
	LayoutOrder = 0,
	onActivated = function()
		print("Play button activated!")
	end
}

function playButton.render(p1)
	-- upvalues: UIBloxModule (ref), roactModule (ref), buttonModule (ref)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: roactModule (copy), buttonModule (copy), p1 (ref)
		return roactModule.createElement(buttonModule, {
			textSize = 23,
			text = p1.props.text,
			textColor = Color3.fromRGB(255, 255, 255),
			font = p2.Font.Body.Font,
			transparency = p2.Theme.ContextualPrimaryDefault.Transparency,
			color = p2.Theme.ContextualPrimaryDefault.Color,
			LayoutOrder = p1.props.LayoutOrder or 0,
			onActivated = p1.props.onActivated
		})
	end)
end

return playButton