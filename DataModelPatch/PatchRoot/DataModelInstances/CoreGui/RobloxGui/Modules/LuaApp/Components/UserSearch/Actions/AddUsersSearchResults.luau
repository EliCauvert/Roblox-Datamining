local _ = require(script.Parent.Parent.Models.UserSearchEntry)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		keyword = p1.keyword,
		searchUuid = p1.searchUuid,
		nextPageCursor = p1.nextPageCursor,
		entries = p1.entries,
		curPageCursor = p1.curPageCursor,
		paginationMethod = p1.paginationMethod
	}
end)