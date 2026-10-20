local _ = require(script.Parent.AXPagesTypes)

return {
	new = function(_currentPage, _cursor, _fetchNextPage)
		return {
			_currentPage = _currentPage,
			_cursor = _cursor,
			_fetchNextPage = _fetchNextPage,
			IsFinished = _cursor == nil or _cursor == "",
			GetCurrentPage = function(p1)
				return p1._currentPage
			end,
			AdvanceToNextPageAsync = function(Pages)
				if not Pages.IsFinished then
					local NextPage = Pages._fetchNextPage(Pages._cursor)
					Pages._currentPage = NextPage.data
					Pages._cursor = NextPage.nextPageCursor
					Pages.IsFinished = Pages._cursor == nil or Pages._cursor == ""
					
					return
				end
			end
		}
	end
}