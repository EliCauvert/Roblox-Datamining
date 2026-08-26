local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local foundationModule = require(parent_1.Foundation)
local withStyleModule = require(parent.Core.Style.withStyle)
local imagesModule = require(parent.App.ImageSet.Images)
local skeleton = foundationModule.Skeleton
local imageTextLabelModule = require(parent.Core.Text.ImageTextLabel.ImageTextLabel)
local emojiTextLabelModule = require(parent.Core.Text.EmojiTextLabel.EmojiTextLabel)
local emojiModule = require(parent.Core.Emoji.Enum.Emoji)
local itemTileName = roactModule.PureComponent:extend("ItemTileName")
itemTileName.validateProps = tModule.strictInterface({
	LayoutOrder = tModule.optional(tModule.integer),
	maxHeight = tModule.intersection(tModule.number, tModule.numberMin(0)),
	maxWidth = tModule.intersection(tModule.number, tModule.numberMin(0)),
	name = tModule.optional(tModule.string),
	titleIcon = tModule.optional(tModule.table),
	nameTextColor = tModule.optional(tModule.Color3),
	nameTextTransparency = tModule.optional(tModule.number),
	richText = tModule.optional(tModule.boolean),
	hasVerifiedBadge = tModule.optional(tModule.boolean),
	useMaxHeight = tModule.optional(tModule.boolean),
	fluidSizing = tModule.optional(tModule.boolean),
	titleFontStyle = tModule.optional(tModule.union(require(parent.Core.Style.Validator.validateFontInfo), require(parent.Core.Style.Validator.validateTypographyInfo))),
	horizontalAlignment = tModule.optional(tModule.enum(Enum.HorizontalAlignment))
})

function itemTileName.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), emojiTextLabelModule (ref), emojiModule (ref), imagesModule (ref), imageTextLabelModule (ref), skeleton (ref)
	local layoutOrder = p1.props.LayoutOrder
	local maxHeight = p1.props.maxHeight
	local maxWidth = p1.props.maxWidth
	local name = p1.props.name
	local titleIcon = p1.props.titleIcon
	local useMaxHeight = p1.props.useMaxHeight
	local fluidSizing = p1.props.fluidSizing
	local hasVerifiedBadge = p1.props.hasVerifiedBadge
	local richText = p1.props.richText
	local var1 = if p1.props.horizontalAlignment == Enum.HorizontalAlignment.Center then Enum.TextXAlignment.Center else nil
	
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), name (ref), maxWidth (ref), maxHeight (ref), hasVerifiedBadge (ref), roactModule (copy), emojiTextLabelModule (copy), richText (ref), fluidSizing (ref), emojiModule (copy), layoutOrder (ref), titleIcon (ref), imagesModule (copy), imageTextLabelModule (copy), var1 (ref), useMaxHeight (ref), skeleton (copy)
		local theme = p2.Theme
		local font = p2.Font
		local titleFontStyle = p1.props.titleFontStyle or font.Header2
		local var2 = if titleFontStyle.RelativeSize then font.BaseSize * titleFontStyle.RelativeSize else titleFontStyle.FontSize
		
		if name == nil then
			return roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = layoutOrder,
				Size = UDim2.new(0, maxWidth, 0, maxHeight)
			}, {
				FirstLine = roactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, var2) }),
				SecondLine = roactModule.createElement(skeleton, {
					Position = UDim2.fromOffset(0, var2 + 4),
					Size = UDim2.new(0.4, 0, 0, var2)
				})
			})
		end
		local vector2 = Vector2.new(maxWidth, maxHeight)
		local t = {
			Color = p1.props.nameTextColor or theme.TextEmphasis.Color,
			Transparency = p1.props.nameTextTransparency or theme.TextEmphasis.Transparency
		}
		
		if hasVerifiedBadge then
			return roactModule.createElement(emojiTextLabelModule, {
				RichText = richText,
				maxSize = vector2,
				fluidSizing = fluidSizing,
				emoji = emojiModule.Verified,
				fontStyle = titleFontStyle,
				colorStyle = t,
				Text = name,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = layoutOrder
			})
		end
		local var3 = if titleIcon then titleIcon.ImageRectSize / imagesModule.ImagesResolutionScale else Vector2.new(0, 0)
		
		return roactModule.createElement(imageTextLabelModule, {
			padding = 4,
			imageProps = titleIcon and ({
				BackgroundTransparency = 1,
				Image = titleIcon,
				ImageColor3 = theme.IconEmphasis.Color,
				ImageTransparency = theme.IconEmphasis.Transparency,
				Size = UDim2.new(0, var3.X, 0, var3.Y),
				AnchorPoint = Vector2.new(0, 0),
				Position = UDim2.new(0, 0, 0, 0)
			} or nil),
			genericTextLabelProps = {
				fluidSizing = fluidSizing,
				fontStyle = titleFontStyle,
				colorStyle = t,
				Text = name,
				TextTruncate = Enum.TextTruncate.SplitWord,
				RichText = richText,
				TextXAlignment = var1
			},
			frameProps = { BackgroundTransparency = 1, LayoutOrder = layoutOrder },
			maxSize = vector2,
			useMaxHeight = useMaxHeight
		})
	end)
end

return itemTileName