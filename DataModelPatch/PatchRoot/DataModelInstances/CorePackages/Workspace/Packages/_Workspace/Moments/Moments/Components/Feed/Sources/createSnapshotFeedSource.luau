local _ = require(script:FindFirstAncestor("Moments").Components.Feed.FeedTypes)

return function(Tbl, p1)
	local P0 = p1 or {}
	local Copy = table.clone(Tbl)
	
	return {
		fetchAsync = function(_)
			-- upvalues: Copy (copy)
			return { nextCursor = nil, items = table.clone(Copy) }
		end,
		id = P0.id or "snapshot",
		recommendationSource = P0.recommendationSource
	}
end