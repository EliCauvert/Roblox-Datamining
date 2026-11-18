local Parent = script:FindFirstAncestor("SponsoredTiles").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace

return function(p1)
	-- upvalues: UseTokensFunction (copy), NormalizeFontFaceFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local CaptionSmall = UseTokensResult.Typography.CaptionSmall
	local Size400: number = UseTokensResult.Size.Size_400
	local NormalizeFontFaceResult = NormalizeFontFaceFunction(CaptionSmall.Font)
	
	return ReactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, Size400),
		LayoutOrder = p1.layoutOrder,
		Text = p1.text,
		TextSize = CaptionSmall.FontSize,
		LineHeight = Size400 / CaptionSmall.FontSize,
		FontFace = Font.new(NormalizeFontFaceResult.Family, Enum.FontWeight.Regular, NormalizeFontFaceResult.Style),
		TextColor3 = p1.textColor or UseTokensResult.DarkMode.Content.Muted.Color3,
		TextXAlignment = p1.textXAlignment or Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.SplitWord
	}, {
		UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.maxWidth or 1e999, Size400 * 2) })
	})
end