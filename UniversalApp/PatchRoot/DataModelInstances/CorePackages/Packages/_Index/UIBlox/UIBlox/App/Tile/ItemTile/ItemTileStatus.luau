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
local itemTileStatus = roactModule.PureComponent:extend("ItemTileStatus")
local vector2 = Vector2.new(50, 20)
local vector2_1 = Vector2.new(10, 6)
itemTileStatus.validateProps = tModule.strictInterface({
	statusText = tModule.string,
	statusStyle = itemTileEnumsModule.StatusStyle.isEnumValue
})

local function getStyle(p1, p2)
	-- upvalues: itemTileEnumsModule (ref)
	return if p2 == itemTileEnumsModule.StatusStyle.Info then {
		Background = p1.SystemPrimaryDefault,
		Text = p1.SystemPrimaryContent
	} elseif p2 == itemTileEnumsModule.StatusStyle.Alert then { Background = p1.Alert, Text = p1.TextEmphasis } else {
		Background = p1.SystemPrimaryDefault,
		Text = p1.SystemPrimaryContent
	}
end

function itemTileStatus.render(p1)
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), vector2 (ref), getStyle (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref), UIBloxConfigModule (ref), vector2_1 (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), getTextSizeModule (copy), vector2 (copy), getStyle (copy), roactModule (copy), imageSetComponentModule (copy), imagesModule (copy), UIBloxConfigModule (copy), vector2_1 (copy)
		local theme = p2.Theme
		local font = p2.Font
		local tokens = p2.Tokens
		local statusText = p1.props.statusText
		local statusStyle = p1.props.statusStyle
		local font_1 = font.CaptionHeader.Font
		local var1 = font.BaseSize * font.CaptionHeader.RelativeSize
		local var2 = getTextSizeModule(statusText, var1, font_1, vector2)
		local var3 = getStyle(theme, statusStyle)
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Image = imagesModule["component_assets/circle_17"],
			ImageColor3 = var3.Background.Color,
			ImageTransparency = var3.Background.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Position = UDim2.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100, 0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100),
			Size = UDim2.new(0, var2.X + vector2_1.X, 0, var2.Y + vector2_1.Y)
		}, {
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = font_1,
				TextSize = var1,
				Text = statusText,
				TextColor3 = var3.Text.Color,
				TextTransparency = var3.Text.TextTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return itemTileStatus