local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local FoundationFontFaceMigration = require(Parent2.Foundation).Utility.Flags.FoundationFontFaceMigration
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local GetFontFromFontStyleModule = require(Parent1.Core.Text.GetFontFromFontStyle)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local Core = Parent1.Core
local InteractableModule = require(Core.Control.Interactable)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local IconsNavigationPushRightSmall = require(Parent.ImageSet.Images)["icons/navigation/pushRight_small"]
local CarouselHeader = RoactModule.PureComponent:extend("CarouselHeader")
CarouselHeader.validateProps = TModule.strictInterface({
	headerText = TModule.optional(TModule.string),
	onSeeAll = TModule.optional(TModule.callback),
	carouselMargin = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.number)
})
CarouselHeader.defaultProps = { headerText = "", carouselMargin = 0 }

function CarouselHeader.render(p1)
	-- upvalues: WithStyleModule (copy), FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), GetTextSizeModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), RoactModule (copy), InteractableModule (copy), GenericTextLabelModule (copy), ImageSetComponentModule (copy), IconsNavigationPushRightSmall (copy)
	local HeaderText = p1.props.headerText
	local OnSeeAll = p1.props.onSeeAll
	local LayoutOrder = p1.props.layoutOrder
	local CarouselMargin = p1.props.carouselMargin
	
	return WithStyleModule(function(p2)
		-- upvalues: FoundationFontFaceMigration (upval), GetFontFromFontStyleModule (upval), GetTextSizeModule (upval), HeaderText (copy), GetIconSizeModule (upval), IconSizeModule (upval), RoactModule (upval), LayoutOrder (copy), InteractableModule (upval), CarouselMargin (copy), OnSeeAll (copy), GenericTextLabelModule (upval), ImageSetComponentModule (upval), IconsNavigationPushRightSmall (upval)
		local Header1 = p2.Font.Header1
		local TextSizeModule = GetTextSizeModule(HeaderText, Header1.RelativeSize * p2.Font.BaseSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(Header1) else Header1.Font, Vector2.new(10000, 10000))
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, TextSizeModule.Y),
			LayoutOrder = LayoutOrder
		}, {
			CarouselHeaderButton = RoactModule.createElement(InteractableModule, {
				Position = UDim2.fromOffset(CarouselMargin, 0),
				Size = UDim2.fromOffset(TextSizeModule.X + 4 + GetIconSizeModule(IconSizeModule.Small), TextSizeModule.Y),
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				[RoactModule.Event.Activated] = OnSeeAll,
				onStateChanged = function() end
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				HeaderText = RoactModule.createElement(GenericTextLabelModule, {
					LayoutOrder = 1,
					Text = HeaderText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					fontStyle = Header1,
					colorStyle = p2.Theme.TextEmphasis
				}),
				SeeAllArrow = OnSeeAll and RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Small), GetIconSizeModule(IconSizeModule.Small)),
					Image = IconsNavigationPushRightSmall,
					ImageColor3 = p2.Theme.TextEmphasis.Color,
					ImageTransparency = p2.Theme.TextEmphasis.Transparency
				}) or nil
			})
		})
	end)
end

return CarouselHeader