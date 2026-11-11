local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ImagesModule = require(Parent.App.ImageSet.Images)
local Skeleton = require(Parent1.Foundation).Skeleton
local ImageSetComponentModule = require(Parent.Core.ImageSet.ImageSetComponent)
local ItemTileFooter = RoactModule.PureComponent:extend("ItemTileFooter")
ItemTileFooter.validateProps = TModule.strictInterface({
	priceText = TModule.optional(TModule.string),
	isOwned = TModule.optional(TModule.boolean)
})

function ItemTileFooter.render(p1)
	-- upvalues: ImagesModule (copy), WithStyleModule (copy), RoactModule (copy), Skeleton (copy), ImageSetComponentModule (copy)
	local PriceText = p1.props.priceText
	local IsOwned = p1.props.isOwned
	local IconsStatusItemOwned = if IsOwned then ImagesModule["icons/status/item/owned"] else ImagesModule["icons/common/robux_small"]
	
	return WithStyleModule(function(p2)
		-- upvalues: IconsStatusItemOwned (ref), ImagesModule (upval), PriceText (copy), IsOwned (copy), RoactModule (upval), Skeleton (upval), ImageSetComponentModule (upval)
		local SubHeaderFont = p2.Font.SubHeader1.Font
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.SubHeader1.RelativeSize
		local Theme = p2.Theme
		local ImageRectSizeRatio = IconsStatusItemOwned.ImageRectSize / ImagesModule.ImagesResolutionScale
		local Number = PriceText and tonumber(PriceText:sub(1, 1))
		local Number1 = PriceText and (Number or IsOwned)
		local NewX: number = if Number1 then ImageRectSizeRatio.X + 4 else 0
		
		return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Shimmer = not PriceText and RoactModule.createElement(Skeleton, { Size = UDim2.new(0.8, 0, 0, ScaledBaseSize) }),
			icon = Number1 and RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Image = IconsStatusItemOwned,
				ImageColor3 = Theme.IconEmphasis.Color,
				ImageTransparency = Theme.IconEmphasis.Transparency,
				Size = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y)
			}),
			TextLabel = PriceText and RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(1, -NewX, 1, 0),
				Font = SubHeaderFont,
				TextColor3 = Theme.SecondaryContent.Color,
				TextTransparency = Theme.SecondaryContent.Transparency,
				TextSize = ScaledBaseSize,
				Text = PriceText,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return ItemTileFooter