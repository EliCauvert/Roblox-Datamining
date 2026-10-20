local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local UseStyleModule = require(Parent.Core.Style.useStyle)

return function(Frame)
	-- upvalues: UseStyleModule (copy), ReactModule (copy)
	local HelperText = UseStyleModule().Tokens.Component.HelperText
	local Typography = HelperText.Base.Typography
	local ContentColor = if Frame.error then HelperText.Error.ContentColor else HelperText.Base.ContentColor
	
	return ReactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = Frame.text,
		TextTransparency = ContentColor.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = ContentColor.Color3,
		Font = Typography.Font,
		TextSize = Typography.FontSize,
		LineHeight = Typography.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	})
end