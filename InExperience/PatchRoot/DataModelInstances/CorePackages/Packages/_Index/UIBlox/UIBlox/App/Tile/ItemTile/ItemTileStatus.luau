local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local foundationModule = require(parent_2.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local withStyleModule = require(parent_1.Core.Style.withStyle)
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local getFontFromFontStyleModule = require(parent_1.Core.Text.GetFontFromFontStyle)
local imagesModule = require(parent_1.App.ImageSet.Images)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local itemTileEnumsModule = require(parent.Enum.ItemTileEnums)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
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
	-- upvalues: withStyleModule (ref), foundationFontFaceMigration (ref), getFontFromFontStyleModule (ref), getTextSizeModule (ref), vector2 (ref), getStyle (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref), UIBloxConfigModule (ref), vector2_1 (ref), normalizeFontFace (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), foundationFontFaceMigration (copy), getFontFromFontStyleModule (copy), getTextSizeModule (copy), vector2 (copy), getStyle (copy), roactModule (copy), imageSetComponentModule (copy), imagesModule (copy), UIBloxConfigModule (copy), vector2_1 (copy), normalizeFontFace (copy)
		local theme = p2.Theme
		local font = p2.Font
		local tokens = p2.Tokens
		local statusText = p1.props.statusText
		local statusStyle = p1.props.statusStyle
		local var1 = if foundationFontFaceMigration then getFontFromFontStyleModule(font.CaptionHeader) else font.CaptionHeader.Font
		local var2 = font.BaseSize * font.CaptionHeader.RelativeSize
		local var3 = getTextSizeModule(statusText, var2, var1, vector2)
		local var4 = getStyle(theme, statusStyle)
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Image = imagesModule["component_assets/circle_17"],
			ImageColor3 = var4.Background.Color,
			ImageTransparency = var4.Background.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Position = UDim2.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100, 0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100),
			Size = UDim2.new(0, var3.X + vector2_1.X, 0, var3.Y + vector2_1.Y)
		}, {
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = if foundationFontFaceMigration then nil else var1,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(var1) else nil,
				TextSize = var2,
				Text = statusText,
				TextColor3 = var4.Text.Color,
				TextTransparency = var4.Text.TextTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return itemTileStatus