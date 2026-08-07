local _ = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox)

return {
	getDefaultStyleProps = function(p0) --[[ line: 19 ]]
		return {
			borderRadius = UDim.new(0, p0.Tokens.Radius.Medium),
			contentGap = p0.Tokens.Size.Size_300,
			gutter = p0.Tokens.Size.Size_600,
			titleFont = p0.Font.Header1,
			titleTextColor = {
				Color = p0.Tokens.Color.Content.Emphasis.Color3,
				Transparency = p0.Tokens.Color.Content.Emphasis.Transparency
			}
		}
	end
}