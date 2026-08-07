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
	dispatch = function() --[[ line: 34 ]] end,
	goBack = function() --[[ line: 35 ]] end,
	addListener = function() --[[ line: 36 ]]
		return { remove = function() --[[ line: 38 ]] end }
	end,
	isFocused = function() --[[ line: 41 ]] end,
	setParams = function() --[[ line: 42 ]] end,
	getParam = function() --[[ line: 43 ]] end,
	replace = function() --[[ line: 44 ]] end,
	push = function() --[[ line: 45 ]] end
}

local function reducer(p0) --[[ line: 48 ]]
	return p0
end

return function(p1) --[[ line: 52 | named "MockProviders" ]]
	-- upvalues: roduxModule (ref), reducer (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), layerCollectorProvider (ref), roactNavigationModule (ref), t (ref), roactRoduxModule (ref), roactAppPolicy (ref), appFeaturePolicies (ref), reactModule (ref), providerContainer (ref)
	local t_1 = {}
	local var7 = roduxModule.Store.new(reducer, {}, { roduxModule.thunkMiddleware })
	table.insert(t_1, {
		class = styleProviderWithDefaultTheme,
		props = { withDarkTheme = true }
	})
	table.insert(t_1, {
		class = localizationProvider,
		props = {
			localization = {
				Format = function(_, p2) --[[ line: 70 ]]
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
		props = { store = var7 }
	})
	table.insert(t_1, {
		class = roactAppPolicy.Provider,
		props = { policy = { appFeaturePolicies } }
	})
	
	return reactModule.createElement(providerContainer, { providers = t_1 }, p1.children)
end