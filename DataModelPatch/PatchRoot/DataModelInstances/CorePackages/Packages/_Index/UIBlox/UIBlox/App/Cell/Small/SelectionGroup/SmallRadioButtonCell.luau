local Parent = script.Parent.Parent.Parent.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local ImagesModule = require(Parent.UIBlox.App.ImageSet.Images)
local GenericSelectionCellModule = require(Parent.UIBlox.Core.Cell.GenericSelectionCell)
local ComponentAssetsCircle24Stroke1 = ImagesModule["component_assets/circle_24_stroke_1"]
local ComponentAssetsCircle16 = ImagesModule["component_assets/circle_16"]
local SmallRadioButtonCell = RoactModule.PureComponent:extend("SmallRadioButtonCell")
SmallRadioButtonCell.validateProps = TModule.strictInterface({
	id = TModule.string,
	text = TModule.optional(TModule.string),
	onActivated = TModule.optional(TModule.callback),
	isSelected = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	useDefaultControlState = TModule.optional(TModule.boolean),
	layoutOrder = TModule.optional(TModule.number),
	controlRef = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	SelectionImageObject = TModule.optional(TModule.table)
})
SmallRadioButtonCell.defaultProps = { text = "", isSelected = false }

function SmallRadioButtonCell.init(p1)
	function p1.onSetValue()
		-- upvalues: p1 (copy)
		p1.props.onActivated(p1.props.id)
	end
end

function SmallRadioButtonCell.render(p1)
	-- upvalues: RoactModule (copy), GenericSelectionCellModule (copy), ComponentAssetsCircle24Stroke1 (copy), ComponentAssetsCircle16 (copy)
	assert(p1.validateProps(p1.props))
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 56),
		LayoutOrder = p1.props.layoutOrder
	}, {
		GenericSelectionCell = RoactModule.createElement(GenericSelectionCellModule, {
			isSelected = p1.props.isSelected,
			isDisabled = p1.props.isDisabled,
			defaultImage = ComponentAssetsCircle24Stroke1,
			selectedImage = ComponentAssetsCircle16,
			defaultImageSize = 24,
			selectedImageSize = 16,
			text = p1.props.text,
			onActivated = p1.onSetValue,
			useDefaultControlState = p1.props.useDefaultControlState,
			[RoactModule.Ref] = p1.props.controlRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			SelectionImageObject = p1.props.SelectionImageObject
		})
	})
end

return RoactModule.forwardRef(function(p1, ControlRef)
	-- upvalues: RoactModule (copy), SmallRadioButtonCell (copy), CryoModule (copy)
	return RoactModule.createElement(SmallRadioButtonCell, CryoModule.Dictionary.join(p1, { controlRef = ControlRef }))
end)