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
local itemTileStatus = roactModule.PureComponent:extend("ItemTileStatus")
local vector2 = Vector2.new(50, 20)
local vector2_1 = Vector2.new(10, 6)
itemTileStatus.validateProps = tModule.strictInterface({
	statusText = tModule.string,
	statusStyle = itemTileEnumsModule.StatusStyle.isEnumValue
})

local function getStyle(p0, p1) --[[ line: 30 ]]
	-- upvalues: itemTileEnumsModule (ref)
	return if p1 == itemTileEnumsModule.StatusStyle.Info then {
		Background = p0.SystemPrimaryDefault,
		Text = p0.SystemPrimaryContent
	} elseif p1 == itemTileEnumsModule.StatusStyle.Alert then { Background = p0.Alert, Text = p0.TextEmphasis } else {
		Background = p0.SystemPrimaryDefault,
		Text = p0.SystemPrimaryContent
	}
end

function itemTileStatus.render(p2) --[[ line: 49 ]]
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), vector2 (ref), getStyle (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref), vector2_1 (ref)
	return withStyleModule(function(p3) --[[ line: 50 ]]
		-- upvalues: p2 (ref), getTextSizeModule (copy), vector2 (copy), getStyle (copy), roactModule (copy), imageSetComponentModule (copy), imagesModule (copy), vector2_1 (copy)
		local theme = p3.Theme
		local font = p3.Font
		local tokens = p3.Tokens
		local statusText = p2.props.statusText
		local statusStyle = p2.props.statusStyle
		local font_1 = font.CaptionHeader.Font
		local var11 = font.BaseSize * font.CaptionHeader.RelativeSize
		local var12 = getTextSizeModule(statusText, var11, font_1, vector2)
		local var13 = getStyle(theme, statusStyle)
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Image = imagesModule["component_assets/circle_17"],
			ImageColor3 = var13.Background.Color,
			ImageTransparency = var13.Background.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Position = UDim2.new(0, tokens.Global.Size_100, 0, tokens.Global.Size_100),
			Size = UDim2.new(0, var12.X + vector2_1.X, 0, var12.Y + vector2_1.Y)
		}, {
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = font_1,
				TextSize = var11,
				Text = statusText,
				TextColor3 = var13.Text.Color,
				TextTransparency = var13.Text.TextTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return itemTileStatus