local parent = script:FindFirstAncestor("OnPlatformSurveys").Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local roactUtilsModule = require(parent.RoactUtils)
local roduxModule = require(parent.Rodux)
local styleModule = require(parent.Style)
local UIBloxModule = require(parent.UIBlox)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local appFeaturePolicies = universalAppPolicyModule.AppFeaturePolicies
local layerCollectorProvider = UIBloxModule.Core.Layout.LayerCollector.LayerCollectorProvider
local localizationProvider = localizationModule.LocalizationProvider
local providerContainer = roactUtilsModule.Components.ProviderContainer
local roactAppPolicy = universalAppPolicyModule.RoactAppPolicy
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme

local function reducer(p1)
	return p1 or {}
end

return function(p1)
	-- upvalues: roduxModule (ref), reducer (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), layerCollectorProvider (ref), roactRoduxModule (ref), roactAppPolicy (ref), appFeaturePolicies (ref), reactModule (ref), providerContainer (ref)
	local t = {}
	local var1 = roduxModule.Store.new(reducer, {}, { roduxModule.thunkMiddleware })
	table.insert(t, {
		class = styleProviderWithDefaultTheme,
		props = { withDarkTheme = true }
	})
	table.insert(t, {
		class = localizationProvider,
		props = {
			localization = {
				Format = function(_, p2)
					return p2
				end
			}
		}
	})
	table.insert(t, { class = layerCollectorProvider, props = {} })
	table.insert(t, {
		class = roactRoduxModule.StoreProvider,
		props = { store = var1 }
	})
	table.insert(t, {
		class = roactAppPolicy.Provider,
		props = { policy = { appFeaturePolicies } }
	})
	
	return reactModule.createElement(providerContainer, { providers = t }, p1.children)
end