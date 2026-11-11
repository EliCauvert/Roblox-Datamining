local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local ReactTestingLibraryModule = require(Parent.Dev.ReactTestingLibrary)
local FoundationProvider = require(Parent.Foundation).FoundationProvider

return function(p1)
	-- upvalues: ReactTestingLibraryModule (copy), ReactModule (copy), FoundationProvider (copy)
	return ReactTestingLibraryModule.render(ReactModule.createElement(FoundationProvider, { theme = "Dark" }, p1))
end