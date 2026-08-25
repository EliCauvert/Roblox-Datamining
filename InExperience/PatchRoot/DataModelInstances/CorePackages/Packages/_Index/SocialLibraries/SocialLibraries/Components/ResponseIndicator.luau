local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local foundation = dependenciesModule.Foundation
local iconSize = foundation.Enums.IconSize

return function()
	-- upvalues: UIBlox (ref), roact (ref), foundation (ref), iconSize (ref)
	return UIBlox.Style.withStyle(function(p0)
		-- upvalues: roact (copy), foundation (copy), iconSize (copy)
		return roact.createElement("ImageButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BackgroundColor3 = p0.Theme.TextEmphasis.Color,
			Size = UDim2.fromScale(1, 1)
		}, {
			visibleFrame = roact.createElement("Frame", {
				ZIndex = 10,
				BackgroundTransparency = p0.Theme.BackgroundUIContrast.Transparency,
				BackgroundColor3 = p0.Theme.BackgroundUIContrast.Color,
				Size = UDim2.fromOffset(120, 120),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				corner = roact.createElement("UICorner"),
				spinner = roact.createElement(foundation.Loading, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = iconSize.Large
				})
			})
		})
	end)
end