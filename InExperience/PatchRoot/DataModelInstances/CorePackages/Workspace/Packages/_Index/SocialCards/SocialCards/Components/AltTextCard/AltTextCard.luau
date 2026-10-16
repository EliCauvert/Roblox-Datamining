local Parent = script:FindFirstAncestor("SocialCards").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 13 | Named "AltTextCard" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.Text, {
		TextWrapped = true,
		AutomaticSize = Enum.AutomaticSize.XY,
		fontStyle = {
			Font = UseTokensResult.Typography.BodyMedium.Font,
			FontSize = UseTokensResult.Typography.BodyMedium.FontSize
		},
		padding = {
			bottom = UDim.new(0, UseTokensResult.Padding.Medium),
			left = UDim.new(0, UseTokensResult.Padding.Medium),
			right = UDim.new(0, UseTokensResult.Padding.Medium),
			top = UDim.new(0, UseTokensResult.Padding.Medium)
		},
		Text = p1.altText,
		textStyle = {
			Color3 = UseTokensResult.Color.Content.Muted.Color3,
			Transparency = UseTokensResult.Color.Content.Muted.Transparency
		}
	})
end