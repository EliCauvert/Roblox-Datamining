local parent = script:FindFirstAncestor("SocialCards").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(foundationModule.Text, {
		TextWrapped = true,
		AutomaticSize = Enum.AutomaticSize.XY,
		fontStyle = {
			Font = var1.Typography.BodyMedium.Font,
			FontSize = var1.Typography.BodyMedium.FontSize
		},
		padding = {
			bottom = UDim.new(0, var1.Padding.Medium),
			left = UDim.new(0, var1.Padding.Medium),
			right = UDim.new(0, var1.Padding.Medium),
			top = UDim.new(0, var1.Padding.Medium)
		},
		Text = p1.altText,
		textStyle = {
			Color3 = var1.Color.Content.Muted.Color3,
			Transparency = var1.Color.Content.Muted.Transparency
		}
	})
end