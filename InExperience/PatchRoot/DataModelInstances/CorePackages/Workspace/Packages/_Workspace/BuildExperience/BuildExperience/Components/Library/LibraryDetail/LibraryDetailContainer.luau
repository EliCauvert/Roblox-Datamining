local libraryDetailViewModule = require(script.Parent.LibraryDetailView)
local useLibraryDetailViewModelModule = require(script.Parent.useLibraryDetailViewModel)

return function(p1)
	-- upvalues: useLibraryDetailViewModelModule (ref), libraryDetailViewModule (ref)
	return libraryDetailViewModule(useLibraryDetailViewModelModule(p1))
end