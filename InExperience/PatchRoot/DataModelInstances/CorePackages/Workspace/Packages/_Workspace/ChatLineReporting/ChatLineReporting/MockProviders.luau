local parent = script:FindFirstAncestor("ChatLineReporting").Parent
local reactModule = require(parent.React)
local providerContainer = require(parent.RoactUtils).Components.ProviderContainer
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local localizationProvider = require(parent.Localization).LocalizationProvider
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider

return function(p0) --[[ line: 22 | named "MockProviders" ]]
	-- upvalues: styleProviderWithDefaultTheme (ref), localizationProvider (ref), layerCollectorProvider (ref), reactModule (ref), providerContainer (ref)
	local t = {}
	table.insert(t, {
		class = styleProviderWithDefaultTheme,
		props = { withDarkTheme = true }
	})
	table.insert(t, {
		class = localizationProvider,
		props = {
			localization = {
				Format = function(_, p1) --[[ line: 36 ]]
					return p1
				end
			}
		}
	})
	table.insert(t, { class = layerCollectorProvider, props = {} })
	
	return reactModule.createElement(providerContainer, { providers = t }, p0.children)
end