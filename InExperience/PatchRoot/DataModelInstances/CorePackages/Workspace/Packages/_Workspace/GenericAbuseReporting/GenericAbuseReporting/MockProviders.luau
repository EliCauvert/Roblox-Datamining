local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local appFeaturePolicies = require(parent.UniversalAppPolicy).AppFeaturePolicies
local reactModule = require(parent.React)
local providerContainer = require(parent.RoactUtils).Components.ProviderContainer
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local localizationProvider = require(parent.Localization).LocalizationProvider
local roactAppPolicy = require(parent.UniversalAppPolicy).RoactAppPolicy
local roactNavigationModule = require(parent.RoactNavigation)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local t = {
	state = { routeName = "", key = "", params = {} },
	dispatch = function() end,
	goBack = function() end,
	addListener = function()
		return { remove = function() end }
	end,
	isFocused = function() end,
	setParams = function() end,
	getParam = function() end,
	replace = function() end,
	push = function() end
}

local function reducer(p1)
	return p1
end

return function(p1)
	-- upvalues: roduxModule (ref), reducer (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), layerCollectorProvider (ref), roactNavigationModule (ref), t (ref), roactRoduxModule (ref), roactAppPolicy (ref), appFeaturePolicies (ref), reactModule (ref), providerContainer (ref)
	local t_1 = {}
	local var1 = roduxModule.Store.new(reducer, {}, { roduxModule.thunkMiddleware })
	table.insert(t_1, {
		class = styleProviderWithDefaultTheme,
		props = { withDarkTheme = true }
	})
	table.insert(t_1, {
		class = localizationProvider,
		props = {
			localization = {
				Format = function(_, p2)
					return p2
				end
			}
		}
	})
	table.insert(t_1, { class = layerCollectorProvider, props = {} })
	table.insert(t_1, {
		class = roactNavigationModule.Provider,
		props = { value = t }
	})
	table.insert(t_1, {
		class = roactRoduxModule.StoreProvider,
		props = { store = var1 }
	})
	table.insert(t_1, {
		class = roactAppPolicy.Provider,
		props = { policy = { appFeaturePolicies } }
	})
	
	return reactModule.createElement(providerContainer, { providers = t_1 }, p1.children)
end