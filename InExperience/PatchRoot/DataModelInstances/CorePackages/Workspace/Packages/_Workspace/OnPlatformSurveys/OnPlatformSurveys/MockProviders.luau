local Parent = script:FindFirstAncestor("OnPlatformSurveys").Parent
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactUtilsModule = require(Parent.RoactUtils)
local RoduxModule = require(Parent.Rodux)
local StyleModule = require(Parent.Style)
local UIBloxModule = require(Parent.UIBlox)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local LayerCollectorProvider = UIBloxModule.Core.Layout.LayerCollector.LayerCollectorProvider
local LocalizationProvider = LocalizationModule.LocalizationProvider
local ProviderContainer = RoactUtilsModule.Components.ProviderContainer
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme

local function reducer(p1)
	return p1 or {}
end

return function(p1)
	-- upvalues: RoduxModule (copy), reducer (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), LayerCollectorProvider (copy), RoactRoduxModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), ReactModule (copy), ProviderContainer (copy)
	local List = {}
	local NewResult = RoduxModule.Store.new(reducer, {}, { RoduxModule.thunkMiddleware })
	table.insert(List, {
		class = StyleProviderWithDefaultTheme,
		props = { withDarkTheme = true }
	})
	table.insert(List, {
		class = LocalizationProvider,
		props = {
			localization = {
				Format = function(_, p2)
					return p2
				end
			}
		}
	})
	table.insert(List, { class = LayerCollectorProvider, props = {} })
	table.insert(List, {
		class = RoactRoduxModule.StoreProvider,
		props = { store = NewResult }
	})
	table.insert(List, {
		class = RoactAppPolicy.Provider,
		props = { policy = { AppFeaturePolicies } }
	})
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, p1.children)
end