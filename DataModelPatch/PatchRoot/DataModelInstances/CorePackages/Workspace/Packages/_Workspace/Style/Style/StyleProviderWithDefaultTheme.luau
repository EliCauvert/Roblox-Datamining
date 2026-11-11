local Style = script:FindFirstAncestor("Style")
local Parent = Style.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Constants = UIBloxModule.App.Style.Constants
local UiModeStyleProviderModule = require(Style.UiModeStyleProvider)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = { withUiModeSupport = true, withDarkTheme = true }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), UiModeStyleProviderModule (copy), AppStyleProvider (copy), Constants (copy), FoundationProvider (copy), Theme (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local HasConfig = UseTokensFunction().Config ~= nil
	local Element = ReactModule.createElement(if p1.withUiModeSupport then UiModeStyleProviderModule else AppStyleProvider, {
		style = {
			themeName = if JoinResult.withDarkTheme then Constants.ThemeName.Dark else Constants.ThemeName.Light,
			fontName = Constants.FontName.Gotham
		}
	}, JoinResult.children)
	
	return if p1.withUiModeSupport or HasConfig then Element else ReactModule.createElement(FoundationProvider, {
		theme = if JoinResult.withDarkTheme then Theme.Dark else Theme.Light
	}, Element)
end