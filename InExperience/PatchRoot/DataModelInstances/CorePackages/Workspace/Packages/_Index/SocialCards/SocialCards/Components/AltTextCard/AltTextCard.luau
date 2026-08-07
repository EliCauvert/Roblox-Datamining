local parent = script:FindFirstAncestor("SocialCards").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 13 | named "AltTextCard" ]]
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(foundationModule.Text, {
		TextWrapped = true,
		AutomaticSize = Enum.AutomaticSize.XY,
		fontStyle = {
			Font = var2.Typography.BodyMedium.Font,
			FontSize = var2.Typography.BodyMedium.FontSize
		},
		padding = {
			bottom = UDim.new(0, var2.Padding.Medium),
			left = UDim.new(0, var2.Padding.Medium),
			right = UDim.new(0, var2.Padding.Medium),
			top = UDim.new(0, var2.Padding.Medium)
		},
		Text = p0.altText,
		textStyle = {
			Color3 = var2.Color.Content.Muted.Color3,
			Transparency = var2.Color.Content.Muted.Transparency
		}
	})
end