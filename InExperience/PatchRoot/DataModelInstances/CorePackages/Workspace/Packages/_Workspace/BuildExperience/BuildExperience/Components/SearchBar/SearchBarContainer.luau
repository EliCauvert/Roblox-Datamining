local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local searchBarViewModule = require(script.Parent.SearchBarView)
local useSearchBarViewModelModule = require(script.Parent.useSearchBarViewModel)

return function(p0) --[[ line: 11 | named "SearchBarContainer" ]]
	-- upvalues: useSearchBarViewModelModule (ref), reactModule (ref), searchBarViewModule (ref)
	return reactModule.createElement(searchBarViewModule, useSearchBarViewModelModule(p0))
end