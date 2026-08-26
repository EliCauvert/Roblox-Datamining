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

local function _(p1, p2)
	-- upvalues: itemTileEnumsModule (ref)
	local var1 = if p1[itemTileEnumsModule.Restriction.LimitedUnique] then "#" else ""
	
	if p1[itemTileEnumsModule.Restriction.Collectible] then
		return "#"
	elseif p2 and p2.limitedSerialNumber then
		var1 ..= " " .. p1.limitedSerialNumber
	end
	return var1
end

local _ = function(p1)
	-- upvalues: itemTileEnumsModule (ref), imagesModule (ref)
	return if p1[itemTileEnumsModule.Restriction.Collectible] then imagesModule["icons/status/item/limited"] elseif p1[itemTileEnumsModule.Restriction.Limited] or p1[itemTileEnumsModule.Restriction.LimitedUnique] then imagesModule["icons/status/item/limited"] else nil
end

function itemRestrictionStatus.render(p1)
	-- upvalues: withStyleModule (ref), itemTileEnumsModule (ref), getTextSizeModule (ref), vector2 (ref), imagesModule (ref), vector2_1 (ref), roactModule (ref), imageSetComponentModule (ref), UIBloxConfigModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), itemTileEnumsModule (copy), getTextSizeModule (copy), vector2 (copy), imagesModule (copy), vector2_1 (copy), roactModule (copy), imageSetComponentModule (copy), UIBloxConfigModule (copy)
		local var1
		local theme = p2.Theme
		local font = p2.Font
		local tokens = p2.Tokens
		local restrictionInfo = p1.props.restrictionInfo
		local restrictionTypes = p1.props.restrictionTypes
		local var2 = if restrictionTypes[itemTileEnumsModule.Restriction.LimitedUnique] then "#" else ""
		
		if restrictionTypes[itemTileEnumsModule.Restriction.Collectible] then
			var1 = "#"
		elseif restrictionInfo and restrictionInfo.limitedSerialNumber then
			var2 ..= " " .. restrictionInfo.limitedSerialNumber
		end
		var1 = var2
		local font_1 = font.CaptionHeader.Font
		local var3 = font.BaseSize * font.CaptionHeader.RelativeSize
		local var4 = getTextSizeModule(var1, var3, font_1, vector2)
		local var5 = if restrictionTypes[itemTileEnumsModule.Restriction.Collectible] then imagesModule["icons/status/item/limited"] elseif restrictionTypes[itemTileEnumsModule.Restriction.Limited] or restrictionTypes[itemTileEnumsModule.Restriction.LimitedUnique] then imagesModule["icons/status/item/limited"] else nil
		local var6 = if var5 then var5.ImageRectSize / imagesModule.ImagesResolutionScale else Vector2.new(0, 0)
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 1),
			Image = imagesModule["component_assets/circle_17"],
			ImageColor3 = theme.UIDefault.Color,
			ImageTransparency = theme.UIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Position = UDim2.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100, 1, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then -tokens.Size.Size_200 else -tokens.Global.Size_100),
			Size = UDim2.new(0, var6.X + var4.X + vector2_1.X, 0, math.max(var6.Y, var4.Y) + vector2_1.Y)
		}, {
			Icon = var5 and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = var5,
				ImageColor3 = theme.IconEmphasis.Color,
				ImageTransparency = theme.IconEmphasis.Transparency,
				Position = UDim2.new(0, vector2_1.X / 2, 0.5, 0),
				Size = UDim2.new(0, var6.X, 0, var6.Y)
			}),
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = font_1,
				TextSize = var3,
				Text = var1,
				TextColor3 = theme.TextMuted.Color,
				TextTransparency = theme.TextMuted.TextTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Position = UDim2.new(0, var6.X, 0, 0),
				Size = UDim2.new(0, var4.X + 10, 1, 0)
			})
		})
	end)
end

return itemRestrictionStatus