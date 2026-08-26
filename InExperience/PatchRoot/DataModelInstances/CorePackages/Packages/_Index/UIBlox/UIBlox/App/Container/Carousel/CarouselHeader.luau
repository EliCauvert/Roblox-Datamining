local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local imagesModule = require(parent.ImageSet.Images)
local core = parent_1.Core
local interactableModule = require(core.Control.Interactable)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local pushRightSmall = imagesModule["icons/navigation/pushRight_small"]
local carouselHeader = roactModule.PureComponent:extend("CarouselHeader")
carouselHeader.validateProps = tModule.strictInterface({
	headerText = tModule.optional(tModule.string),
	onSeeAll = tModule.optional(tModule.callback),
	carouselMargin = tModule.optional(tModule.number),
	layoutOrder = tModule.optional(tModule.number)
})
carouselHeader.defaultProps = { headerText = "", carouselMargin = 0 }

function carouselHeader.render(p1)
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), getIconSizeModule (ref), iconSizeModule (ref), roactModule (ref), interactableModule (ref), genericTextLabelModule (ref), imageSetComponentModule (ref), pushRightSmall (ref)
	local headerText = p1.props.headerText
	local onSeeAll = p1.props.onSeeAll
	local layoutOrder = p1.props.layoutOrder
	local carouselMargin = p1.props.carouselMargin
	
	return withStyleModule(function(p2)
		-- upvalues: getTextSizeModule (copy), headerText (ref), getIconSizeModule (copy), iconSizeModule (copy), roactModule (copy), layoutOrder (ref), interactableModule (copy), carouselMargin (ref), onSeeAll (ref), genericTextLabelModule (copy), imageSetComponentModule (copy), pushRightSmall (copy)
		local header1 = p2.Font.Header1
		local var1 = getTextSizeModule(headerText, header1.RelativeSize * p2.Font.BaseSize, header1.Font, Vector2.new(10000, 10000))
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var1.Y),
			LayoutOrder = layoutOrder
		}, {
			CarouselHeaderButton = roactModule.createElement(interactableModule, {
				Position = UDim2.fromOffset(carouselMargin, 0),
				Size = UDim2.fromOffset(var1.X + 4 + getIconSizeModule(iconSizeModule.Small), var1.Y),
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				[roactModule.Event.Activated] = onSeeAll,
				onStateChanged = function() end
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				HeaderText = roactModule.createElement(genericTextLabelModule, {
					LayoutOrder = 1,
					Text = headerText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					fontStyle = header1,
					colorStyle = p2.Theme.TextEmphasis
				}),
				SeeAllArrow = onSeeAll and roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromOffset(getIconSizeModule(iconSizeModule.Small), getIconSizeModule(iconSizeModule.Small)),
					Image = pushRightSmall,
					ImageColor3 = p2.Theme.TextEmphasis.Color,
					ImageTransparency = p2.Theme.TextEmphasis.Transparency
				}) or nil
			})
		})
	end)
end

return carouselHeader