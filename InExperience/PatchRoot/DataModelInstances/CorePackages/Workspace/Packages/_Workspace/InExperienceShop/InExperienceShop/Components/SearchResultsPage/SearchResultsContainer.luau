local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local searchResultsViewModule = require(script.Parent.SearchResultsView)
local useSearchResultsViewModelModule = require(script.Parent.useSearchResultsViewModel)

return function(p0)
	-- upvalues: useSearchResultsViewModelModule (ref), reactModule (ref), searchResultsViewModule (ref)
	return reactModule.createElement(searchResultsViewModule, useSearchResultsViewModelModule(p0))
end