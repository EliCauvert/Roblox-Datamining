local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local Core = Parent1.Core
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local InteractableModule = require(Core.Control.Interactable)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local ScrollButton = RoactModule.PureComponent:extend("ScrollButton")
ScrollButton.validateProps = TModule.strictInterface({ icon = TModule.table, callback = TModule.callback })

function ScrollButton.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), InteractableModule (copy), ImageSetComponentModule (copy), GetIconSizeModule (copy), IconSizeModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), InteractableModule (upval), p1 (copy), ImageSetComponentModule (upval), GetIconSizeModule (upval), IconSizeModule (upval)
		return RoactModule.createElement(InteractableModule, {
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p2.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			[RoactModule.Event.Activated] = p1.props.callback,
			onStateChanged = function() end
		}, {
			Icon = RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Medium), GetIconSizeModule(IconSizeModule.Medium)),
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