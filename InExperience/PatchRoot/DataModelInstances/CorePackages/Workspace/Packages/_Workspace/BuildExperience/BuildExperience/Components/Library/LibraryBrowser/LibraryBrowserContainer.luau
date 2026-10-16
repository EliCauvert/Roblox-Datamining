local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local LibraryBrowserViewModule = require(script.Parent.LibraryBrowserView)
local UseLibraryBrowserViewModelModule = require(script.Parent.useLibraryBrowserViewModel)

return function(p1) --[[ Line: 11 | Named "LibraryBrowserContainer" ]]
	-- upvalues: UseLibraryBrowserViewModelModule (copy), ReactModule (copy), LibraryBrowserViewModule (copy)
	return ReactModule.createElement(LibraryBrowserViewModule, (UseLibraryBrowserViewModelModule(p1)))
end