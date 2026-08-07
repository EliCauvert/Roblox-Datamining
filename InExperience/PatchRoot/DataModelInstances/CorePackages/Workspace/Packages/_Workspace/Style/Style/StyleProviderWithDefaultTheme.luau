local style = script:FindFirstAncestor("Style")
local parent = style.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local constants = UIBloxModule.App.Style.Constants
local uiModeStyleProviderModule = require(style.UiModeStyleProvider)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local theme = foundationModule.Enums.Theme
local useTokens = foundationModule.Hooks.useTokens
local t = { withUiModeSupport = true, withDarkTheme = true }

return function(p0) --[[ line: 35 ]]
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), reactModule (ref), uiModeStyleProviderModule (ref), appStyleProvider (ref), constants (ref), foundationProvider (ref), theme (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local var8 = reactModule.createElement(if p0.withUiModeSupport then uiModeStyleProviderModule else appStyleProvider, {
		style = {
			themeName = if var7.withDarkTheme then constants.ThemeName.Dark else constants.ThemeName.Light,
			fontName = constants.FontName.Gotham
		}
	}, var7.children)
	
	return if p0.withUiModeSupport or useTokens().Config ~= nil then var8 else reactModule.createElement(foundationProvider, {
		theme = if var7.withDarkTheme then theme.Dark else theme.Light
	}, var8)
end