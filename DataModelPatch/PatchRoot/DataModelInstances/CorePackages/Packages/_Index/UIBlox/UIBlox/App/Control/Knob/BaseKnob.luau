local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local RoactGamepadModule = require(Parent2.RoactGamepad)
local ImagesModule = require(Parent.ImageSet.Images)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local InteractableModule = require(Parent1.Core.Control.Interactable)
local ControlStateModule = require(Parent1.Core.Control.Enum.ControlState)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local ValidateColorInfoModule = require(Parent1.Core.Style.Validator.validateColorInfo)
local BaseKnob = RoactModule.Component:extend("BaseKnob")
local config = {
	[ControlStateModule.Default] = { Transparency = 0.7, Color = Color3.fromRGB(0, 0, 0) },
	[ControlStateModule.Hover] = { Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0) }
}
local config1 = {
	[ControlStateModule.Default] = UDim2.fromOffset(48, 48),
	[ControlStateModule.Hover] = UDim2.fromOffset(48, 48),
	[ControlStateModule.Pressed] = UDim2.fromOffset(0, 0),
	[ControlStateModule.Disabled] = UDim2.fromOffset(0, 0),
	[ControlStateModule.Selected] = UDim2.fromOffset(52, 52),
	[ControlStateModule.SelectedPressed] = UDim2.fromOffset(42, 42)
}
local config2 = {
	[ControlStateModule.Default] = "component_assets/dropshadow_28",
	[ControlStateModule.Hover] = "component_assets/dropshadow_28",
	[ControlStateModule.Selected] = "component_assets/circle_52_stroke_3",
	[ControlStateModule.SelectedPressed] = "component_assets/circle_42_stroke_3"
}
BaseKnob.validateProps = TModule.interface({
	onStateChanged = TModule.optional(TModule.callback),
	isDisabled = TModule.optional(TModule.boolean),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	onActivated = TModule.optional(TModule.callback),
	anchorPoint = TModule.optional(TModule.Vector2),
	layoutOrder = TModule.optional(TModule.number),
	position = TModule.optional(TModule.UDim2),
	colorMap = TModule.strictInterface({
		[ControlStateModule.Default] = ValidateColorInfoModule,
		[ControlStateModule.Hover] = ValidateColorInfoModule,
		[ControlStateModule.Pressed] = ValidateColorInfoModule,
		[ControlStateModule.Disabled] = ValidateColorInfoModule,
		[ControlStateModule.Selected] = ValidateColorInfoModule,
		[ControlStateModule.SelectedPressed] = ValidateColorInfoModule
	}),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	controlRef = TModule.optional(TModule.table),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
BaseKnob.defaultProps = {
	userInteractionEnabled = true,
	isDisabled = false,
	isRoactGamepadEnabled = true,
	anchorPoint = Vector2.new(0.5, 0.5)
}

function BaseKnob.init(p1)
	-- upvalues: ControlStateModule (copy)
	p1:setState({ controlState = ControlStateModule.Initialize })
	
	function p1.onStateChanged(p2, ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
end

function BaseKnob.render(p1)
	-- upvalues: WithStyleModule (copy), ControlStateModule (copy), config1 (copy), config2 (copy), config (copy), RoactModule (copy), ImageSetComponentModule (copy), ImagesModule (copy), RoactGamepadModule (copy), InteractableModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), ControlStateModule (upval), config1 (upval), config2 (upval), config (upval), RoactModule (upval), ImageSetComponentModule (upval), ImagesModule (upval), RoactGamepadModule (upval), InteractableModule (upval)
		local Color = p1.props.colorMap[p1.state.controlState] or p1.props.colorMap[ControlStateModule.Default]
		local IsControlStateMatch: boolean = p1.state.controlState == ControlStateModule.Selected or p1.state.controlState == ControlStateModule.SelectedPressed
		local SelectionCursor = if config[p1.state.controlState] then if IsControlStateMatch then p2.Theme.SelectionCursor else config[p1.state.controlState] elseif IsControlStateMatch then p2.Theme.SelectionCursor else config[ControlStateModule.Default]
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.props.anchorPoint,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			Size = UDim2.fromOffset(28, 28)
		}, {
			KnobShadow = RoactModule.createElement(ImageSetComponentModule.Label, {
				Active = true,
				BackgroundTransparency = 1,
				Size = config1[p1.state.controlState] or config1[ControlStateModule.Default],
				Position = UDim2.new(0.5, 0, 0.5, if IsControlStateMatch then 0 else 2),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = ImagesModule[config2[p1.state.controlState] or config2[ControlStateModule.Default]],
				ImageColor3 = SelectionCursor.Color,
				ImageTransparency = SelectionCursor.Transparency
			}),
			KnobButton = RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable[InteractableModule] else InteractableModule, {
				Size = UDim2.fromScale(1, 1),
				isDisabled = p1.props.isDisabled,
				onStateChanged = p1.onStateChanged,
				userInteractionEnabled = p1.props.userInteractionEnabled,
				BackgroundTransparency = 1,
				Image = ImagesModule["component_assets/circle_29"],
				ImageColor3 = Color.Color,
				ImageTransparency = Color.Transparency,
				[RoactModule.Ref] = p1.props.forwardedRef,
				[RoactModule.Event.Activated] = p1.props.onActivated,
				NextSelectionLeft = p1.props.NextSelectionLeft,
				NextSelectionRight = p1.props.NextSelectionRight,
				NextSelectionUp = p1.props.NextSelectionUp,
				NextSelectionDown = p1.props.NextSelectionDown
			})
		})
	end)
end

return BaseKnob