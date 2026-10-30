local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FFlagSduiDividerThemeAwareStroke = require(Parent.SharedFlags).FFlagSduiDividerThemeAwareStroke

return ReactModule.memo(function(p1)
	-- upvalues: FFlagSduiDividerThemeAwareStroke (copy), UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = if FFlagSduiDividerThemeAwareStroke then UseTokensFunction() else nil
	local BackgroundColor3 = p1.backgroundColor3
	local BackgroundTransparency = p1.backgroundTransparency
	
	return ReactModule.createElement("Frame", {
		Size = p1.size or UDim2.new(1, 0, 0, 1),
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		BackgroundColor3 = if FFlagSduiDividerThemeAwareStroke then BackgroundColor3 or UseTokensResult.Color.Stroke.Default.Color3 else BackgroundColor3 or Color3.new(1, 1, 1),
		BackgroundTransparency = if FFlagSduiDividerThemeAwareStroke then BackgroundTransparency or UseTokensResult.Color.Stroke.Default.Transparency else BackgroundTransparency or 0.85,
		BorderSizePixel = 0,
		[ReactModule.Tag] = "data-testid=--sdui-divider"
	})
end)