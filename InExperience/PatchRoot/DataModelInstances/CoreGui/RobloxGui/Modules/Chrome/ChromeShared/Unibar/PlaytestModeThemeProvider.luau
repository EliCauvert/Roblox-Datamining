local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local constants = require(corePackagesService.Packages.UIBlox).App.Style.Constants
local styleModule = require(corePackagesService.Workspace.Packages.Style)
local uiModeStyleProvider = styleModule.UiModeStyleProvider
local appearanceContext = styleModule.AppearanceContext
local colorMode = require(corePackagesService.Packages.Foundation).Enums.ColorMode
local useIsPlaytestModeModule = require(script.Parent.Parent.Hooks.useIsPlaytestMode)

local function ThemeSwitcher(p1)
	-- upvalues: reactModule (ref), appearanceContext (ref)
	local var1 = reactModule.useContext(appearanceContext)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.setTheme(p1.themeName)
	end, { p1.themeName, var1 })
	
	return reactModule.createElement(reactModule.Fragment, nil, p1.children)
end

return function(p1)
	-- upvalues: useIsPlaytestModeModule (ref), colorMode (ref), reactModule (ref), uiModeStyleProvider (ref), constants (ref), ThemeSwitcher (ref)
	local var1 = if useIsPlaytestModeModule() then colorMode.Light else colorMode.Dark
	
	return reactModule.createElement(uiModeStyleProvider, {
		style = { themeName = var1, fontName = constants.FontName.Gotham }
	}, {
		ThemeSwitcher = reactModule.createElement(ThemeSwitcher, { themeName = var1 }, p1.children)
	})
end