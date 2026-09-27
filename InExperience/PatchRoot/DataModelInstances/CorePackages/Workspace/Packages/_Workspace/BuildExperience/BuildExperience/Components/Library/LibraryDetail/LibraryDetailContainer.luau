local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local libraryDetailViewModule = require(script.Parent.LibraryDetailView)
local useLibraryDetailViewModelModule = require(script.Parent.useLibraryDetailViewModel)

return function(p1)
	-- upvalues: useLibraryDetailViewModelModule (ref), reactModule (ref), libraryDetailViewModule (ref)
	return reactModule.createElement(libraryDetailViewModule, useLibraryDetailViewModelModule(p1))
end