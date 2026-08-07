local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local roactGamepadModule = require(parent_2.RoactGamepad)
local imagesModule = require(parent.ImageSet.Images)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local interactableModule = require(parent_1.Core.Control.Interactable)
local controlStateModule = require(parent_1.Core.Control.Enum.ControlState)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local validateColorInfoModule = require(parent_1.Core.Style.Validator.validateColorInfo)
local baseKnob = roactModule.Component:extend("BaseKnob")
local t = {
	[controlStateModule.Default] = { Transparency = 0.7, Color = Color3.fromRGB(0, 0, 0) },
	[controlStateModule.Hover] = { Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0) }
}
local t_1 = {
	[controlStateModule.Default] = UDim2.fromOffset(48, 48),
	[controlStateModule.Hover] = UDim2.fromOffset(48, 48),
	[controlStateModule.Pressed] = UDim2.fromOffset(0, 0),
	[controlStateModule.Disabled] = UDim2.fromOffset(0, 0),
	[controlStateModule.Selected] = UDim2.fromOffset(52, 52),
	[controlStateModule.SelectedPressed] = UDim2.fromOffset(42, 42)
}
local t_2 = {
	[controlStateModule.Default] = "component_assets/dropshadow_28",
	[controlStateModule.Hover] = "component_assets/dropshadow_28",
	[controlStateModule.Selected] = "component_assets/circle_52_stroke_3",
	[controlStateModule.SelectedPressed] = "component_assets/circle_42_stroke_3"
}
baseKnob.validateProps = tModule.interface({
	onStateChanged = tModule.optional(tModule.callback),
	isDisabled = tModule.optional(tModule.boolean),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	onActivated = tModule.optional(tModule.callback),
	anchorPoint = tModule.optional(tModule.Vector2),
	layoutOrder = tModule.optional(tModule.number),
	position = tModule.optional(tModule.UDim2),
	colorMap = tModule.strictInterface({
		[controlStateModule.Default] = validateColorInfoModule,
		[controlStateModule.Hover] = validateColorInfoModule,
		[controlStateModule.Pressed] = validateColorInfoModule,
		[controlStateModule.Disabled] = validateColorInfoModule,
		[controlStateModule.Selected] = validateColorInfoModule,
		[controlStateModule.SelectedPressed] = validateColorInfoModule
	}),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	controlRef = tModule.optional(tModule.table),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
baseKnob.defaultProps = {
	userInteractionEnabled = true,
	isDisabled = false,
	isRoactGamepadEnabled = true,
	anchorPoint = Vector2.new(0.5, 0.5)
}

function baseKnob.init(p0) --[[ line: 99 ]]
	-- upvalues: controlStateModule (ref)
	p0:setState({ controlState = controlStateModule.Initialize })
	
	function p0.onStateChanged(p1, p2) --[[ line: 104 ]]
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p2 })
		
		if p0.props.onStateChanged then
			p0.props.onStateChanged(p1, p2)
		end
	end
end

function baseKnob.render(p3) --[[ line: 114 ]]
	-- upvalues: withStyleModule (ref), controlStateModule (ref), t_1 (ref), t_2 (ref), t (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref), roactGamepadModule (ref), interactableModule (ref)
	return withStyleModule(function(p4) --[[ line: 115 ]]
		-- upvalues: p3 (ref), controlStateModule (copy), t_1 (copy), t_2 (copy), t (copy), roactModule (copy), imageSetComponentModule (copy), imagesModule (copy), roactGamepadModule (copy), interactableModule (copy)
		local controlState = p3.props.colorMap[p3.state.controlState] or p3.props.colorMap[controlStateModule.Default]
		local controlState_1 = t_1[p3.state.controlState] or t_1[controlStateModule.Default]
		local controlState_2 = t_2[p3.state.controlState] or t_2[controlStateModule.Default]
		local var16 = if p3.state.controlState ~= controlStateModule.Selected then p3.state.controlState == controlStateModule.SelectedPressed else true
		local var17 = t[p3.state.controlState] or t[controlStateModule.Default]
		
		if var16 then
			var17 = p4.Theme.SelectionCursor
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p3.props.anchorPoint,
			LayoutOrder = p3.props.layoutOrder,
			Position = p3.props.position,
			Size = UDim2.fromOffset(28, 28)
		}, {
			KnobShadow = roactModule.createElement(imageSetComponentModule.Label, {
				Active = true,
				BackgroundTransparency = 1,
				Size = controlState_1,
				Position = UDim2.new(0.5, 0, 0.5, if not var16 then 2 else 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = imagesModule[controlState_2],
				ImageColor3 = var17.Color,
				ImageTransparency = var17.Transparency
			}),
			KnobButton = roactModule.createElement(if p3.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[interactableModule] else interactableModule, {
				Size = UDim2.fromScale(1, 1),
				isDisabled = p3.props.isDisabled,
				onStateChanged = p3.onStateChanged,
				userInteractionEnabled = p3.props.userInteractionEnabled,
				BackgroundTransparency = 1,
				Image = imagesModule["component_assets/circle_29"],
				ImageColor3 = controlState.Color,
				ImageTransparency = controlState.Transparency,
				[roactModule.Ref] = p3.props.forwardedRef,
				[roactModule.Event.Activated] = p3.props.onActivated,
				NextSelectionLeft = p3.props.NextSelectionLeft,
				NextSelectionRight = p3.props.NextSelectionRight,
				NextSelectionUp = p3.props.NextSelectionUp,
				NextSelectionDown = p3.props.NextSelectionDown
			})
		})
	end)
end

return baseKnob