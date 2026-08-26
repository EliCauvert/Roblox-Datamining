local parent = script:FindFirstAncestor("VirtualEvents").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local useTokens = require(parent.Foundation).Hooks.useTokens
local footerCornerButtonStyle = require(parent.GameTile).FooterCornerButtonStyle

return function(p1)
	-- upvalues: useDesignTokens (ref), useTokens (ref), useLocalization (ref), footerCornerButtonStyle (ref), reactModule (ref)
	local var1 = useDesignTokens()
	local var2 = useTokens()
	local var3 = useLocalization({
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		joinEvent = "Feature.VirtualEvents.JoinEvent"
	})
	local color3 = var1.Color.ActionEmphasis.Background.Color3
	local color3_1 = var1.Color.ActionEmphasis.Foreground.Color3
	local joinEvent = var3.joinEvent
	
	if p1.buttonStyle == footerCornerButtonStyle.Follow then
		color3 = var2.Color.ActionSubEmphasis.Background.Color3
		color3_1 = var2.Color.ActionSubEmphasis.Foreground.Color3
		joinEvent = var3.notifyMe
	elseif p1.buttonStyle == footerCornerButtonStyle.Following then
		color3_1 = var2.Color.ActionStandard.Foreground.Color3
		joinEvent = var3.unfollowEvent
	end
	local var4 = p1.buttonStyle == footerCornerButtonStyle.Following
	local var5 = if p1.disabled then 0.5 else 0
	
	return reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 0, var1.Size.Size_700),
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		TextSize = var1.Size.Size_350,
		Font = var1.Typography.HeadingSmall.Font,
		BackgroundColor3 = color3,
		TextColor3 = color3_1,
		AutoButtonColor = false,
		Text = joinEvent,
		BackgroundTransparency = if var4 then 1 else var5,
		TextTransparency = var5,
		[reactModule.Event.Activated] = p1.onActivated
	}, {
		EventButtonCorners = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Size.Size_200) }),
		OutlineFrame = if var4 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -2, 1, -2),
			Position = UDim2.new(0, 1, 0, 1)
		}, {
			OutlineCorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Size.Size_200 - 2) }),
			OutlineStroke = reactModule.createElement("UIStroke", { Thickness = 1, Color = color3_1, Transparency = var5 })
		}) else nil
	})
end