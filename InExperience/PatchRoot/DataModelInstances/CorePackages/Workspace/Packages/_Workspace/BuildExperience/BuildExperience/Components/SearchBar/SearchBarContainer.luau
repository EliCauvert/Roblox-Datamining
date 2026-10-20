local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local SearchBarViewModule = require(script.Parent.SearchBarView)
local UseSearchBarViewModelModule = require(script.Parent.useSearchBarViewModel)

return function(p1)
	-- upvalues: UseSearchBarViewModelModule (copy), ReactModule (copy), SearchBarViewModule (copy)
	return ReactModule.createElement(SearchBarViewModule, (UseSearchBarViewModelModule(p1)))
end