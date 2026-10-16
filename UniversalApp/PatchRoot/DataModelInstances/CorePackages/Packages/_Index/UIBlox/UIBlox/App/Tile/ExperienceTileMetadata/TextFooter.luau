local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local ReactModule = require(Parent3.React)
local FoundationModule = require(Parent3.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseStyleModule = require(Parent2.Core.Style.useStyle)
local _ = require(Parent1.Style.StyleTypes)
local _ = require(Parent1.Style.Fonts)
local FooterFrameModule = require(Parent.FooterFrame)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

local function getStyleProps(StyleProps, p1) --[[ Line: 38 ]]
	local StyleProps1 = StyleProps or {}
	
	return {
		cornerRadius = StyleProps1.cornerRadius,
		textColor = StyleProps1.textColor or p1.Theme.TextMuted,
		backgroundColor = StyleProps1.backgroundColor,
		textXAlignment = StyleProps1.textXAlignment or Enum.TextXAlignment.Left,
		textFont = StyleProps1.textFont or p1.Font.CaptionBody
	}
end

return function(p1) --[[ Line: 49 | Named "TextFooter" ]]
	-- upvalues: UseStyleModule (copy), getStyleProps (copy), ReactModule (copy), FooterFrameModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseStyleModuleResult = UseStyleModule()
	local UseStyleModuleResultFont = UseStyleModuleResult.Font
	local StyleProps = getStyleProps(p1.styleProps, UseStyleModuleResult)
	local CornerRadius = StyleProps.cornerRadius
	local TextColor = StyleProps.textColor
	local BackgroundColor = StyleProps.backgroundColor
	local TextFont = StyleProps.textFont
	
	return ReactModule.createElement(FooterFrameModule, p1, {
		Text = ReactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if BackgroundColor then BackgroundColor.Color else nil,
			BackgroundTransparency = if BackgroundColor then BackgroundColor.Transparency else 1,
			Text = p1.text,
			TextXAlignment = StyleProps.textXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			Font = if FoundationFontFaceMigration then nil else TextFont.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TextFont.Font) else nil,
			TextSize = UseStyleModuleResultFont.BaseSize * TextFont.RelativeSize,
			TextColor3 = TextColor.Color,
			TextTransparency = TextColor.Transparency,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UICorner = if CornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) }) else nil
		})
	})
end