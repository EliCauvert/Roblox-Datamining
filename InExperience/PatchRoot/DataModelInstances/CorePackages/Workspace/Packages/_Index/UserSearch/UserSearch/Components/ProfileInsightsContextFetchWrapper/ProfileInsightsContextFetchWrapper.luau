local userSearch = script:FindFirstAncestor("UserSearch")
local _ = require(userSearch.Parent.React)
local usePaginatedProfileInsightsFetchModule = require(script.Parent.usePaginatedProfileInsightsFetch)
local _ = require(userSearch.Common.LocalTypes)

return function(p1)
	-- upvalues: usePaginatedProfileInsightsFetchModule (ref)
	return p1.renderComponent(usePaginatedProfileInsightsFetchModule({
		users = p1.users or {},
		searchKeyword = p1.searchParameters.searchKeyword
	}) or {})
end