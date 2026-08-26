local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local searchPageViewModule = require(script.Parent.SearchPageView)
local useSearchPageViewModelModule = require(script.Parent.useSearchPageViewModel)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSearchPageViewModelModule (ref), reactModule (ref), searchPageViewModule (ref)
	return reactModule.createElement(searchPageViewModule, useSearchPageViewModelModule(p1, p2))
end)