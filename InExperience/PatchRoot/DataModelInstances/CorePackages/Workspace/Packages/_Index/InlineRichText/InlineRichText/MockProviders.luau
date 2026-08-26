local parent = script:FindFirstAncestor("InlineRichText").Parent
local reactModule = require(parent.React)
local providerContainer = require(parent.RoactUtils).Components.ProviderContainer
local styleModule = require(parent.Style)
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local foundationProvider = require(parent.Foundation).FoundationProvider
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local localizationProvider = require(parent.Localization).LocalizationProvider
local navigationRoduxModule = require(parent.NavigationRodux)
local t = { withUiModeSupport = false }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), foundationProvider (ref), roactRoduxModule (ref), roduxModule (ref), navigationRoduxModule (ref), styleProviderWithDefaultTheme (ref), styleModule (ref), localizationProvider (ref), reactModule (ref), providerContainer (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local t_1 = {}
	table.insert(t_1, {
		class = foundationProvider,
		props = { device = "Desktop", theme = var1.themeName }
	})
	table.insert(t_1, {
		class = roactRoduxModule.StoreProvider,
		props = {
			store = roduxModule.Store.new(function(p2, _)
				return p2
			end, { Navigation = { lockNavigationActions = false } }, {
				roduxModule.thunkMiddleware,
				navigationRoduxModule.Thunks.RNAdapterThunk.middleware(function(p2)
					print(`[Mock Providers Debug] Navigating to {p2.routeName} with detail {p2.params.detail}`)
				end)
			})
		}
	})
	table.insert(t_1, {
		class = styleProviderWithDefaultTheme,
		props = {
			withDarkTheme = var1.themeName ~= "Light",
			withUiModeSupport = var1.withUiModeSupport
		}
	})
	table.insert(t_1, {
		class = styleModule.DesignTokenProvider,
		props = { tokenMappers = {} }
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
	
	return reactModule.createElement(providerContainer, { providers = t_1 }, var1.children)
end