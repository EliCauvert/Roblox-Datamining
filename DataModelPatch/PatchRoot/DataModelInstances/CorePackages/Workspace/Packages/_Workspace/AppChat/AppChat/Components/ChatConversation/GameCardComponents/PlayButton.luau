local Parent = script:FindFirstAncestor("AppChat").Parent
local UIBloxModule = require(Parent.UIBlox)
local RoactModule = require(Parent.Roact)
local ButtonModule = require(script.Parent.Button)
local PlayButton = RoactModule.PureComponent:extend("PlayButton")
PlayButton.defaultProps = {
	text = "Play!",
	LayoutOrder = 0,
	onActivated = function()
		print("Play button activated!")
	end
}

function PlayButton.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), ButtonModule (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: RoactModule (upval), ButtonModule (upval), p1 (copy)
		return RoactModule.createElement(ButtonModule, {
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

return PlayButton