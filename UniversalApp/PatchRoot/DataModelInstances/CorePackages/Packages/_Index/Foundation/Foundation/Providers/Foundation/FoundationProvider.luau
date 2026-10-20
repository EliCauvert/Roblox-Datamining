local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local ContextStack = require(Parent2.ReactUtils).ContextStack
local FlagsModule = require(Parent1.Utility.Flags)
local CursorModule = require(Parent.Cursor)
local OverlayModule = require(Parent.Overlay)
local PanelsProviderModule = require(Parent.StudioPanels.PanelsProvider)
local PluginProviderModule = require(Parent.Plugin.PluginProvider)
local PreferencesProviderModule = require(Parent.Preferences.PreferencesProvider)
local _ = require(Parent.Responsive.ResponsiveContext)
local ResponsiveProviderModule = require(Parent.Responsive.ResponsiveProvider)
local StyleProviderModule = require(Parent.Style.StyleProvider)
local _ = require(Parent1.Components.Types)
local WidgetsProviderModule = require(Parent.StudioWidgets.WidgetsProvider)
local ElevationProvider = require(Parent.Elevation.ElevationProvider).ElevationProvider
local IsPluginElevatedModule = require(Parent.Plugin.isPluginElevated)
local Frozen = table.freeze({})

return function(p1)
	-- upvalues: FlagsModule (copy), Frozen (copy), ReactModule (copy), PluginProviderModule (copy), ElevationProvider (copy), PreferencesProviderModule (copy), StyleProviderModule (copy), ResponsiveProviderModule (copy), OverlayModule (copy), CursorModule (copy), IsPluginElevatedModule (copy), WidgetsProviderModule (copy), PanelsProviderModule (copy), ContextStack (copy)
	local Preferences = if p1.preferences then p1.preferences elseif FlagsModule.FoundationProviderStableEmptyTable then Frozen else {}
	local Elements = {
		ReactModule.createElement(PluginProviderModule, { plugin = p1.plugin }),
		ReactModule.createElement(ElevationProvider, nil),
		ReactModule.createElement(PreferencesProviderModule, Preferences),
		ReactModule.createElement(StyleProviderModule, {
			themeName = p1.themeName,
			colorMode = p1.colorMode,
			theme = p1.theme,
			device = p1.device,
			derives = p1.derives,
			scale = Preferences.scale,
			tokenOverrides = p1.tokenOverrides
		}),
		ReactModule.createElement(ResponsiveProviderModule, {
			config = if p1.responsiveConfig then p1.responsiveConfig elseif FlagsModule.FoundationProviderStableEmptyTable then Frozen else {}
		}),
		ReactModule.createElement(OverlayModule, if typeof(p1.overlayGui) == "table" then { DisplayOrder = p1.overlayGui.DisplayOrder } else { gui = p1.overlayGui }),
		ReactModule.createElement(CursorModule)
	}
	
	if p1.plugin and IsPluginElevatedModule(p1.plugin) then
		table.insert(Elements, ReactModule.createElement(WidgetsProviderModule, {}))
		table.insert(Elements, ReactModule.createElement(PanelsProviderModule, {}))
	end
	return ReactModule.createElement(ContextStack, { providers = Elements }, p1.children)
end