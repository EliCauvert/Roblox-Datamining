local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Signal = require(Parent.AppCommonLib).Signal
local RoactRoduxModule = require(Parent.Dev.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local StyleProviderWithDefaultTheme = require(Parent.Dev.Style).StyleProviderWithDefaultTheme
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local ResponsiveProvider = require(Parent.Responsive).ResponsiveProvider
local Dictionary = require(Parent.Cryo).Dictionary

local function reducer(p1)
	return p1 or {}
end

local function MockProviders(p1)
	-- upvalues: RoduxModule (copy), reducer (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), Signal (copy), LayerCollectorProvider (copy), RoactRoduxModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), ResponsiveProvider (copy), ReactModule (copy), ProviderContainer (copy)
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
				end,
				changed = Signal.new()
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
	table.insert(List, { class = ResponsiveProvider, props = {} })
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, p1.children)
end

return {
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: Dictionary (copy), ReactModule (copy), MockProviders (copy), FoundationProvider (copy)
		return function(p2)
			-- upvalues: Dictionary (upval), ReactModule (upval), MockProviders (upval), FoundationProvider (upval), p1 (copy)
			return ReactModule.createElement(MockProviders, {}, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					theme = "Dark",
					preferences = p2.settings,
					overlayGui = p2.focus
				}, {
					story = ReactModule.createElement(p1, (Dictionary.union(p2, p2.definition and p2.definition.props or {})))
				})
			})
		end
	end,
	storyRoots = { NotApprovedPage }
}