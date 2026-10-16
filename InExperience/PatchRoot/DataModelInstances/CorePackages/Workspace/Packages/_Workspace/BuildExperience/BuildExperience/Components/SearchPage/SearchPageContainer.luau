local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local SearchPageViewModule = require(script.Parent.SearchPageView)
local UseSearchPageViewModelModule = require(script.Parent.useSearchPageViewModel)

return ReactModule.forwardRef(function(p1, p2) --[[ Line: 11 | Named "SearchPageContainer" ]]
	-- upvalues: UseSearchPageViewModelModule (copy), ReactModule (copy), SearchPageViewModule (copy)
	return ReactModule.createElement(SearchPageViewModule, (UseSearchPageViewModelModule(p1, p2)))
end)