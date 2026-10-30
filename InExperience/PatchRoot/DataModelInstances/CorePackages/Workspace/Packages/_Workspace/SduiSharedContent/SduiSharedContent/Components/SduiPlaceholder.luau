local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local _ = require(Parent.SduiCompat)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local CornerRadius = p1.cornerRadius or UDim.new(0, UseTokensResult.Radius.Medium)
	local IsOffsetAbove: boolean = CornerRadius.Offset > 0 or CornerRadius.Scale > 0
	
	return ReactModule.createElement("Frame", {
		AnchorPoint = p1.anchorPoint,
		AutomaticSize = p1.automaticSize,
		BackgroundColor3 = (p1.backgroundStyle or UseTokensResult.Color.Surface.Surface_200).Color3,
		BackgroundTransparency = p1.transparencyBinding or 0,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Size = p1.size or UDim2.fromScale(1, 0),
		ZIndex = p1.zIndex,
		[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, {
		UICorner = if IsOffsetAbove then ReactModule.createElement("UICorner", { CornerRadius = CornerRadius }) else nil
	})
end)