local Parent = script:FindFirstAncestor("AppBlox").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local TModule = require(Parent.t)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Interactable = UIBloxModule.Core.Control.Interactable
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ScrollButton = RoactModule.PureComponent:extend("ScrollButton")
ScrollButton.validateProps = TModule.strictInterface({ icon = TModule.table, callback = TModule.callback })

function ScrollButton.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Interactable (copy), ImageSetLabel (copy), GetIconSizeFunction (copy), IconSize (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), Interactable (upval), p1 (copy), ImageSetLabel (upval), GetIconSizeFunction (upval), IconSize (upval)
		return RoactModule.createElement(Interactable, {
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p2.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			[RoactModule.Event.Activated] = p1.props.callback,
			onStateChanged = function() end
		}, {
			Icon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium)),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = p1.props.icon,
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p2.Theme.IconEmphasis.Transparency
			})
		})
	end)
end

return ScrollButton