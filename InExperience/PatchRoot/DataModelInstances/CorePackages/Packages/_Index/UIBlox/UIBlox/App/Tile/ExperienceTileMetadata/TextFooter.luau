local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.Parent.React)
local useStyleModule = require(parent_2.Core.Style.useStyle)
local _ = require(parent_1.Style.StyleTypes)
local _ = require(parent_1.Style.Fonts)
local footerFrameModule = require(parent.FooterFrame)

local function getStyleProps(p0, p1)
	p0 = p0 or {}
	
	return {
		cornerRadius = p0.cornerRadius,
		textColor = p0.textColor or p1.Theme.TextMuted,
		backgroundColor = p0.backgroundColor,
		textXAlignment = p0.textXAlignment or Enum.TextXAlignment.Left,
		textFont = p0.textFont or p1.Font.CaptionBody
	}
end

return function(p2)
	-- upvalues: useStyleModule (ref), getStyleProps (ref), reactModule (ref), footerFrameModule (ref)
	local var5 = useStyleModule()
	local font = var5.Font
	local var6 = getStyleProps(p2.styleProps, var5)
	local cornerRadius = var6.cornerRadius
	local textColor = var6.textColor
	local backgroundColor = var6.backgroundColor
	local textFont = var6.textFont
	
	return reactModule.createElement(footerFrameModule, p2, {
		Text = reactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if backgroundColor then backgroundColor.Color else nil,
			BackgroundTransparency = if backgroundColor then backgroundColor.Transparency else 1,
			Text = p2.text,
			TextXAlignment = var6.textXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			Font = textFont.Font,
			TextSize = font.BaseSize * textFont.RelativeSize,
			TextColor3 = textColor.Color,
			TextTransparency = textColor.Transparency,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UICorner = if cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) }) else nil
		})
	})
end