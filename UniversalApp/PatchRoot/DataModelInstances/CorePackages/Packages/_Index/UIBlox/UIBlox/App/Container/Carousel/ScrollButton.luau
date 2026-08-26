local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local core = parent_1.Core
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local interactableModule = require(core.Control.Interactable)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local scrollButton = roactModule.PureComponent:extend("ScrollButton")
scrollButton.validateProps = tModule.strictInterface({ icon = tModule.table, callback = tModule.callback })

function scrollButton.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), interactableModule (ref), imageSetComponentModule (ref), getIconSizeModule (ref), iconSizeModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), interactableModule (copy), p1 (ref), imageSetComponentModule (copy), getIconSizeModule (copy), iconSizeModule (copy)
		return roactModule.createElement(interactableModule, {
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p2.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			[roactModule.Event.Activated] = p1.props.callback,
			onStateChanged = function() end
		}, {
			Icon = roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(getIconSizeModule(iconSizeModule.Medium), getIconSizeModule(iconSizeModule.Medium)),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = p1.props.icon,
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p2.Theme.IconEmphasis.Transparency
			})
		})
	end)
end

return scrollButton