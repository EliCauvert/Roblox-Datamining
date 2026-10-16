local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local LibraryDetailViewModule = require(script.Parent.LibraryDetailView)
local UseLibraryDetailViewModelModule = require(script.Parent.useLibraryDetailViewModel)

return function(p1) --[[ Line: 9 | Named "LibraryDetailContainer" ]]
	-- upvalues: UseLibraryDetailViewModelModule (copy), ReactModule (copy), LibraryDetailViewModule (copy)
	return ReactModule.createElement(LibraryDetailViewModule, (UseLibraryDetailViewModelModule(p1)))
end