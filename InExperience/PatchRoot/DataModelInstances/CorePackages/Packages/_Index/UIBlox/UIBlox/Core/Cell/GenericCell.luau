local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local genericTextLabelModule = require(parent.Text.GenericTextLabel.GenericTextLabel)
local interactableModule = require(parent.Control.Interactable)
local validateColorInfoModule = require(parent_1.Core.Style.Validator.validateColorInfo)
local validateFontInfoModule = require(parent_1.Core.Style.Validator.validateFontInfo)
local genericCell = roactModule.PureComponent:extend("GenericCell")
genericCell.validateProps = tModule.strictInterface({
	onActivated = tModule.optional(tModule.callback),
	isSelected = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	onStateChanged = tModule.callback,
	titleText = tModule.optional(tModule.string),
	subtitleText = tModule.optional(tModule.string),
	renderRightContent = tModule.optional(tModule.callback),
	rightContentWidth = tModule.optional(tModule.number),
	renderLeftContent = tModule.optional(tModule.callback),
	leftContentWidth = tModule.optional(tModule.number),
	colorStyle = validateColorInfoModule,
	textStyle = tModule.optional(validateColorInfoModule),
	fontStyle = tModule.optional(validateFontInfoModule),
	subtitleTextStyle = tModule.optional(validateColorInfoModule),
	subtitleFontStyle = tModule.optional(validateFontInfoModule),
	dividerStyle = tModule.table,
	controlRef = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	SelectionImageObject = tModule.optional(tModule.table)
})
genericCell.defaultProps = {
	rightContentWidth = 0,
	leftContentWidth = 0,
	isDisabled = false
}

function genericCell.render(p1)
	-- upvalues: roactModule (ref), interactableModule (ref), genericTextLabelModule (ref)
	assert(p1.validateProps(p1.props))
	
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Interactable = roactModule.createElement(interactableModule, {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p1.props.colorStyle.Color,
			BackgroundTransparency = p1.props.colorStyle.Transparency,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			[roactModule.Event.Activated] = not p1.props.isDisabled and p1.props.onActivated,
			[roactModule.Ref] = p1.props.controlRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			SelectionImageObject = p1.props.SelectionImageObject,
			isDisabled = p1.props.isDisabled,
			onStateChanged = p1.props.onStateChanged
		}, {
			Contents = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12)
				}),
				UIListLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Frame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, (-p1.props.rightContentWidth) - p1.props.leftContentWidth, 1, 0)
				}, {
					UIListLayout = roactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					TitleText = p1.props.titleText and roactModule.createElement(genericTextLabelModule, {
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 1, 0),
						colorStyle = p1.props.textStyle,
						fontStyle = p1.props.fontStyle,
						Text = p1.props.titleText,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					SubTitleText = p1.props.subtitleText and roactModule.createElement(genericTextLabelModule, {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 1, 0),
						colorStyle = p1.props.subtitleTextStyle,
						fontStyle = p1.props.subtitleFontStyle,
						Text = p1.props.subtitleText,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				RightContent = p1.props.renderRightContent and p1.props.renderRightContent(),
				LeftContent = p1.props.renderLeftContent and p1.props.renderLeftContent()
			}),
			Divider = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -24, 0, 1),
				Position = UDim2.new(0, 24, 1, -1),
				BackgroundColor3 = p1.props.dividerStyle.Color,
				BackgroundTransparency = p1.props.dividerStyle.Transparency
			})
		})
	})
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), genericCell (ref), cryoModule (ref)
	return roactModule.createElement(genericCell, cryoModule.Dictionary.join(p1, { controlRef = p2 }))
end)