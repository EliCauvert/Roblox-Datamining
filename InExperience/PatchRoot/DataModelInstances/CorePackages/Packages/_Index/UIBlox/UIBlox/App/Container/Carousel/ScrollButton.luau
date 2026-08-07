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

function scrollButton.render(p0) --[[ line: 28 ]]
	-- upvalues: withStyleModule (ref), roactModule (ref), interactableModule (ref), imageSetComponentModule (ref), getIconSizeModule (ref), iconSizeModule (ref)
	return withStyleModule(function(p1) --[[ line: 29 ]]
		-- upvalues: roactModule (copy), interactableModule (copy), p0 (ref), imageSetComponentModule (copy), getIconSizeModule (copy), iconSizeModule (copy)
		return roactModule.createElement(interactableModule, {
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p1.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p1.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			[roactModule.Event.Activated] = p0.props.callback,
			onStateChanged = function() --[[ line: 38 ]] end
		}, {
			Icon = roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(getIconSizeModule(iconSizeModule.Medium), getIconSizeModule(iconSizeModule.Medium)),
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