local parent = script.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local reactModule = require(parent_2.React)
local tModule = require(parent_2.t)
local cryoModule = require(parent_2.Cryo)
local imagesModule = require(parent.ImageSet.Images)
local useCursorModule = require(parent.SelectionCursor.useCursor)
local controlStateModule = require(core.Control.Enum.ControlState)
local genericButtonModule = require(core.Button.GenericButton)
local validateImageModule = require(core.ImageSet.Validator.validateImage)
local withStyleModule = require(core.Style.withStyle)
local comboButton = roactModule.PureComponent:extend("ComboButton")
local uDim = UDim.new(0, 8)
local t = {
	[controlStateModule.Default] = "ContextualPrimaryDefault",
	[controlStateModule.Hover] = "ContextualPrimaryOnHover"
}
local t_1 = {
	[controlStateModule.Default] = "ContextualPrimaryContent"
}
comboButton.validateProps = tModule.strictInterface({
	button = tModule.strictInterface({
		icon = tModule.optional(validateImageModule),
		text = tModule.optional(tModule.string),
		isDisabled = tModule.optional(tModule.boolean),
		onActivated = tModule.callback
	}),
	overflow = tModule.strictInterface({
		icon = tModule.optional(validateImageModule),
		isDisabled = tModule.optional(tModule.boolean),
		onActivated = tModule.callback
	}),
	position = tModule.optional(tModule.UDim2),
	size = tModule.optional(tModule.UDim2),
	layoutOrder = tModule.optional(tModule.number),
	cursor = tModule.optional(tModule.table),
	testId = tModule.optional(tModule.string)
})
comboButton.defaultProps = {
	testId = "--uiblox-combo-button",
	size = UDim2.fromScale(1, 1)
}

function comboButton.init(p1)
	-- upvalues: controlStateModule (ref)
	p1:setState({
		buttonControlState = controlStateModule.Initialize,
		overflowControlState = controlStateModule.Initialize
	})
	
	function p0.onButtonStateChanged(_, p2)
		-- upvalues: p1 (ref)
		p1:setState({ buttonControlState = p2 })
	end
	
	function p0.onOverflowStateChanged(_, p2)
		-- upvalues: p1 (ref)
		p1:setState({ overflowControlState = p2 })
	end
end

function comboButton.render(p1)
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithProviders(p2, nil, nil)
	end)
end

function comboButton.renderWithProviders(p1, _, _, _)
	-- upvalues: roactModule (ref), reactModule (ref), genericButtonModule (ref), imagesModule (ref), t (ref), t_1 (ref)
	return roactModule.createElement("Frame", {
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.position,
		Size = p1.props.size,
		BackgroundTransparency = 1,
		[reactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil
	}, {
		Button = roactModule.createElement(genericButtonModule, {
			isHoverBackgroundEnabled = true,
			ZIndex = 0,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.new(1, -40, 1, 0),
			buttonImage = imagesModule["component_assets/bulletLeft_17"],
			buttonStateColorMap = t,
			contentStateColorMap = t_1,
			hoverImage = imagesModule["component_assets/bulletLeft_17"],
			icon = p1.props.button.icon,
			isDisabled = p1.props.button.isDisabled,
			onActivated = p1.props.button.onActivated,
			onStateChanged = p1.onButtonStateChanged,
			SelectionImageObject = p1.props.cursor,
			text = p1.props.button.text
		}),
		Overflow = roactModule.createElement(genericButtonModule, {
			ZIndex = 0,
			isHoverBackgroundEnabled = true,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.new(0, 39, 1, 0),
			buttonImage = imagesModule["component_assets/bulletRight_17"],
			buttonStateColorMap = t,
			contentStateColorMap = t_1,
			hoverImage = imagesModule["component_assets/bulletRight_17"],
			icon = p1.props.overflow.icon or imagesModule["icons/actions/truncationExpand"],
			isDisabled = p1.props.overflow.isDisabled,
			onActivated = p1.props.overflow.onActivated,
			onStateChanged = p1.onOverflowStateChanged,
			SelectionImageObject = p1.props.cursor
		})
	})
end

function ComboButtonFunctionalWrapper(p1)
	-- upvalues: useCursorModule (ref), uDim (ref), roactModule (ref), comboButton (ref), cryoModule (ref)
	return roactModule.createElement(comboButton, cryoModule.Dictionary.join(p1, { cursor = useCursorModule(uDim) }))
end

local comboButtonOuterWrapper = roactModule.PureComponent:extend("ComboButtonOuterWrapper")
comboButtonOuterWrapper.validateProps = comboButton.validateProps

function comboButtonOuterWrapper.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.createElement(ComboButtonFunctionalWrapper, p1.props)
end

return comboButtonOuterWrapper