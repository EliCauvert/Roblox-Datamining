local _ = require(script.Parent.AXPagesTypes)

return {
	new = function(p1, p2, p3)
		return {
			_currentPage = p1,
			_cursor = p2,
			_fetchNextPage = p3,
			IsFinished = if p2 ~= nil then p2 == "" else true,
			GetCurrentPage = function(p4)
				return p4._currentPage
			end,
			AdvanceToNextPageAsync = function(p4)
				if p4.IsFinished then return end
				local var1 = p4._fetchNextPage(p4._cursor)
				p4._currentPage = var1.data
				p4._cursor = var1.nextPageCursor
				p4.IsFinished = if p4._cursor ~= nil then p4._cursor == "" else true
			end
		}
	end
}