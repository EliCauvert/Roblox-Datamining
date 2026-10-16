local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local SearchResultsViewModule = require(script.Parent.SearchResultsView)
local UseSearchResultsViewModelModule = require(script.Parent.useSearchResultsViewModel)

return function(p1) --[[ Line: 10 | Named "SearchResultsContainer" ]]
	-- upvalues: UseSearchResultsViewModelModule (copy), ReactModule (copy), SearchResultsViewModule (copy)
	return ReactModule.createElement(SearchResultsViewModule, (UseSearchResultsViewModelModule(p1)))
end