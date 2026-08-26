local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local contextStack = require(parent_2.ReactUtils).ContextStack
local flagsModule = require(parent_1.Utility.Flags)
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
local isPluginElevatedModule = require(parent.Plugin.isPluginElevated)
local frozen = table.freeze({})

return function(p1)
	-- upvalues: flagsModule (ref), frozen (ref), reactModule (ref), pluginProviderModule (ref), elevationProvider (ref), preferencesProviderModule (ref), styleProviderModule (ref), responsiveProviderModule (ref), overlayModule (ref), cursorModule (ref), isPluginElevatedModule (ref), widgetsProviderModule (ref), panelsProviderModule (ref), contextStack (ref)
	local var1 = if p1.preferences then p1.preferences elseif flagsModule.FoundationProviderStableEmptyTable then frozen else {}
	local list = {
		reactModule.createElement(pluginProviderModule, { plugin = p1.plugin }),
		reactModule.createElement(elevationProvider, nil),
		reactModule.createElement(preferencesProviderModule, var1),
		reactModule.createElement(styleProviderModule, {
			themeName = if flagsModule.FoundationThemeName then p1.themeName else nil,
			colorMode = p1.colorMode,
			theme = p1.theme,
			device = p1.device,
			derives = p1.derives,
			scale = var1.scale,
			tokenOverrides = p1.tokenOverrides
		}),
		reactModule.createElement(responsiveProviderModule, {
			config = if p1.responsiveConfig then p1.responsiveConfig elseif flagsModule.FoundationProviderStableEmptyTable then frozen else {}
		}),
		reactModule.createElement(overlayModule, if typeof(p1.overlayGui) == "table" then { DisplayOrder = p1.overlayGui.DisplayOrder } else { gui = p1.overlayGui }),
		reactModule.createElement(cursorModule)
	}
	
	if p1.plugin and isPluginElevatedModule(p1.plugin) then
		table.insert(list, reactModule.createElement(widgetsProviderModule, {}))
		table.insert(list, reactModule.createElement(panelsProviderModule, {}))
	end
	return reactModule.createElement(contextStack, { providers = list }, p1.children)
end