local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local ImagesModule = require(Parent1.App.ImageSet.Images)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local ItemTileEnumsModule = require(Parent.Enum.ItemTileEnums)
local ItemRestrictionStatus = RoactModule.PureComponent:extend("ItemRestrictionStatus")
local _Vector2 = Vector2.new(50, 20)
local _Vector2_1 = Vector2.new(8, 8)
ItemRestrictionStatus.validateProps = TModule.strictInterface({
	restrictionTypes = TModule.map(ItemTileEnumsModule.Restriction.isEnumValue, TModule.boolean),
	restrictionInfo = TModule.optional(TModule.table)
})

local function _(p1, p2): string
	-- upvalues: ItemTileEnumsModule (copy)
	local Text: string = if p1[ItemTileEnumsModule.Restriction.LimitedUnique] then "#" else ""
	
	if p1[ItemTileEnumsModule.Restriction.Collectible] then
		return "#"
	end
	if p2 and p2.limitedSerialNumber then
		Text ..= " " .. p2.limitedSerialNumber
	end
	return Text
end

local _ = function(p1)
	-- upvalues: ItemTileEnumsModule (copy), ImagesModule (copy)
	return if p1[ItemTileEnumsModule.Restriction.Collectible] then ImagesModule["icons/status/item/limited"] elseif p1[ItemTileEnumsModule.Restriction.Limited] or p1[ItemTileEnumsModule.Restriction.LimitedUnique] then ImagesModule["icons/status/item/limited"] else nil
end

function ItemRestrictionStatus.render(p1)
	-- upvalues: WithStyleModule (copy), ItemTileEnumsModule (copy), GetTextSizeModule (copy), _Vector2 (copy), ImagesModule (copy), _Vector2_1 (copy), RoactModule (copy), ImageSetComponentModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), ItemTileEnumsModule (upval), GetTextSizeModule (upval), _Vector2 (upval), ImagesModule (upval), _Vector2_1 (upval), RoactModule (upval), ImageSetComponentModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Tokens = p2.Tokens
		local RestrictionInfo = p1.props.restrictionInfo
		local RestrictionTypes = p1.props.restrictionTypes
		local Text: string = if RestrictionTypes[ItemTileEnumsModule.Restriction.LimitedUnique] then "#" else ""
		local Text1 = nil
		
		if RestrictionTypes[ItemTileEnumsModule.Restriction.Collectible] then
			Text1 = "#"
		else
			if RestrictionInfo and RestrictionInfo.limitedSerialNumber then
				Text ..= " " .. RestrictionInfo.limitedSerialNumber
			end
			Text1 = Text
		end
		local CaptionHeaderFont = _Font.CaptionHeader.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize
		local TextSizeModule = GetTextSizeModule(Text1, ScaledBaseSize, CaptionHeaderFont, _Vector2)
		local IconsStatusItemLimited = if RestrictionTypes[ItemTileEnumsModule.Restriction.Collectible] then ImagesModule["icons/status/item/limited"] elseif RestrictionTypes[ItemTileEnumsModule.Restriction.Limited] or RestrictionTypes[ItemTileEnumsModule.Restriction.LimitedUnique] then ImagesModule["icons/status/item/limited"] else nil
		local ImageRectSizeRatio = IconsStatusItemLimited and IconsStatusItemLimited.ImageRectSize / ImagesModule.ImagesResolutionScale or Vector2.new(0, 0)
		
		return RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 1),
			Image = ImagesModule["component_assets/circle_17"],
			ImageColor3 = Theme.UIDefault.Color,
			ImageTransparency = Theme.UIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Position = UDim2.new(0, Tokens.Global.Size_100, 1, -Tokens.Global.Size_100),
			Size = UDim2.new(0, ImageRectSizeRatio.X + TextSizeModule.X + _Vector2_1.X, 0, math.max(ImageRectSizeRatio.Y, TextSizeModule.Y) + _Vector2_1.Y)
		}, {
			Icon = IconsStatusItemLimited and RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = IconsStatusItemLimited,
				ImageColor3 = Theme.IconEmphasis.Color,
				ImageTransparency = Theme.IconEmphasis.Transparency,
				Position = UDim2.new(0, _Vector2_1.X / 2, 0.5, 0),
				Size = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y)
			}),
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = CaptionHeaderFont,
				TextSize = ScaledBaseSize,
				Text = Text1,
				TextColor3 = Theme.TextMuted.Color,
				TextTransparency = Theme.TextMuted.TextTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Position = UDim2.new(0, ImageRectSizeRatio.X, 0, 0),
				Size = UDim2.new(0, TextSizeModule.X + 10, 1, 0)
			})
		})
	end)
end

return ItemRestrictionStatus