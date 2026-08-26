local parent = script.Parent.Parent.Parent.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local imagesModule = require(parent.UIBlox.App.ImageSet.Images)
local genericSelectionCellModule = require(parent.UIBlox.Core.Cell.GenericSelectionCell)
local circle24Stroke1 = imagesModule["component_assets/circle_24_stroke_1"]
local circle16 = imagesModule["component_assets/circle_16"]
local smallRadioButtonCell = roactModule.PureComponent:extend("SmallRadioButtonCell")
smallRadioButtonCell.validateProps = tModule.strictInterface({
	id = tModule.string,
	text = tModule.optional(tModule.string),
	onActivated = tModule.optional(tModule.callback),
	isSelected = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	useDefaultControlState = tModule.optional(tModule.boolean),
	layoutOrder = tModule.optional(tModule.number),
	controlRef = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	SelectionImageObject = tModule.optional(tModule.table)
})
smallRadioButtonCell.defaultProps = { text = "", isSelected = false }

function smallRadioButtonCell.init(p1)
	function p0.onSetValue()
		-- upvalues: p1 (ref)
		p1.props.onActivated(p1.props.id)
	end
end

function smallRadioButtonCell.render(p1)
	-- upvalues: roactModule (ref), genericSelectionCellModule (ref), circle24Stroke1 (ref), circle16 (ref)
	assert(p1.validateProps(p1.props))
	
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 56),
		LayoutOrder = p1.props.layoutOrder
	}, {
		GenericSelectionCell = roactModule.createElement(genericSelectionCellModule, {
			isSelected = p1.props.isSelected,
			isDisabled = p1.props.isDisabled,
			defaultImage = circle24Stroke1,
			selectedImage = circle16,
			defaultImageSize = 24,
			selectedImageSize = 16,
			text = p1.props.text,
			onActivated = p1.onSetValue,
			useDefaultControlState = p1.props.useDefaultControlState,
			[roactModule.Ref] = p1.props.controlRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			SelectionImageObject = p1.props.SelectionImageObject
		})
	})
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), smallRadioButtonCell (ref), cryoModule (ref)
	return roactModule.createElement(smallRadioButtonCell, cryoModule.Dictionary.join(p1, { controlRef = p2 }))
end)