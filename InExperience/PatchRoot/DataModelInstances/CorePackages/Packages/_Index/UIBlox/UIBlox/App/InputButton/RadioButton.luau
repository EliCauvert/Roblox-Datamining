local parent = script.Parent.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local cryoModule = require(parent.Cryo)
local withStyleModule = require(parent.UIBlox.Core.Style.withStyle)
local imagesModule = require(parent.UIBlox.App.ImageSet.Images)
local inputButtonModule = require(parent.UIBlox.Core.InputButton.InputButton)
local roactGamepadModule = require(parent.RoactGamepad)
local radioButton = roactModule.PureComponent:extend("RadioButton")
radioButton.validateProps = tModule.strictInterface({
	text = tModule.string,
	isSelected = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	onActivated = tModule.callback,
	size = tModule.UDim2,
	layoutOrder = tModule.optional(tModule.number),
	id = tModule.number,
	NextSelectionDown = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	SelectionImageObject = tModule.optional(tModule.table),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean),
	forwardRef = tModule.optional(tModule.table)
})
radioButton.defaultProps = {
	text = "RadioButton Text",
	isSelected = false,
	isDisabled = false,
	layoutOrder = 0,
	isRoactGamepadEnabled = true
}

function radioButton.init(p0)
	function p0.onSetValue()
		-- upvalues: p0 (ref)
		if not p0.props.isDisabled then
			p0.props.onActivated(p0.props.id)
		end
	end
end

function radioButton.render(p1)
	-- upvalues: withStyleModule (ref), imagesModule (ref), roactGamepadModule (ref), inputButtonModule (ref), roactModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: imagesModule (copy), p1 (ref), roactGamepadModule (copy), inputButtonModule (copy), roactModule (copy)
		local uDim2
		local theme = p2.Theme
		local circle24Stroke1 = imagesModule["component_assets/circle_24_stroke_1"]
		local color = theme.TextDefault.Color
		local circle16 = imagesModule["component_assets/circle_16"]
		local color_1 = theme.TextDefault.Color
		local _ = nil
		local isSelected = p1.props.isSelected
		local color_2 = theme.TextDefault.Color
		local var8 = if p1.props.isDisabled then 0.5 else theme.TextDefault.Transparency
		
		if isSelected then
			uDim2 = UDim2.new(0, 18, 0, 18)
			color_1 = theme.SystemPrimaryDefault.Color
			color = theme.SystemPrimaryDefault.Color
		else
			uDim2 = UDim2.new(0, 0, 0, 0)
		end
		return roactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[inputButtonModule] else inputButtonModule, {
			text = p1.props.text,
			onActivated = p1.onSetValue,
			size = p1.props.size,
			image = circle24Stroke1,
			imageColor = color,
			fillImage = circle16,
			fillImageSize = uDim2,
			fillImageColor = color_1,
			selectedColor = theme.SystemPrimaryDefault.Color,
			textColor = color_2,
			transparency = var8,
			layoutOrder = p1.props.layoutOrder,
			isDisabled = p1.props.isDisabled,
			isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled,
			[roactModule.Ref] = p1.props.forwardRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			SelectionImageObject = p1.props.SelectionImageObject
		})
	end)
end

return roactModule.forwardRef(function(p3, p4)
	-- upvalues: roactModule (ref), radioButton (ref), cryoModule (ref)
	return roactModule.createElement(radioButton, cryoModule.Dictionary.join(p3, { forwardRef = p4 }))
end)