local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
local CreateTreeWithProvidersFunction = require(Parent.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders
local MockAnalyticsModule = require(script.Parent.mockAnalytics)
local AnalyticsModule = require(ProfileQRCode.Analytics)
local ReactModule = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local MagicMock = require(Parent.LuaSocialLibrariesDeps).Mock.MagicMock
local MockPolicyProviderFunction = require(Parent.Dev.UnitTestHelpers).mockPolicyProvider

return function(p1, p2)
	-- upvalues: MockAnalyticsModule (copy), JestGlobalsModule (copy), ReactModule (copy), AnalyticsModule (copy), RoactAppExperimentModule (copy), MagicMock (copy), MockPolicyProviderFunction (copy), CreateTreeWithProvidersFunction (copy)
	local MockAnalyticsModuleResult = MockAnalyticsModule({ uid = "123" }, JestGlobalsModule.jest)
	
	return ReactModule.createElement(AnalyticsModule.Context.Provider, {
		value = if p2.mockAnalytics then p2.mockAnalytics else MockAnalyticsModuleResult.value
	}, {
		ReactModule.createElement(RoactAppExperimentModule.Provider, { value = MagicMock.new() }, {
			Element = MockPolicyProviderFunction(CreateTreeWithProvidersFunction(p1, p2), p2.mockPolicy)
		})
	}), MockAnalyticsModuleResult
end