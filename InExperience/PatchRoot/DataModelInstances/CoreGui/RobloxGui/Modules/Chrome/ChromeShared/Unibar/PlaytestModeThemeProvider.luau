local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local constants = require(corePackagesService.Packages.UIBlox).App.Style.Constants
local styleModule = require(corePackagesService.Workspace.Packages.Style)
local uiModeStyleProvider = styleModule.UiModeStyleProvider
local themeContext = styleModule.ThemeContext
local useIsPlaytestModeModule = require(script.Parent.Parent.Hooks.useIsPlaytestMode)

local function ThemeSwitcher(p0) --[[ line: 21 ]]
	-- upvalues: reactModule (ref), themeContext (ref)
	local var5 = reactModule.useContext(themeContext)
	reactModule.useLayoutEffect(function() --[[ line: 24 ]]
		-- upvalues: var5 (ref), p0 (ref)
		var5.setTheme(p0.themeName)
	end, { p0.themeName, var5 })
	
	return reactModule.createElement(reactModule.Fragment, nil, p0.children)
end

return function(p1) --[[ line: 31 | named "PlaytestModeThemeProvider" ]]
	-- upvalues: useIsPlaytestModeModule (ref), constants (ref), reactModule (ref), uiModeStyleProvider (ref), ThemeSwitcher (ref)
	local var6 = if useIsPlaytestModeModule() then constants.ThemeName.Light else constants.ThemeName.Dark
	
	return reactModule.createElement(uiModeStyleProvider, {
		style = { themeName = var6, fontName = constants.FontName.Gotham }
	}, {
		ThemeSwitcher = reactModule.createElement(ThemeSwitcher, { themeName = var6 }, p1.children)
	})
end