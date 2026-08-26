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
local colorMode = foundationModule.Enums.ColorMode
local useTokens = foundationModule.Hooks.useTokens
local t = { withUiModeSupport = true, withDarkTheme = true }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), reactModule (ref), uiModeStyleProviderModule (ref), appStyleProvider (ref), colorMode (ref), constants (ref), foundationProvider (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = reactModule.createElement(if p1.withUiModeSupport then uiModeStyleProviderModule else appStyleProvider, {
		style = {
			themeName = if var1.withDarkTheme then colorMode.Dark else colorMode.Light,
			fontName = constants.FontName.Gotham
		}
	}, var1.children)
	
	return if p1.withUiModeSupport or useTokens().Config ~= nil then var2 else reactModule.createElement(foundationProvider, {
		colorMode = if var1.withDarkTheme then colorMode.Dark else colorMode.Light
	}, var2)
end