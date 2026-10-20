local _ = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox)

return {
	getDefaultStyleProps = function(p1)
		return {
			borderRadius = UDim.new(0, p1.Tokens.Radius.Medium),
			contentGap = p1.Tokens.Size.Size_300,
			gutter = p1.Tokens.Size.Size_600,
			titleFont = p1.Font.Header1,
			titleTextColor = {
				Color = p1.Tokens.Color.Content.Emphasis.Color3,
				Transparency = p1.Tokens.Color.Content.Emphasis.Transparency
			}
		}
	end
}