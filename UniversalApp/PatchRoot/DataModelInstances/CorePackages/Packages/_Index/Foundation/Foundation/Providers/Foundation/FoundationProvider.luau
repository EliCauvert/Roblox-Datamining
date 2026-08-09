local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local contextStack = require(parent_2.ReactUtils).ContextStack
local cursorModule = require(parent.Cursor)
local overlayModule = require(parent.Overlay)
local panelsProviderModule = require(parent.StudioPanels.PanelsProvider)
local pluginProviderModule = require(parent.Plugin.PluginProvider)
local preferencesProviderModule = require(parent.Preferences.PreferencesProvider)
local _ = require(parent.Responsive.ResponsiveContext)
local responsiveProviderModule = require(parent.Responsive.ResponsiveProvider)
local styleProviderModule = require(parent.Style.StyleProvider)
local _ = require(parent_1.Components.Types)
local widgetsProviderModule = require(parent.StudioWidgets.WidgetsProvider)
local elevationProvider = require(parent.Elevation.ElevationProvider).ElevationProvider
local flagsModule = require(parent_1.Utility.Flags)
local isPluginElevatedModule = require(parent.Plugin.isPluginElevated)

return function(p0) --[[ line: 35 | named "FoundationProvider" ]]
	-- upvalues: reactModule (ref), pluginProviderModule (ref), elevationProvider (ref), preferencesProviderModule (ref), styleProviderModule (ref), responsiveProviderModule (ref), overlayModule (ref), cursorModule (ref), isPluginElevatedModule (ref), flagsModule (ref), widgetsProviderModule (ref), panelsProviderModule (ref), contextStack (ref)
	local var11 = if p0.preferences then p0.preferences else {}
	local list = {
		reactModule.createElement(pluginProviderModule, { plugin = p0.plugin }),
		reactModule.createElement(elevationProvider, nil),
		reactModule.createElement(preferencesProviderModule, var11),
		reactModule.createElement(styleProviderModule, {
			theme = p0.theme,
			device = p0.device,
			derives = p0.derives,
			scale = var11.scale,
			tokenOverrides = p0.tokenOverrides
		}),
		reactModule.createElement(responsiveProviderModule, {
			config = if p0.responsiveConfig then p0.responsiveConfig else {}
		}),
		reactModule.createElement(overlayModule, if typeof(p0.overlayGui) == "table" then { DisplayOrder = p0.overlayGui.DisplayOrder } else { gui = p0.overlayGui }),
		reactModule.createElement(cursorModule)
	}
	
	if p0.plugin and isPluginElevatedModule(p0.plugin) and flagsModule.FoundationPopoverPluginSupport then
		table.insert(list, reactModule.createElement(widgetsProviderModule, {}))
		table.insert(list, reactModule.createElement(panelsProviderModule, {}))
	end
	return reactModule.createElement(contextStack, { providers = list }, p0.children)
end