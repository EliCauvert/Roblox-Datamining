local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local view = foundationModule.View
local t = { Transparency = 1 }
local t_1 = { Transparency = 1 }

return reactModule.forwardRef(function(p0, p1) --[[ line: 32 | named "TabGroupTab" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), t (ref), text (ref), t_1 (ref)
	local var4 = useTokens()
	
	return reactModule.createElement(view, {
		ref = p1,
		onActivated = p0.onActivated,
		backgroundStyle = t,
		padding = p0.padding or Vector2.new(var4.Padding.Small, var4.Padding.Medium),
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p0.LayoutOrder
	}, {
		Text = reactModule.createElement(text, {
			Text = p0.text,
			textStyle = if p0.isActive then p0.activeTextStyle or var4.Color.Content.Emphasis else p0.textStyle or var4.Color.Content.Muted,
			fontStyle = p0.fontStyle or var4.Typography.TitleLarge,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = t_1
		})
	})
end)