local _ = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.Foundation)

return function(p1, p2: number)
	local BodyLarge = p1.Typography.BodyLarge
	
	return BodyLarge.FontSize + (p2 - 1) * BodyLarge.FontSize * BodyLarge.LineHeight
end