local parent = script:FindFirstAncestor("AppBlox").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local tModule = require(parent.t)
local withStyle = UIBloxModule.Core.Style.withStyle
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local interactable = UIBloxModule.Core.Control.Interactable
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local scrollButton = roactModule.PureComponent:extend("ScrollButton")
scrollButton.validateProps = tModule.strictInterface({ icon = tModule.table, callback = tModule.callback })

function scrollButton.render(p0) --[[ line: 24 ]]
	-- upvalues: withStyle (ref), roactModule (ref), interactable (ref), imageSetLabel (ref), getIconSize (ref), iconSize (ref)
	return withStyle(function(p1) --[[ line: 25 ]]
		-- upvalues: roactModule (copy), interactable (copy), p0 (ref), imageSetLabel (copy), getIconSize (copy), iconSize (copy)
		return roactModule.createElement(interactable, {
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p1.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p1.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			[roactModule.Event.Activated] = p0.props.callback,
			onStateChanged = function() --[[ line: 34 ]] end
		}, {
			Icon = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(getIconSize(iconSize.Medium), getIconSize(iconSize.Medium)),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = p0.props.icon,
				ImageColor3 = p1.Theme.IconEmphasis.Color,
				ImageTransparency = p1.Theme.IconEmphasis.Transparency
			})
		})
	end)
end

return scrollButton