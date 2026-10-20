local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local AppFeaturePolicies = require(Parent1.UniversalAppPolicy).AppFeaturePolicies
local DashModule = require(Parent1.Dash)
local ReactModule = require(Parent1.React)
local RoactAppPolicy = require(Parent1.UniversalAppPolicy).RoactAppPolicy
local RoactNavigationModule = require(Parent1.RoactNavigation)
local RoactRoduxModule = require(Parent1.RoactRodux)
local UnitTestHelpersModule = require(Parent1.Dev.UnitTestHelpers)
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local Mock = require(Parent1.LuaSocialLibrariesDeps).Mock
local CreateMockNavigationModule = require(Parent.TestUtils.createMockNavigation)
local CreateMockStoreModule = require(Parent.TestUtils.createMockStore)
local FeedContextModule = require(Parent.App.FeedContext)
local config = {
	navigateBack = DashModule.noop,
	navigateToReportPage = DashModule.noop
}
local config1 = { EligibleForExternalContentSharing = true }

return function(p1, p2)
	-- upvalues: Mock (copy), config (copy), CreateMockNavigationModule (copy), config1 (copy), CreateMockStoreModule (copy), DashModule (copy), ReactModule (copy), RoactRoduxModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), FeedContextModule (copy), RoactNavigationModule (copy), LocalizationProvider (copy), UnitTestHelpersModule (copy)
	local Localization = Mock.MagicMock.new({ name = "Localization" })
	
	function Localization:Format(p3, _)
		return p3
	end
	
	local JoinResult = config
	local MockNavigationModule = CreateMockNavigationModule()
	local PolicyData = config1
	local MockStoreModule = CreateMockStoreModule()
	local ShouldMockStyleProvider = true
	
	if p2 then
		if p2.context then
			JoinResult = DashModule.join(JoinResult, p2.context)
		end
		if p2.store then
			MockStoreModule = p2.store
		end
		if p2.navigation then
			MockNavigationModule = CreateMockNavigationModule(p2.navigation)
		end
		if p2.policyData then
			PolicyData = p2.policyData
		end
		if p2.shouldMockStyleProvider ~= nil then
			ShouldMockStyleProvider = p2.shouldMockStyleProvider
		end
	end
	local Element = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = MockStoreModule }, {
		PolicyProvider = ReactModule.createElement(RoactAppPolicy.Provider, { policy = { AppFeaturePolicies }, policyData = PolicyData }, {
			ContextProvider = ReactModule.createElement(FeedContextModule.Provider, { value = JoinResult }, {
				NavigationProvider = ReactModule.createElement(RoactNavigationModule.Provider, { value = MockNavigationModule }, {
					localizationProvider = ReactModule.createElement(LocalizationProvider, { localization = Localization }, p1)
				})
			})
		})
	})
	
	return if ShouldMockStyleProvider then UnitTestHelpersModule.createStyleProvider({ StyleProvider = Element }) else Element
end