local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagSduiDividerThemeAwareStroke = require(parent.SharedFlags).FFlagSduiDividerThemeAwareStroke

return reactModule.memo(function(p0)
	-- upvalues: fFlagSduiDividerThemeAwareStroke (ref), useTokens (ref), reactModule (ref)
	local var1 = if fFlagSduiDividerThemeAwareStroke then useTokens() else nil
	local size = p0.size
	local layoutOrder = p0.layoutOrder
	local position = p0.position
	local anchorPoint = p0.anchorPoint
	local backgroundColor3 = p0.backgroundColor3
	local backgroundTransparency = p0.backgroundTransparency
	
	return reactModule.createElement("Frame", {
		Size = size or UDim2.new(1, 0, 0, 1),
		LayoutOrder = layoutOrder,
		Position = position,
		AnchorPoint = anchorPoint,
		BackgroundColor3 = if fFlagSduiDividerThemeAwareStroke then backgroundColor3 or var1.Color.Stroke.Default.Color3 else backgroundColor3 or Color3.new(1, 1, 1),
		BackgroundTransparency = if fFlagSduiDividerThemeAwareStroke then backgroundTransparency or var1.Color.Stroke.Default.Transparency else backgroundTransparency or 0.85,
		BorderSizePixel = 0,
		[reactModule.Tag] = "data-testid=--sdui-divider"
	})
end)