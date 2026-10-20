local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local FoundationModule = require(Parent2.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local GetFontFromFontStyleModule = require(Parent1.Core.Text.GetFontFromFontStyle)
local ImagesModule = require(Parent1.App.ImageSet.Images)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local ItemTileEnumsModule = require(Parent.Enum.ItemTileEnums)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ItemTileStatus = RoactModule.PureComponent:extend("ItemTileStatus")
local _Vector2 = Vector2.new(50, 20)
local _Vector2_1 = Vector2.new(10, 6)
ItemTileStatus.validateProps = TModule.strictInterface({
	statusText = TModule.string,
	statusStyle = ItemTileEnumsModule.StatusStyle.isEnumValue
})

local function getStyle(Theme, StatusStyle)
	-- upvalues: ItemTileEnumsModule (copy)
	return if StatusStyle == ItemTileEnumsModule.StatusStyle.Info then {
		Background = Theme.SystemPrimaryDefault,
		Text = Theme.SystemPrimaryContent
	} elseif StatusStyle == ItemTileEnumsModule.StatusStyle.Alert then { Background = Theme.Alert, Text = Theme.TextEmphasis } else {
		Background = Theme.SystemPrimaryDefault,
		Text = Theme.SystemPrimaryContent
	}
end

function ItemTileStatus.render(p1)
	-- upvalues: WithStyleModule (copy), FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), GetTextSizeModule (copy), _Vector2 (copy), getStyle (copy), RoactModule (copy), ImageSetComponentModule (copy), ImagesModule (copy), _Vector2_1 (copy), NormalizeFontFaceFunction (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), FoundationFontFaceMigration (upval), GetFontFromFontStyleModule (upval), GetTextSizeModule (upval), _Vector2 (upval), getStyle (upval), RoactModule (upval), ImageSetComponentModule (upval), ImagesModule (upval), _Vector2_1 (upval), NormalizeFontFaceFunction (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Tokens = p2.Tokens
		local StatusText = p1.props.statusText
		local StatusStyle = p1.props.statusStyle
		local FontFromFontStyleModule = if FoundationFontFaceMigration then GetFontFromFontStyleModule(_Font.CaptionHeader) else _Font.CaptionHeader.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize
		local TextSizeModule = GetTextSizeModule(StatusText, ScaledBaseSize, FontFromFontStyleModule, _Vector2)
		local Style = getStyle(Theme, StatusStyle)
		
		return RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Image = ImagesModule["component_assets/circle_17"],
			ImageColor3 = Style.Background.Color,
			ImageTransparency = Style.Background.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Position = UDim2.new(0, Tokens.Size.Size_200, 0, Tokens.Size.Size_200),
			Size = UDim2.new(0, TextSizeModule.X + _Vector2_1.X, 0, TextSizeModule.Y + _Vector2_1.Y)
		}, {
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = if FoundationFontFaceMigration then nil else FontFromFontStyleModule,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(FontFromFontStyleModule) else nil,
				TextSize = ScaledBaseSize,
				Text = StatusText,
				TextColor3 = Style.Text.Color,
				TextTransparency = Style.Text.TextTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return ItemTileStatus