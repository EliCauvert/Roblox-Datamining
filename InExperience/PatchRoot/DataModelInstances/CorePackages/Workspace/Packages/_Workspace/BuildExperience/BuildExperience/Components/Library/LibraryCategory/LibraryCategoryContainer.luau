local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local LibraryCategoryViewModule = require(script.Parent.LibraryCategoryView)
local UseLibraryCategoryViewModelModule = require(script.Parent.useLibraryCategoryViewModel)

return function(p1)
	-- upvalues: UseLibraryCategoryViewModelModule (copy), ReactModule (copy), LibraryCategoryViewModule (copy)
	return ReactModule.createElement(LibraryCategoryViewModule, (UseLibraryCategoryViewModelModule(p1)))
end