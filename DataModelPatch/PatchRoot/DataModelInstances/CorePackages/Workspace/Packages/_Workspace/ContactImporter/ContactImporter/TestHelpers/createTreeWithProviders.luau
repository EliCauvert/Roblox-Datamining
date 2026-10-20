local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local JestGlobalsModule = require(Parent1.Dev.JestGlobals)
local CreateTreeWithProvidersFunction = require(Parent1.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders
local DependenciesModule = require(Parent.dependencies)
local MockAnalyticsModule = require(Parent.TestHelpers.mockAnalytics)
local AnalyticsModule = require(Parent.Analytics)
local Roact = DependenciesModule.Roact
local React = DependenciesModule.React
local RoactExperimentProvider = DependenciesModule.RoactExperimentProvider
local MagicMock = require(Parent1.LuaSocialLibrariesDeps).Mock.MagicMock
local RoactNavigation = DependenciesModule.RoactNavigation
local RoactRoduxModule = require(Parent1.RoactRodux)
local RoduxModule = require(Parent1.Rodux)
local UniversalAppPolicy = require(Parent1.UniversalAppPolicy).UniversalAppPolicy
local NewResult = RoduxModule.Store.new(function()
	return {}
end, {}, { RoduxModule.thunkMiddleware })

return function(p1, p2)
	-- upvalues: MockAnalyticsModule (copy), JestGlobalsModule (copy), Roact (copy), RoactNavigation (copy), MagicMock (copy), UniversalAppPolicy (copy), RoactRoduxModule (copy), NewResult (copy), React (copy), RoactExperimentProvider (copy), AnalyticsModule (copy), CreateTreeWithProvidersFunction (copy)
	local MockAnalyticsModuleResult = MockAnalyticsModule({ uid = "123" }, JestGlobalsModule.jest)
	
	return Roact.createElement(RoactNavigation.Provider, { value = p2.navigation or MagicMock.new() }, {
		policyProvider = Roact.createElement(UniversalAppPolicy.Provider, {
			policy = {
				function()
					-- upvalues: p2 (copy)
					return {
						getShouldHideContactImporterUpsell = function()
							-- upvalues: p2 (upval)
							return p2.policy or false
						end,
						getContactImporterEnabled = function()
							-- upvalues: p2 (upval)
							return p2.policy or false
						end,
						getContactsToastEnabled = function()
							-- upvalues: p2 (upval)
							return p2.policy or false
						end,
						getUpsellVoiceForPhoneVerification = function()
							-- upvalues: p2 (upval)
							return p2.policy or false
						end,
						getWebViewSupport = function()
							-- upvalues: p2 (upval)
							return p2.policy or false
						end
					}
				end
			}
		}, {
			storeProvider = Roact.createElement(RoactRoduxModule.StoreProvider, { store = p2.store or NewResult }, {
				React.createElement(RoactExperimentProvider, {
					value = if p2.experiment then p2.experiment else MagicMock.new()
				}, {
					Element = Roact.createElement(AnalyticsModule.Context.Provider, {
						value = if p2.mockAnalytics then p2.mockAnalytics else MockAnalyticsModuleResult.value
					}, { Element = CreateTreeWithProvidersFunction(p1, p2) })
				})
			})
		})
	}), MockAnalyticsModuleResult
end