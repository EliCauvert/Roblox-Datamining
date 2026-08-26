local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(parent.SduiCompat)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local cornerRadius = p1.cornerRadius or UDim.new(0, var1.Radius.Medium)
	
	return reactModule.createElement("Frame", {
		AnchorPoint = p1.anchorPoint,
		AutomaticSize = p1.automaticSize,
		BackgroundColor3 = (p1.backgroundStyle or var1.Color.Surface.Surface_200).Color3,
		BackgroundTransparency = p1.transparencyBinding or 0,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Size = p1.size or UDim2.fromScale(1, 0),
		ZIndex = p1.zIndex,
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, {
		UICorner = if if cornerRadius.Offset <= 0 then cornerRadius.Scale > 0 else true then reactModule.createElement("UICorner", { CornerRadius = cornerRadius }) else nil
	})
end)