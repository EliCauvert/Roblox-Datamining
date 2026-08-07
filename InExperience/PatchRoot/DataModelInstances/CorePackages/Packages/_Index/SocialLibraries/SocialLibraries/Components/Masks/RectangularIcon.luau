local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local maskedIcon = roact.PureComponent:extend("MaskedIcon")
maskedIcon.defaultProps = {
	icon = "rbxasset://textures/ui/LuaChat/icons/share-game-thumbnail.png"
}

function maskedIcon.render(p0) --[[ line: 13 ]]
	-- upvalues: roact (ref)
	return roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		layout = roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		button = roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = p0.props.icon,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			layout = roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			mask = roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaChat/graphic/gr-mask-game-icon-48x48.png",
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	})
end

return maskedIcon