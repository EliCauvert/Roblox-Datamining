local _ = require(script:FindFirstAncestor("Moments").Parent.Foundation)

return {
	AVATAR_SIZE = 30,
	BOTTOM_UI_MAX_SIZE = Vector2.new(600, 1e999),
	USERNAME_SHIMMER = Vector2.new(160, 16),
	getInfoBottomGap = function(p1, p2: number, p3: number)
		return if p2 > 0 then p1.Padding.Medium else math.max(p1.Padding.XLarge, p3)
	end
}