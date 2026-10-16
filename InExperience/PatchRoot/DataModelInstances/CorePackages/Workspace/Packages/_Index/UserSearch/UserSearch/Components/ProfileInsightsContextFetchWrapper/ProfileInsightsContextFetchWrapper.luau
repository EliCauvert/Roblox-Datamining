local UserSearch = script:FindFirstAncestor("UserSearch")
local _ = require(UserSearch.Parent.React)
local UsePaginatedProfileInsightsFetchModule = require(script.Parent.usePaginatedProfileInsightsFetch)
local _ = require(UserSearch.Common.LocalTypes)

return function(p1) --[[ Line: 17 ]]
	-- upvalues: UsePaginatedProfileInsightsFetchModule (copy)
	return p1.renderComponent(UsePaginatedProfileInsightsFetchModule({
		users = p1.users or {},
		searchKeyword = p1.searchParameters.searchKeyword
	}) or {})
end