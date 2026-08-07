local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
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

local function _(p0, p1) --[[ line: 33 | named "getAdditionalText" ]]
	-- upvalues: itemTileEnumsModule (ref)
	local var10 = if p0[itemTileEnumsModule.Restriction.LimitedUnique] then "#" else ""
	
	if p0[itemTileEnumsModule.Restriction.Collectible] then
		return "#"
	elseif p1 and p1.limitedSerialNumber then
		var10 ..= " " .. p1.limitedSerialNumber
	end
	return var10
end

local _ = function(p2) --[[ line: 51 | named "getRestrictionIcon" ]]
	-- upvalues: itemTileEnumsModule (ref), imagesModule (ref)
	return if p2[itemTileEnumsModule.Restriction.Collectible] then imagesModule["icons/status/item/limited"] elseif p2[itemTileEnumsModule.Restriction.Limited] or p2[itemTileEnumsModule.Restriction.LimitedUnique] then imagesModule["icons/status/item/limited"] else nil
end

function itemRestrictionStatus.render(p3) --[[ line: 66 ]]
	-- upvalues: withStyleModule (ref), itemTileEnumsModule (ref), getTextSizeModule (ref), vector2 (ref), imagesModule (ref), vector2_1 (ref), roactModule (ref), imageSetComponentModule (ref)
	return withStyleModule(function(p4) --[[ line: 67 ]]
		-- upvalues: p3 (ref), itemTileEnumsModule (copy), getTextSizeModule (copy), vector2 (copy), imagesModule (copy), vector2_1 (copy), roactModule (copy), imageSetComponentModule (copy)
		local var12
		local theme = p4.Theme
		local font = p4.Font
		local tokens = p4.Tokens
		local restrictionInfo = p3.props.restrictionInfo
		local restrictionTypes = p3.props.restrictionTypes
		local var11 = if restrictionTypes[itemTileEnumsModule.Restriction.LimitedUnique] then "#" else ""
		
		if restrictionTypes[itemTileEnumsModule.Restriction.Collectible] then
			var12 = "#"
		elseif restrictionInfo and restrictionInfo.limitedSerialNumber then
			var11 ..= " " .. restrictionInfo.limitedSerialNumber
		end
		var12 = var11
		local font_1 = font.CaptionHeader.Font
		local var13 = font.BaseSize * font.CaptionHeader.RelativeSize
		local var14 = getTextSizeModule(var12, var13, font_1, vector2)
		local var15 = if restrictionTypes[itemTileEnumsModule.Restriction.Collectible] then imagesModule["icons/status/item/limited"] elseif restrictionTypes[itemTileEnumsModule.Restriction.Limited] or restrictionTypes[itemTileEnumsModule.Restriction.LimitedUnique] then imagesModule["icons/status/item/limited"] else nil
		local var16 = if var15 then var15.ImageRectSize / imagesModule.ImagesResolutionScale else Vector2.new(0, 0)
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 1),
			Image = imagesModule["component_assets/circle_17"],
			ImageColor3 = theme.UIDefault.Color,
			ImageTransparency = theme.UIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Position = UDim2.new(0, tokens.Global.Size_100, 1, -tokens.Global.Size_100),
			Size = UDim2.new(0, var16.X + var14.X + vector2_1.X, 0, math.max(var16.Y, var14.Y) + vector2_1.Y)
		}, {
			Icon = var15 and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = var15,
				ImageColor3 = theme.IconEmphasis.Color,
				ImageTransparency = theme.IconEmphasis.Transparency,
				Position = UDim2.new(0, vector2_1.X / 2, 0.5, 0),
				Size = UDim2.new(0, var16.X, 0, var16.Y)
			}),
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = font_1,
				TextSize = var13,
				Text = var12,
				TextColor3 = theme.TextMuted.Color,
				TextTransparency = theme.TextMuted.TextTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Position = UDim2.new(0, var16.X, 0, 0),
				Size = UDim2.new(0, var14.X + 10, 1, 0)
			})
		})
	end)
end

return itemRestrictionStatus