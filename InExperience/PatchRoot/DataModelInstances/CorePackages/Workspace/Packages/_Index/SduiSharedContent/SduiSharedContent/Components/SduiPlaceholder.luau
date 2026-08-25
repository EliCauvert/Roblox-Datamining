local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(parent.SduiCompat)

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local cornerRadius = p0.cornerRadius or UDim.new(0, var1.Radius.Medium)
	
	return reactModule.createElement("Frame", {
		AnchorPoint = p0.anchorPoint,
		AutomaticSize = p0.automaticSize,
		BackgroundColor3 = (p0.backgroundStyle or var1.Color.Surface.Surface_200).Color3,
		BackgroundTransparency = p0.transparencyBinding or 0,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Size = p0.size or UDim2.fromScale(1, 0),
		ZIndex = p0.zIndex,
		[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil
	}, {
		UICorner = if if cornerRadius.Offset <= 0 then cornerRadius.Scale > 0 else true then reactModule.createElement("UICorner", { CornerRadius = cornerRadius }) else nil
	})
end)