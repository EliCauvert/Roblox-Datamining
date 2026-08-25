local _ = require(script:FindFirstAncestor("Moments").Components.Feed.FeedTypes)

return function(p0, p1)
	p1 = p1 or {}
	local cloned = table.clone(p0)
	
	return {
		fetchAsync = function(_)
			-- upvalues: cloned (ref)
			return { nextCursor = nil, items = table.clone(cloned) }
		end,
		id = p1.id or "snapshot",
		recommendationSource = p1.recommendationSource
	}
end