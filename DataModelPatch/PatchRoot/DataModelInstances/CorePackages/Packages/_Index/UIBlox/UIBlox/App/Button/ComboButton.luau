local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent1.Core
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local ReactModule = require(Parent2.React)
local TModule = require(Parent2.t)
local CryoModule = require(Parent2.Cryo)
local ImagesModule = require(Parent.ImageSet.Images)
local UseCursorModule = require(Parent.SelectionCursor.useCursor)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local GenericButtonModule = require(Core.Button.GenericButton)
local ValidateImageModule = require(Core.ImageSet.Validator.validateImage)
local WithStyleModule = require(Core.Style.withStyle)
local ComboButton = RoactModule.PureComponent:extend("ComboButton")
local _UDim = UDim.new(0, 8)
local ButtonStateColorMap = {
	[ControlStateModule.Default] = "ContextualPrimaryDefault",
	[ControlStateModule.Hover] = "ContextualPrimaryOnHover"
}
local ContentStateColorMap = {
	[ControlStateModule.Default] = "ContextualPrimaryContent"
}
ComboButton.validateProps = TModule.strictInterface({
	button = TModule.strictInterface({
		icon = TModule.optional(ValidateImageModule),
		text = TModule.optional(TModule.string),
		isDisabled = TModule.optional(TModule.boolean),
		onActivated = TModule.callback
	}),
	overflow = TModule.strictInterface({
		icon = TModule.optional(ValidateImageModule),
		isDisabled = TModule.optional(TModule.boolean),
		onActivated = TModule.callback
	}),
	position = TModule.optional(TModule.UDim2),
	size = TModule.optional(TModule.UDim2),
	layoutOrder = TModule.optional(TModule.number),
	cursor = TModule.optional(TModule.table),
	testId = TModule.optional(TModule.string)
})
ComboButton.defaultProps = {
	testId = "--uiblox-combo-button",
	size = UDim2.fromScale(1, 1)
}

function ComboButton.init(p1)
	-- upvalues: ControlStateModule (copy)
	p1:setState({
		buttonControlState = ControlStateModule.Initialize,
		overflowControlState = ControlStateModule.Initialize
	})
	
	function p1:onButtonStateChanged(ButtonControlState)
		-- upvalues: p1 (copy)
		p1:setState({ buttonControlState = ButtonControlState })
	end
	
	function p1:onOverflowStateChanged(OverflowControlState)
		-- upvalues: p1 (copy)
		p1:setState({ overflowControlState = OverflowControlState })
	end
end

function ComboButton.render(p1)
	-- upvalues: WithStyleModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2, nil, nil)
	end)
end

function ComboButton.renderWithProviders(p1, _, _, _)
	-- upvalues: RoactModule (copy), ReactModule (copy), GenericButtonModule (copy), ImagesModule (copy), ButtonStateColorMap (copy), ContentStateColorMap (copy)
	return RoactModule.createElement("Frame", {
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.position,
		Size = p1.props.size,
		BackgroundTransparency = 1,
		[ReactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil
	}, {
		Button = RoactModule.createElement(GenericButtonModule, {
			isHoverBackgroundEnabled = true,
			ZIndex = 0,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.new(1, -40, 1, 0),
			buttonImage = ImagesModule["component_assets/bulletLeft_17"],
			buttonStateColorMap = ButtonStateColorMap,
			contentStateColorMap = ContentStateColorMap,
			hoverImage = ImagesModule["component_assets/bulletLeft_17"],
			icon = p1.props.button.icon,
			isDisabled = p1.props.button.isDisabled,
			onActivated = p1.props.button.onActivated,
			onStateChanged = p1.onButtonStateChanged,
			SelectionImageObject = p1.props.cursor,
			text = p1.props.button.text
		}),
		Overflow = RoactModule.createElement(GenericButtonModule, {
			ZIndex = 0,
			isHoverBackgroundEnabled = true,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.new(0, 39, 1, 0),
			buttonImage = ImagesModule["component_assets/bulletRight_17"],
			buttonStateColorMap = ButtonStateColorMap,
			contentStateColorMap = ContentStateColorMap,
			hoverImage = ImagesModule["component_assets/bulletRight_17"],
			icon = p1.props.overflow.icon or ImagesModule["icons/actions/truncationExpand"],
			isDisabled = p1.props.overflow.isDisabled,
			onActivated = p1.props.overflow.onActivated,
			onStateChanged = p1.onOverflowStateChanged,
			SelectionImageObject = p1.props.cursor
		})
	})
end

function ComboButtonFunctionalWrapper(p1)
	-- upvalues: UseCursorModule (copy), _UDim (copy), RoactModule (copy), ComboButton (copy), CryoModule (copy)
	return RoactModule.createElement(ComboButton, CryoModule.Dictionary.join(p1, { cursor = UseCursorModule(_UDim) }))
end

local ComboButtonOuterWrapper = RoactModule.PureComponent:extend("ComboButtonOuterWrapper")
ComboButtonOuterWrapper.validateProps = ComboButton.validateProps

function ComboButtonOuterWrapper.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement(ComboButtonFunctionalWrapper, p1.props)
end

return ComboButtonOuterWrapper