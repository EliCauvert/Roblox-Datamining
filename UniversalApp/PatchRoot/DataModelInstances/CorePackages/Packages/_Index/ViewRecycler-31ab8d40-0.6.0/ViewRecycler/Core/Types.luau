local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Enums.DataSourceChangeType)

return {
	EMPTY_INDEX_RANGE = table.freeze({ firstIndex = 1, lastIndex = 0 }),
	INDEX_RANGE_KEYS = table.freeze({ "firstIndex", "lastIndex" }),
	ITEM_LAYOUT_KEYS = table.freeze({ "startOffset", "length" }),
	SCROLL_STATE_KEYS = table.freeze({
		"scrollOffset", "viewportLength", "contentLength", "distanceFromEnd",
		"atStart", "atEnd"
	}),
	isIndexRangeEmpty = function(p1)
		return p1.lastIndex < p1.firstIndex
	end,
	getIndexRangeLength = function(p1)
		return math.max(0, p1.lastIndex - p1.firstIndex + 1)
	end
}