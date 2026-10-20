local Parent = script:FindFirstAncestor("EditProfile").Parent
local CreateTreeWithProvidersFunction = require(Parent.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders
local ReactModule = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local MagicMock = require(Parent.LuaSocialLibrariesDeps).Mock.MagicMock
local MockPolicyProviderFunction = require(Parent.Dev.UnitTestHelpers).mockPolicyProvider

return function(p1, p2)
	-- upvalues: ReactModule (copy), RoactAppExperimentModule (copy), MagicMock (copy), MockPolicyProviderFunction (copy), CreateTreeWithProvidersFunction (copy)
	return ReactModule.createElement(RoactAppExperimentModule.Provider, { value = MagicMock.new() }, {
		Element = MockPolicyProviderFunction(CreateTreeWithProvidersFunction(p1, p2), p2.mockPolicy)
	})
end