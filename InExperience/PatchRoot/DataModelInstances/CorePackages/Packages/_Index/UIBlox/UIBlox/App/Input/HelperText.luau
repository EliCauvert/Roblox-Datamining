local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local NormalizeFontFaceFunction = require(Parent1.Foundation).Utility.normalizeFontFace
local UseStyleModule = require(Parent.Core.Style.useStyle)

return function(Frame)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), NormalizeFontFaceFunction (copy)
	local UseStyleModuleResult = UseStyleModule()
	local CaptionSmall = UseStyleModuleResult.Tokens.Typography.CaptionSmall
	local Foreground = if Frame.error then UseStyleModuleResult.Tokens.Color.ActionAlert.Foreground else UseStyleModuleResult.Tokens.Color.Content.Default
	
	return ReactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = Frame.text,
		TextTransparency = Foreground.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = Foreground.Color3,
		FontFace = NormalizeFontFaceFunction(CaptionSmall.Font),
		TextSize = CaptionSmall.FontSize,
		LineHeight = CaptionSmall.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	})
end