local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local libraryCategoryViewModule = require(script.Parent.LibraryCategoryView)
local useLibraryCategoryViewModelModule = require(script.Parent.useLibraryCategoryViewModel)

return function(p1)
	-- upvalues: useLibraryCategoryViewModelModule (ref), reactModule (ref), libraryCategoryViewModule (ref)
	return reactModule.createElement(libraryCategoryViewModule, useLibraryCategoryViewModelModule(p1))
end