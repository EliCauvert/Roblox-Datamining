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
local ColorMode = FoundationModule.Enums.ColorMode
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = { withUiModeSupport = true, withDarkTheme = true }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), UiModeStyleProviderModule (copy), AppStyleProvider (copy), ColorMode (copy), Constants (copy), FoundationProvider (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local HasConfig = UseTokensFunction().Config ~= nil
	local Element = ReactModule.createElement(if p1.withUiModeSupport then UiModeStyleProviderModule else AppStyleProvider, {
		style = {
			themeName = if JoinResult.withDarkTheme then ColorMode.Dark else ColorMode.Light,
			fontName = Constants.FontName.Gotham
		}
	}, JoinResult.children)
	
	return if p1.withUiModeSupport or HasConfig then Element else ReactModule.createElement(FoundationProvider, {
		colorMode = if JoinResult.withDarkTheme then ColorMode.Dark else ColorMode.Light
	}, Element)
end