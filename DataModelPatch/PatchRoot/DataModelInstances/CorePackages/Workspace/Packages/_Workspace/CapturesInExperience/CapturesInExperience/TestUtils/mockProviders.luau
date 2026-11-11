local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RoactRoduxModule = require(Parent1.RoactRodux)
local UnitTestHelpersModule = require(Parent1.Dev.UnitTestHelpers)
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local Mock = require(Parent1.LuaSocialLibrariesDeps).Mock
local Jest = require(Parent1.Dev.JestGlobals).jest
local CapturesPolicyModule = require(Parent.App.CapturesPolicy)
local CapturesContextModule = require(Parent.Context.CapturesContext)
local CreateStoreModule = require(Parent.TestUtils.createStore)
local MockAnalyticsModule = require(Parent.TestUtils.mockAnalytics)
local config = {
	EligibleForCapturesFeature = true,
	EnableCapturesBulkManagement = true,
	EnableShareCaptureCTA = true
}

return function(p1, p2)
	-- upvalues: Mock (copy), MockAnalyticsModule (copy), Jest (copy), CreateStoreModule (copy), ReactModule (copy), RoactRoduxModule (copy), CapturesPolicyModule (copy), config (copy), CapturesContextModule (copy), UnitTestHelpersModule (copy), LocalizationProvider (copy)
	local Localization = Mock.MagicMock.new({ name = "Localization" })
	
	function Localization:Format(p3, _)
		return p3
	end
	
	local MockAnalyticsModuleResult = MockAnalyticsModule({}, Jest)
	local StoreModule = CreateStoreModule()
	
	if p2 then
		if p2.analytics then
			MockAnalyticsModuleResult = p2.analytics
		end
		if p2.store then
			StoreModule = p2.store
		end
	end
	return (ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = StoreModule }, {
		PolicyProvider = ReactModule.createElement(CapturesPolicyModule.Provider, {
			policy = { CapturesPolicyModule.Mapper },
			policyData = p2 and p2.policyData or config
		}, {
			ContextProvider = ReactModule.createElement(CapturesContextModule.Provider, {
				value = {
					fireAnalyticsEvent = MockAnalyticsModuleResult.fireAnalyticsEvent,
					chromeEnabled = p2 and p2.chromeEnabled or nil
				}
			}, {
				StyleProvider = UnitTestHelpersModule.createStyleProvider({
					localizationProvider = ReactModule.createElement(LocalizationProvider, { localization = Localization }, p1)
				})
			})
		})
	}))
end