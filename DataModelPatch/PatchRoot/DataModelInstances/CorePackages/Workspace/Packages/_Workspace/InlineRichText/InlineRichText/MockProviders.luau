local Parent = script:FindFirstAncestor("InlineRichText").Parent
local ReactModule = require(Parent.React)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local StyleModule = require(Parent.Style)
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local NavigationRoduxModule = require(Parent.NavigationRodux)
local config = { withUiModeSupport = false }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), FoundationProvider (copy), RoactRoduxModule (copy), RoduxModule (copy), NavigationRoduxModule (copy), StyleProviderWithDefaultTheme (copy), StyleModule (copy), LocalizationProvider (copy), ReactModule (copy), ProviderContainer (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local List = {}
	table.insert(List, {
		class = FoundationProvider,
		props = { device = "Desktop", theme = UnionResult.themeName }
	})
	table.insert(List, {
		class = RoactRoduxModule.StoreProvider,
		props = {
			store = RoduxModule.Store.new(function(p2, _)
				return p2
			end, { Navigation = { lockNavigationActions = false } }, {
				RoduxModule.thunkMiddleware,
				NavigationRoduxModule.Thunks.RNAdapterThunk.middleware(function(p2)
					print(`[Mock Providers Debug] Navigating to {p2.routeName} with detail {p2.params.detail}`)
				end)
			})
		}
	})
	table.insert(List, {
		class = StyleProviderWithDefaultTheme,
		props = {
			withDarkTheme = UnionResult.themeName ~= "Light",
			withUiModeSupport = UnionResult.withUiModeSupport
		}
	})
	table.insert(List, {
		class = StyleModule.DesignTokenProvider,
		props = { tokenMappers = {} }
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
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, UnionResult.children)
end