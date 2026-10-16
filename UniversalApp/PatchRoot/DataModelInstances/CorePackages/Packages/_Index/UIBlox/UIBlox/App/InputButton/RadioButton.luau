local Parent = script.Parent.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local CryoModule = require(Parent.Cryo)
local WithStyleModule = require(Parent.UIBlox.Core.Style.withStyle)
local ImagesModule = require(Parent.UIBlox.App.ImageSet.Images)
local InputButtonModule = require(Parent.UIBlox.Core.InputButton.InputButton)
local RoactGamepadModule = require(Parent.RoactGamepad)
local RadioButton = RoactModule.PureComponent:extend("RadioButton")
RadioButton.validateProps = TModule.strictInterface({
	text = TModule.string,
	isSelected = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	onActivated = TModule.callback,
	size = TModule.UDim2,
	layoutOrder = TModule.optional(TModule.number),
	id = TModule.number,
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	SelectionImageObject = TModule.optional(TModule.table),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean),
	forwardRef = TModule.optional(TModule.table)
})
RadioButton.defaultProps = {
	text = "RadioButton Text",
	isSelected = false,
	isDisabled = false,
	layoutOrder = 0,
	isRoactGamepadEnabled = true
}

function RadioButton.init(p1) --[[ Line: 52 ]]
	function p1.onSetValue() --[[ Line: 53 ]]
		-- upvalues: p1 (copy)
		if not p1.props.isDisabled then
			p1.props.onActivated(p1.props.id)
		end
	end
end

function RadioButton.render(p1) --[[ Line: 60 ]]
	-- upvalues: WithStyleModule (copy), ImagesModule (copy), RoactGamepadModule (copy), InputButtonModule (copy), RoactModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 61 ]]
		-- upvalues: ImagesModule (upval), p1 (copy), RoactGamepadModule (upval), InputButtonModule (upval), RoactModule (upval)
		local Theme = p2.Theme
		local ComponentAssetsCircle24Stroke1 = ImagesModule["component_assets/circle_24_stroke_1"]
		local Color = Theme.TextDefault.Color
		local ComponentAssetsCircle16 = ImagesModule["component_assets/circle_16"]
		local Color1 = Theme.TextDefault.Color
		local Color2 = Theme.TextDefault.Color
		local Transparency = if p1.props.isDisabled then 0.5 else Theme.TextDefault.Transparency
		local _UDim2 = nil
		
		if p1.props.isSelected then
			_UDim2 = UDim2.new(0, 18, 0, 18)
			Color1 = Theme.SystemPrimaryDefault.Color
			Color = Theme.SystemPrimaryDefault.Color
		else
			_UDim2 = UDim2.new(0, 0, 0, 0)
		end
		return RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable[InputButtonModule] else InputButtonModule, {
			text = p1.props.text,
			onActivated = p1.onSetValue,
			size = p1.props.size,
			image = ComponentAssetsCircle24Stroke1,
			imageColor = Color,
			fillImage = ComponentAssetsCircle16,
			fillImageSize = _UDim2,
			fillImageColor = Color1,
			selectedColor = Theme.SystemPrimaryDefault.Color,
			textColor = Color2,
			transparency = Transparency,
			layoutOrder = p1.props.layoutOrder,
			isDisabled = p1.props.isDisabled,
			isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled,
			[RoactModule.Ref] = p1.props.forwardRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			SelectionImageObject = p1.props.SelectionImageObject
		})
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef) --[[ Line: 117 ]]
	-- upvalues: RoactModule (copy), RadioButton (copy), CryoModule (copy)
	return RoactModule.createElement(RadioButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)