local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local imagesModule = require(parent_1.App.ImageSet.Images)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local itemTileEnumsModule = require(parent.Enum.ItemTileEnums)
local itemRestrictionStatus = roactModule.PureComponent:extend("ItemRestrictionStatus")
local vector2 = Vector2.new(50, 20)
local vector2_1 = Vector2.new(8, 8)
itemRestrictionStatus.validateProps = tModule.strictInterface({
	restrictionTypes = tModule.map(itemTileEnumsModule.Restriction.isEnumValue, tModule.boolean),
	restrictionInfo = tModule.optional(tModule.table)
})

local function _(p0, p1)
	-- upvalues: itemTileEnumsModule (ref)
	local var11 = if p0[itemTileEnumsModule.Restriction.LimitedUnique] then "#" else ""
	
	if p0[itemTileEnumsModule.Restriction.Collectible] then
		return "#"
	elseif p1 and p1.limitedSerialNumber then
		var11 ..= " " .. p1.limitedSerialNumber
	end
	return var11
end

local _ = function(p2)
	-- upvalues: itemTileEnumsModule (ref), imagesModule (ref)
	return if p2[itemTileEnumsModule.Restriction.Collectible] then imagesModule["icons/status/item/limited"] elseif p2[itemTileEnumsModule.Restriction.Limited] or p2[itemTileEnumsModule.Restriction.LimitedUnique] then imagesModule["icons/status/item/limited"] else nil
end

function itemRestrictionStatus.render(p3)
	-- upvalues: withStyleModule (ref), itemTileEnumsModule (ref), getTextSizeModule (ref), vector2 (ref), imagesModule (ref), vector2_1 (ref), roactModule (ref), imageSetComponentModule (ref), UIBloxConfigModule (ref)
	return withStyleModule(function(p4)
		-- upvalues: p3 (ref), itemTileEnumsModule (copy), getTextSizeModule (copy), vector2 (copy), imagesModule (copy), vector2_1 (copy), roactModule (copy), imageSetComponentModule (copy), UIBloxConfigModule (copy)
		local var13
		local theme = p4.Theme
		local font = p4.Font
		local tokens = p4.Tokens
		local restrictionInfo = p3.props.restrictionInfo
		local restrictionTypes = p3.props.restrictionTypes
		local var12 = if restrictionTypes[itemTileEnumsModule.Restriction.LimitedUnique] then "#" else ""
		
		if restrictionTypes[itemTileEnumsModule.Restriction.Collectible] then
			var13 = "#"
		elseif restrictionInfo and restrictionInfo.limitedSerialNumber then
			var12 ..= " " .. restrictionInfo.limitedSerialNumber
		end
		var13 = var12
		local font_1 = font.CaptionHeader.Font
		local var14 = font.BaseSize * font.CaptionHeader.RelativeSize
		local var15 = getTextSizeModule(var13, var14, font_1, vector2)
		local var16 = if restrictionTypes[itemTileEnumsModule.Restriction.Collectible] then imagesModule["icons/status/item/limited"] elseif restrictionTypes[itemTileEnumsModule.Restriction.Limited] or restrictionTypes[itemTileEnumsModule.Restriction.LimitedUnique] then imagesModule["icons/status/item/limited"] else nil
		local var17 = if var16 then var16.ImageRectSize / imagesModule.ImagesResolutionScale else Vector2.new(0, 0)
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 1),
			Image = imagesModule["component_assets/circle_17"],
			ImageColor3 = theme.UIDefault.Color,
			ImageTransparency = theme.UIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Position = UDim2.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100, 1, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then -tokens.Size.Size_200 else -tokens.Global.Size_100),
			Size = UDim2.new(0, var17.X + var15.X + vector2_1.X, 0, math.max(var17.Y, var15.Y) + vector2_1.Y)
		}, {
			Icon = var16 and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = var16,
				ImageColor3 = theme.IconEmphasis.Color,
				ImageTransparency = theme.IconEmphasis.Transparency,
				Position = UDim2.new(0, vector2_1.X / 2, 0.5, 0),
				Size = UDim2.new(0, var17.X, 0, var17.Y)
			}),
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = font_1,
				TextSize = var14,
				Text = var13,
				TextColor3 = theme.TextMuted.Color,
				TextTransparency = theme.TextMuted.TextTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Position = UDim2.new(0, var17.X, 0, 0),
				Size = UDim2.new(0, var15.X + 10, 1, 0)
			})
		})
	end)
end

return itemRestrictionStatus