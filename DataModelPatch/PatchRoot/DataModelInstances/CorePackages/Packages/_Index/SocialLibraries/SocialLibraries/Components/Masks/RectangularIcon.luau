local Roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local MaskedIcon = Roact.PureComponent:extend("MaskedIcon")
MaskedIcon.defaultProps = {
	icon = "rbxasset://textures/ui/LuaChat/icons/share-game-thumbnail.png"
}

function MaskedIcon.render(p1)
	-- upvalues: Roact (copy)
	return Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		layout = Roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		button = Roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = p1.props.icon,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			layout = Roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			mask = Roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaChat/graphic/gr-mask-game-icon-48x48.png",
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	})
end

return MaskedIcon