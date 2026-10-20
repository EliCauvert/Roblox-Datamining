local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ImagesModule = require(Parent.App.ImageSet.Images)
local Skeleton = require(Parent1.Foundation).Skeleton
local ImageTextLabelModule = require(Parent.Core.Text.ImageTextLabel.ImageTextLabel)
local EmojiTextLabelModule = require(Parent.Core.Text.EmojiTextLabel.EmojiTextLabel)
local EmojiModule = require(Parent.Core.Emoji.Enum.Emoji)
local ItemTileName = RoactModule.PureComponent:extend("ItemTileName")
ItemTileName.validateProps = TModule.strictInterface({
	LayoutOrder = TModule.optional(TModule.integer),
	maxHeight = TModule.intersection(TModule.number, TModule.numberMin(0)),
	maxWidth = TModule.intersection(TModule.number, TModule.numberMin(0)),
	name = TModule.optional(TModule.string),
	titleIcon = TModule.optional(TModule.table),
	nameTextColor = TModule.optional(TModule.Color3),
	nameTextTransparency = TModule.optional(TModule.number),
	richText = TModule.optional(TModule.boolean),
	hasVerifiedBadge = TModule.optional(TModule.boolean),
	useMaxHeight = TModule.optional(TModule.boolean),
	fluidSizing = TModule.optional(TModule.boolean),
	titleFontStyle = TModule.optional(TModule.union(require(Parent.Core.Style.Validator.validateFontInfo), (require(Parent.Core.Style.Validator.validateTypographyInfo)))),
	horizontalAlignment = TModule.optional(TModule.enum(Enum.HorizontalAlignment))
})

function ItemTileName.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), EmojiTextLabelModule (copy), EmojiModule (copy), ImagesModule (copy), ImageTextLabelModule (copy), Skeleton (copy)
	local LayoutOrder = p1.props.LayoutOrder
	local MaxHeight = p1.props.maxHeight
	local MaxWidth = p1.props.maxWidth
	local Name = p1.props.name
	local TitleIcon = p1.props.titleIcon
	local UseMaxHeight = p1.props.useMaxHeight
	local FluidSizing = p1.props.fluidSizing
	local HasVerifiedBadge = p1.props.hasVerifiedBadge
	local RichText = p1.props.richText
	local Center = if p1.props.horizontalAlignment == Enum.HorizontalAlignment.Center then Enum.TextXAlignment.Center else nil
	
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), Name (copy), MaxWidth (copy), MaxHeight (copy), HasVerifiedBadge (copy), RoactModule (upval), EmojiTextLabelModule (upval), RichText (copy), FluidSizing (copy), EmojiModule (upval), LayoutOrder (copy), TitleIcon (copy), ImagesModule (upval), ImageTextLabelModule (upval), Center (copy), UseMaxHeight (copy), Skeleton (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local TitleFontStyle = p1.props.titleFontStyle or _Font.Header2
		local ScaledBaseSize = if TitleFontStyle.RelativeSize then _Font.BaseSize * TitleFontStyle.RelativeSize else TitleFontStyle.FontSize
		
		if Name == nil then
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(0, MaxWidth, 0, MaxHeight)
			}, {
				FirstLine = RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, ScaledBaseSize) }),
				SecondLine = RoactModule.createElement(Skeleton, {
					Position = UDim2.fromOffset(0, ScaledBaseSize + 4),
					Size = UDim2.new(0.4, 0, 0, ScaledBaseSize)
				})
			})
		end
		local _Vector2 = Vector2.new(MaxWidth, MaxHeight)
		local ColorStyle = {
			Color = p1.props.nameTextColor or Theme.TextEmphasis.Color,
			Transparency = p1.props.nameTextTransparency or Theme.TextEmphasis.Transparency
		}
		
		if HasVerifiedBadge then
			return RoactModule.createElement(EmojiTextLabelModule, {
				RichText = RichText,
				maxSize = _Vector2,
				fluidSizing = FluidSizing,
				emoji = EmojiModule.Verified,
				fontStyle = TitleFontStyle,
				colorStyle = ColorStyle,
				Text = Name,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = LayoutOrder
			})
		else
			local ImageRectSizeRatio = TitleIcon and TitleIcon.ImageRectSize / ImagesModule.ImagesResolutionScale or Vector2.new(0, 0)
			
			return RoactModule.createElement(ImageTextLabelModule, {
				padding = 4,
				imageProps = TitleIcon and {
					BackgroundTransparency = 1,
					Image = TitleIcon,
					ImageColor3 = Theme.IconEmphasis.Color,
					ImageTransparency = Theme.IconEmphasis.Transparency,
					Size = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y),
					AnchorPoint = Vector2.new(0, 0),
					Position = UDim2.new(0, 0, 0, 0)
				} or nil,
				genericTextLabelProps = {
					fluidSizing = FluidSizing,
					fontStyle = TitleFontStyle,
					colorStyle = ColorStyle,
					Text = Name,
					TextTruncate = Enum.TextTruncate.SplitWord,
					RichText = RichText,
					TextXAlignment = Center
				},
				frameProps = { BackgroundTransparency = 1, LayoutOrder = LayoutOrder },
				maxSize = _Vector2,
				useMaxHeight = UseMaxHeight
			})
		end
	end)
end

return ItemTileName