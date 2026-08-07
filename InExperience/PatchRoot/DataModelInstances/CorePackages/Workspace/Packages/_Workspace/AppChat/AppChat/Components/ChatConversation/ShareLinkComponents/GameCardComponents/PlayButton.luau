local parent = script:FindFirstAncestor("AppChat").Parent
local UIBloxModule = require(parent.UIBlox)
local roactModule = require(parent.Roact)
local buttonModule = require(script.Parent.Button)
local playButton = roactModule.PureComponent:extend("PlayButton")
playButton.defaultProps = {
	text = "Play!",
	LayoutOrder = 0,
	onActivated = function() --[[ line: 15 ]]
		print("Play button activated!")
	end
}

function playButton.render(p0) --[[ line: 20 ]]
	-- upvalues: UIBloxModule (ref), roactModule (ref), buttonModule (ref)
	return UIBloxModule.Style.withStyle(function(p1) --[[ line: 21 ]]
		-- upvalues: roactModule (copy), buttonModule (copy), p0 (ref)
		return roactModule.createElement(buttonModule, {
			textSize = 23,
			text = p0.props.text,
			textColor = Color3.fromRGB(255, 255, 255),
			font = p1.Font.Body.Font,
			transparency = p1.Theme.ContextualPrimaryDefault.Transparency,
			color = p1.Theme.ContextualPrimaryDefault.Color,
			LayoutOrder = p0.props.LayoutOrder or 0,
			onActivated = p0.props.onActivated
		})
	end)
end

return playButton