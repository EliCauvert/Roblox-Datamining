local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.Parent.React)
local useStyleModule = require(parent_2.Core.Style.useStyle)
local _ = require(parent_1.Style.StyleTypes)
local _ = require(parent_1.Style.Fonts)
local footerFrameModule = require(parent.FooterFrame)

local function getStyleProps(p1, p2)
	p1 = p1 or {}
	
	return {
		cornerRadius = p1.cornerRadius,
		textColor = p1.textColor or p2.Theme.TextMuted,
		backgroundColor = p1.backgroundColor,
		textXAlignment = p1.textXAlignment or Enum.TextXAlignment.Left,
		textFont = p1.textFont or p2.Font.CaptionBody
	}
end

return function(p1)
	-- upvalues: useStyleModule (ref), getStyleProps (ref), reactModule (ref), footerFrameModule (ref)
	local var1 = useStyleModule()
	local font = var1.Font
	local var2 = getStyleProps(p1.styleProps, var1)
	local cornerRadius = var2.cornerRadius
	local textColor = var2.textColor
	local backgroundColor = var2.backgroundColor
	local textFont = var2.textFont
	
	return reactModule.createElement(footerFrameModule, p1, {
		Text = reactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if backgroundColor then backgroundColor.Color else nil,
			BackgroundTransparency = if backgroundColor then backgroundColor.Transparency else 1,
			Text = p1.text,
			TextXAlignment = var2.textXAlignment,
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