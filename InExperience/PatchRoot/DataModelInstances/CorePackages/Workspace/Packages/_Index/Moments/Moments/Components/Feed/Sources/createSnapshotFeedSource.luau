local _ = require(script:FindFirstAncestor("Moments").Components.Feed.FeedTypes)

return function(Tbl, p1) --[[ Line: 27 | Named "createSnapshotFeedSource" ]]
	local P0 = p1 or {}
	local Copy = table.clone(Tbl)
	
	return {
		fetchAsync = function(_) --[[ Line: 33 ]]
			-- upvalues: Copy (copy)
			return { nextCursor = nil, items = table.clone(Copy) }
		end,
		id = P0.id or "snapshot",
		recommendationSource = P0.recommendationSource
	}
end