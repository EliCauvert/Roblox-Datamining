local parent = script.Parent.Parent.Parent
local core = parent.Core
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local interactableModule = require(core.Control.Interactable)
local controlStateModule = require(core.Control.Enum.ControlState)
local getContentStyleModule = require(core.Button.getContentStyle)
local withStyleModule = require(parent.Core.Style.withStyle)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local skeleton = foundationModule.Skeleton
local iconSizeModule = require(parent.App.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.App.ImageSet.getIconSize)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local validateFontInfoModule = require(parent.Core.Style.Validator.validateFontInfo)
local validateImageModule = require(core.ImageSet.Validator.validateImage)
local segmentedControlTabName = roactModule.PureComponent:extend("SegmentedControlTabName")

function segmentedControlTabName.init(p1)
	-- upvalues: controlStateModule (ref)
	p1.state = { controlState = controlStateModule.Initialize }
	
	function p0.onStateChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
		end
	end
end

local var1 = tModule.interface({ [controlStateModule.Default] = tModule.string })
segmentedControlTabName.validateProps = tModule.interface({
	icon = tModule.optional(validateImageModule),
	text = tModule.optional(tModule.string),
	fontStyle = tModule.optional(validateFontInfoModule),
	textStateColorMap = tModule.optional(var1),
	iconStateColorMap = tModule.optional(var1),
	isDisabled = tModule.optional(tModule.boolean),
	isLoading = tModule.optional(tModule.boolean),
	onActivated = tModule.callback,
	onStateChanged = tModule.optional(tModule.callback),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	isSelectedStyle = tModule.optional(tModule.boolean)
})
segmentedControlTabName.defaultProps = {
	isDisabled = false,
	isLoading = false,
	isSelectedStyle = false,
	SliceCenter = Rect.new(8, 8, 9, 9),
	textStateColorMap = {
		[controlStateModule.Default] = "TextDefault",
		[controlStateModule.Hover] = "TextEmphasis"
	},
	buttonStateColorMap = { [controlStateModule.Default] = "SecondaryContent" }
}

function segmentedControlTabName.render(p1)
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getContentStyleModule (ref), roactModule (ref), skeleton (ref), imageSetComponentModule (ref), getIconSizeModule (ref), iconSizeModule (ref), genericTextLabelModule (ref), interactableModule (ref), cryoModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), controlStateModule (copy), getContentStyleModule (copy), roactModule (copy), skeleton (copy), imageSetComponentModule (copy), getIconSizeModule (copy), iconSizeModule (copy), genericTextLabelModule (copy), interactableModule (copy), cryoModule (copy)
		local controlState = p1.state.controlState
		local text = p1.props.text
		local icon = p1.props.icon
		local isLoading = p1.props.isLoading
		local isDisabled = p1.props.isDisabled
		local buttonStateColorMap = p1.props.buttonStateColorMap
		local contentStateColorMap = p1.props.contentStateColorMap
		local textStateColorMap = p1.props.textStateColorMap or contentStateColorMap
		local iconStateColorMap = p1.props.iconStateColorMap or contentStateColorMap
		
		if isLoading then
			isDisabled = true
		end
		local var2 = controlState
		
		if p1.props.isDisabled then
			var2 = controlStateModule.Disabled
		elseif p1.props.isSelectedStyle then
			var2 = controlStateModule.Hover
		end
		local var3 = getContentStyleModule(buttonStateColorMap, controlState, p2)
		local var4 = text and getContentStyleModule(textStateColorMap, var2, p2)
		local var5 = icon and getContentStyleModule(iconStateColorMap, controlState, p2)
		local _ = nil
		
		return roactModule.createElement(interactableModule, cryoModule.Dictionary.join(p1.props, {
			icon = cryoModule.None,
			text = cryoModule.None,
			buttonStateColorMap = cryoModule.None,
			contentStateColorMap = cryoModule.None,
			textStateColorMap = cryoModule.None,
			iconStateColorMap = cryoModule.None,
			onActivated = cryoModule.None,
			isLoading = cryoModule.None,
			isSelectedStyle = cryoModule.None,
			[roactModule.Children] = cryoModule.None,
			isDisabled = isDisabled,
			onStateChanged = p1.onStateChanged,
			userInteractionEnabled = p1.props.userInteractionEnabled,
			Image = cryoModule.None,
			ScaleType = Enum.ScaleType.Slice,
			ImageColor3 = var3.Color,
			ImageTransparency = var3.Transparency,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[roactModule.Event.Activated] = p1.props.onActivated
		}), {
			ButtonContent = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, if isLoading then {
				isLoadingShimmer = roactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
			} else p1.props[roactModule.Children] or {
				UIListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 5)
				}),
				Icon = icon and roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, getIconSizeModule(iconSizeModule.Medium), 0, getIconSizeModule(iconSizeModule.Medium)),
					Image = icon,
					ImageColor3 = var5.Color,
					ImageTransparency = var5.Transparency
				}) or nil,
				Text = text and roactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.X,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Text = text,
					fontStyle = p1.props.fontStyle or p2.Font.Header2,
					colorStyle = var4
				}) or nil
			})
		})
	end)
end

return segmentedControlTabName