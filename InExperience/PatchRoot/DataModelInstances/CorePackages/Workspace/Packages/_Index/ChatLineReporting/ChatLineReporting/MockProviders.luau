local Parent = script:FindFirstAncestor("ChatLineReporting").Parent
local ReactModule = require(Parent.React)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider

return function(p1) --[[ Line: 22 | Named "MockProviders" ]]
	-- upvalues: StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), LayerCollectorProvider (copy), ReactModule (copy), ProviderContainer (copy)
	local List = {}
	table.insert(List, {
		class = StyleProviderWithDefaultTheme,
		props = { withDarkTheme = true }
	})
	table.insert(List, {
		class = LocalizationProvider,
		props = {
			localization = {
				Format = function(_, p2) --[[ Line: 36 ]]
					return p2
				end
			}
		}
	})
	table.insert(List, { class = LayerCollectorProvider, props = {} })
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, p1.children)
end