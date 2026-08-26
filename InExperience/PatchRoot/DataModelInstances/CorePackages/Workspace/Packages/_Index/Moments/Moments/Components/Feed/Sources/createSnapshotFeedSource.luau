local _ = require(script:FindFirstAncestor("Moments").Components.Feed.FeedTypes)

return function(p1, p2)
	p2 = p2 or {}
	local cloned = table.clone(p1)
	
	return {
		fetchAsync = function(_)
			-- upvalues: cloned (ref)
			return { nextCursor = nil, items = table.clone(cloned) }
		end,
		id = p2.id or "snapshot",
		recommendationSource = p2.recommendationSource
	}
end