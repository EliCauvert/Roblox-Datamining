local _ = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)

return {
	startNumber = function(p1)
		return if p1.kind == "OrderedList" then p1.markerStartNumber or 1 else nil
	end,
	bulletPrefix = function(p1): string
		return if (if p1.kind == "BulletList" then p1.marker else nil) == "*" then "* " else "- "
	end,
	orderedPrefix = function(p1): string
		return (tostring(p1))
	end
}