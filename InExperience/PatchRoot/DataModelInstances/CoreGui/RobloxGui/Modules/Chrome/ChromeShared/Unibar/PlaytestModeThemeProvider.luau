local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Constants = require(CorePackages.Packages.UIBlox).App.Style.Constants
local StyleModule = require(CorePackages.Workspace.Packages.Style)
local UiModeStyleProvider = StyleModule.UiModeStyleProvider
local AppearanceContext = StyleModule.AppearanceContext
local ColorMode = require(CorePackages.Packages.Foundation).Enums.ColorMode
local UseIsPlaytestModeModule = require(script.Parent.Parent.Hooks.useIsPlaytestMode)

local function ThemeSwitcher(p1) --[[ Line: 23 ]]
	-- upvalues: ReactModule (copy), AppearanceContext (copy)
	local UseContextResult = ReactModule.useContext(AppearanceContext)
	ReactModule.useLayoutEffect(function() --[[ Line: 26 ]]
		-- upvalues: UseContextResult (copy), p1 (copy)
		UseContextResult.setTheme(p1.themeName)
	end, { p1.themeName, UseContextResult })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
end

return function(p1) --[[ Line: 33 | Named "PlaytestModeThemeProvider" ]]
	-- upvalues: UseIsPlaytestModeModule (copy), ColorMode (copy), ReactModule (copy), UiModeStyleProvider (copy), Constants (copy), ThemeSwitcher (copy)
	local Light = if UseIsPlaytestModeModule() then ColorMode.Light else ColorMode.Dark
	
	return ReactModule.createElement(UiModeStyleProvider, {
		style = { themeName = Light, fontName = Constants.FontName.Gotham }
	}, {
		ThemeSwitcher = ReactModule.createElement(ThemeSwitcher, { themeName = Light }, p1.children)
	})
end