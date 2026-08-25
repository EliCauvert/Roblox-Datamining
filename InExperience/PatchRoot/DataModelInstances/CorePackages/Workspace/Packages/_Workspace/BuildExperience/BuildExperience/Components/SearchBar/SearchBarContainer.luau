local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local searchBarViewModule = require(script.Parent.SearchBarView)
local useSearchBarViewModelModule = require(script.Parent.useSearchBarViewModel)

return function(p0)
	-- upvalues: useSearchBarViewModelModule (ref), reactModule (ref), searchBarViewModule (ref)
	return reactModule.createElement(searchBarViewModule, useSearchBarViewModelModule(p0))
end