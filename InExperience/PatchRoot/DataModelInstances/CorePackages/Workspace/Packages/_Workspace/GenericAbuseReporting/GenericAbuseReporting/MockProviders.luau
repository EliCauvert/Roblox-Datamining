local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local AppFeaturePolicies = require(Parent.UniversalAppPolicy).AppFeaturePolicies
local ReactModule = require(Parent.React)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local config = {
	state = { routeName = "", key = "", params = {} },
	dispatch = function() --[[ Line: 34 ]] end,
	goBack = function() --[[ Line: 35 ]] end,
	addListener = function() --[[ Line: 36 ]]
		return { remove = function() --[[ Line: 38 ]] end }
	end,
	isFocused = function() --[[ Line: 41 ]] end,
	setParams = function() --[[ Line: 42 ]] end,
	getParam = function() --[[ Line: 43 ]] end,
	replace = function() --[[ Line: 44 ]] end,
	push = function() --[[ Line: 45 ]] end
}

local function reducer(p1) --[[ Line: 48 ]]
	return p1
end

return function(p1) --[[ Line: 52 | Named "MockProviders" ]]
	-- upvalues: RoduxModule (copy), reducer (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), LayerCollectorProvider (copy), RoactNavigationModule (copy), config (copy), RoactRoduxModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), ReactModule (copy), ProviderContainer (copy)
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
				Format = function(_, p2) --[[ Line: 70 ]]
					return p2
				end
			}
		}
	})
	table.insert(List, { class = LayerCollectorProvider, props = {} })
	table.insert(List, {
		class = RoactNavigationModule.Provider,
		props = { value = config }
	})
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