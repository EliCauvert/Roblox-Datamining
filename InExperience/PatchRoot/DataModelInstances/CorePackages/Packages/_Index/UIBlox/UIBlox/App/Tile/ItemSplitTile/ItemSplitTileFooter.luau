local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local FoundationModule = require(Parent2.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local ImagesModule = require(Parent1.App.ImageSet.Images)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Skeleton = FoundationModule.Skeleton
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeUDim2Module = require(Parent.ImageSet.getIconSizeUDim2)
local ItemSplitTileFooter = RoactModule.PureComponent:extend("ItemSplitTileFooter")
ItemSplitTileFooter.validateProps = TModule.strictInterface({
	priceText = TModule.optional(TModule.string),
	isOwned = TModule.optional(TModule.boolean),
	layoutOrder = TModule.optional(TModule.number)
})

function ItemSplitTileFooter.render(p1)
	-- upvalues: ImagesModule (copy), WithStyleModule (copy), GetIconSizeUDim2Module (copy), IconSizeModule (copy), RoactModule (copy), Skeleton (copy), ImageSetComponentModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local PriceText = p1.props.priceText
	local IsOwned = p1.props.isOwned
	local IconsStatusItemOwned = if IsOwned then ImagesModule["icons/status/item/owned"] else ImagesModule["icons/common/robux_small"]
	
	return WithStyleModule(function(p2)
		-- upvalues: PriceText (copy), IsOwned (copy), GetIconSizeUDim2Module (upval), IconSizeModule (upval), RoactModule (upval), p1 (copy), Skeleton (upval), ImageSetComponentModule (upval), IconsStatusItemOwned (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local BodyFont = p2.Font.Body.Font
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize
		local Theme = p2.Theme
		local Number = PriceText and tonumber(PriceText:sub(1, 1)) or PriceText == "--"
		local Number1 = PriceText and (Number or IsOwned)
		local IconSizeUDim2Module = GetIconSizeUDim2Module(IconSizeModule.Small)
		local NewOffset: number = if Number1 then IconSizeUDim2Module.Width.Offset + 4 else 0
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize),
			LayoutOrder = p1.props.layoutOrder
		}, {
			Shimmer = if PriceText then nil else RoactModule.createElement(Skeleton, { Size = UDim2.new(0.8, 0, 0, ScaledBaseSize) }),
			Icon = Number1 and RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Image = IconsStatusItemOwned,
				ImageColor3 = Theme.TextMuted.Color,
				ImageTransparency = Theme.TextMuted.Transparency,
				Size = IconSizeUDim2Module,
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5)
			}),
			TextLabel = PriceText and RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, NewOffset, 0, 0),
				Size = UDim2.new(1, -NewOffset, 1, 0),
				Font = if FoundationFontFaceMigration then nil else BodyFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodyFont) else nil,
				TextColor3 = Theme.TextMuted.Color,
				TextTransparency = Theme.TextMuted.Transparency,
				TextSize = ScaledBaseSize,
				Text = PriceText,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end)
end

return ItemSplitTileFooter