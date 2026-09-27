local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local libraryBrowserViewModule = require(script.Parent.LibraryBrowserView)
local useLibraryBrowserViewModelModule = require(script.Parent.useLibraryBrowserViewModel)

return function(p1)
	-- upvalues: useLibraryBrowserViewModelModule (ref), reactModule (ref), libraryBrowserViewModule (ref)
	return reactModule.createElement(libraryBrowserViewModule, useLibraryBrowserViewModelModule(p1))
end