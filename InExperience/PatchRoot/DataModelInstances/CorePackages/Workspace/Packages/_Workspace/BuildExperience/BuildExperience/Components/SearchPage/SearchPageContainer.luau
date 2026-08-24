local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local searchPageViewModule = require(script.Parent.SearchPageView)
local useSearchPageViewModelModule = require(script.Parent.useSearchPageViewModel)

return reactModule.forwardRef(function(p0, p1) --[[ line: 11 | named "SearchPageContainer" ]]
	-- upvalues: useSearchPageViewModelModule (ref), reactModule (ref), searchPageViewModule (ref)
	return reactModule.createElement(searchPageViewModule, useSearchPageViewModelModule(p0, p1))
end)