local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CreateTreeWithProvidersFunction = require(Parent.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders

return function(p1, p2)
	-- upvalues: ReactModule (copy), FoundationModule (copy), CreateTreeWithProvidersFunction (copy)
	return ReactModule.createElement(FoundationModule.FoundationProvider, { device = "Phone", theme = "Dark" }, { Element = CreateTreeWithProvidersFunction(p1, p2) })
end