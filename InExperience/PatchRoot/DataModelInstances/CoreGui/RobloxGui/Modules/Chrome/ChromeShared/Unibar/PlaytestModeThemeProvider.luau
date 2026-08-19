local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local constants = require(corePackagesService.Packages.UIBlox).App.Style.Constants
local styleModule = require(corePackagesService.Workspace.Packages.Style)
local uiModeStyleProvider = styleModule.UiModeStyleProvider
local appearanceContext = styleModule.AppearanceContext
local colorMode = require(corePackagesService.Packages.Foundation).Enums.ColorMode
local useIsPlaytestModeModule = require(script.Parent.Parent.Hooks.useIsPlaytestMode)

local function ThemeSwitcher(p0) --[[ line: 23 ]]
	-- upvalues: reactModule (ref), appearanceContext (ref)
	local var5 = reactModule.useContext(appearanceContext)
	reactModule.useLayoutEffect(function() --[[ line: 26 ]]
		-- upvalues: var5 (ref), p0 (ref)
		var5.setTheme(p0.themeName)
	end, { p0.themeName, var5 })
	
	return reactModule.createElement(reactModule.Fragment, nil, p0.children)
end

return function(p1) --[[ line: 33 | named "PlaytestModeThemeProvider" ]]
	-- upvalues: useIsPlaytestModeModule (ref), colorMode (ref), reactModule (ref), uiModeStyleProvider (ref), constants (ref), ThemeSwitcher (ref)
	local var6 = if useIsPlaytestModeModule() then colorMode.Light else colorMode.Dark
	
	return reactModule.createElement(uiModeStyleProvider, {
		style = { themeName = var6, fontName = constants.FontName.Gotham }
	}, {
		ThemeSwitcher = reactModule.createElement(ThemeSwitcher, { themeName = var6 }, p1.children)
	})
end