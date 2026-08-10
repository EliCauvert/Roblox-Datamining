local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local reactTestingLibraryModule = require(parent.Dev.ReactTestingLibrary)
local foundationProvider = require(parent.Foundation).FoundationProvider

return function(p0) --[[ line: 9 | named "renderWithProviders" ]]
	-- upvalues: reactTestingLibraryModule (ref), reactModule (ref), foundationProvider (ref)
	return reactTestingLibraryModule.render(reactModule.createElement(foundationProvider, { colorMode = "Dark" }, p0))
end