local _ = require(script.Parent.AXPagesTypes)

return {
	new = function(p0, p1, p2) --[[ line: 5 ]]
		return {
			_currentPage = p0,
			_cursor = p1,
			_fetchNextPage = p2,
			IsFinished = if p1 ~= nil then p1 == "" else true,
			GetCurrentPage = function(p3) --[[ line: 12 ]]
				return p3._currentPage
			end,
			AdvanceToNextPageAsync = function(p4) --[[ line: 16 ]]
				if p4.IsFinished then return end
				local var0 = p4._fetchNextPage(p4._cursor)
				p4._currentPage = var0.data
				p4._cursor = var0.nextPageCursor
				p4.IsFinished = if p4._cursor ~= nil then p4._cursor == "" else true
			end
		}
	end
}