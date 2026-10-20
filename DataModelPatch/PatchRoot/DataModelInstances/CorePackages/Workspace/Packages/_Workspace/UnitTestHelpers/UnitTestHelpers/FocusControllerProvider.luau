local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local RoactGamepadModule = require(Parent.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local TModule = require(Parent.t)
local FocusControllerProvider = RoactModule.Component:extend("FocusControllerProvider")
FocusControllerProvider.validateProps = TModule.strictInterface({
	captureFocusOnMount = TModule.boolean,
	[RoactModule.Children] = TModule.table,
	focusController = TModule.optional(TModule.table)
})

function FocusControllerProvider.init(p1)
	-- upvalues: RoactGamepadModule (copy)
	p1.focusController = p1.props.focusController or RoactGamepadModule.createFocusController()
end

function FocusControllerProvider.render(p1)
	-- upvalues: RoactModule (copy), Focusable (copy)
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		focusController = p1.focusController,
		Size = UDim2.fromScale(1, 1)
	}, p1.props[RoactModule.Children])
end

function FocusControllerProvider.didMount(p1)
	if p1.props.captureFocusOnMount then
		p1.focusController.captureFocus()
	end
end

return FocusControllerProvider