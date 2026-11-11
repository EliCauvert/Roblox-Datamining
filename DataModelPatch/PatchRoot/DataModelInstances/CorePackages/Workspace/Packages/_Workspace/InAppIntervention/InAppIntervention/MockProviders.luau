local Parent = script:FindFirstAncestor("InAppIntervention").Parent
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local RoactRoduxModule = require(Parent.RoactRodux)

local function staticReducer(p1)
	return p1
end

return function(p1)
	-- upvalues: RoactRoduxModule (copy), RoduxModule (copy), staticReducer (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), LayerCollectorProvider (copy), FoundationProvider (copy), ReactModule (copy), ProviderContainer (copy)
	local List = {}
	table.insert(List, {
		class = RoactRoduxModule.StoreProvider,
		props = {
			store = RoduxModule.Store.new(staticReducer, { ScreenSize = Vector2.new(2400, 1800) }, { RoduxModule.thunkMiddleware })
		}
	})
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
	table.insert(List, { class = FoundationProvider, props = { theme = "Dark" } })
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, p1.children)
end