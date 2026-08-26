local parent = script.Parent.Parent
local localizationService = game:GetService("LocalizationService")
local guiService = game:GetService("GuiService")
local var1 = if game:DefineFastFlag("SwitchCSRootProviderTranslationsPackage", false) then require(parent.InExperienceLocales).Localization else require(parent.RobloxAppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local designTokenProvider = require(parent.Style).DesignTokenProvider
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local deviceType = robloxAppEnumsModule.DeviceType
local gamepadDisconnectTokenMapper = require(parent.InputUi).Gamepad.GamepadDisconnectTokenMapper
local feedbackManagerInjectionContextProvider = require(parent.InteractionFeedback).FeedbackManagerInjectionContextProvider
local appInteractionFeedbackProvider = require(parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider
local var2 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local t = {
	themeName = "dark",
	fontName = "gotham",
	deviceType = if guiService:IsTenFootInterface() then deviceType.Console else deviceType.Desktop
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), roactRoduxModule (ref), roduxModule (ref), UIBloxModule (ref), designTokenProvider (ref), gamepadDisconnectTokenMapper (ref), selectionCursorProvider (ref), localizationProvider (ref), var1 (write), localizationService (ref), reactFocusNavigationModule (ref), var2 (ref), provider (ref), foundationModule (ref), deviceType (ref), appInteractionFeedbackProvider (ref), feedbackManagerInjectionContextProvider (ref)
	local var3 = cryoModule.Dictionary.join(t, p1.styleOverride or {})
	
	return reactModule.createElement(appInteractionFeedbackProvider, {}, {
		tree = reactModule.createElement(feedbackManagerInjectionContextProvider, nil, {
			tree = reactModule.createElement(foundationModule.FoundationProvider, {
				colorMode = if var3.themeName == "dark" then foundationModule.Enums.ColorMode.Dark else foundationModule.Enums.ColorMode.Light,
				device = if var3.deviceType == deviceType.Console then foundationModule.Enums.Device.Console else foundationModule.Enums.Device.Desktop
			}, {
				tree = reactModule.createElement(roactRoduxModule.StoreProvider, {
					store = roduxModule.Store.new(function(p2)
						return p2
					end, {}, {})
				}, {
					AppStyleProvider = reactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, { style = var3 }, {
						DesignTokenProvider = reactModule.createElement(designTokenProvider, {
							tokenMappers = { GamepadDisconnect = gamepadDisconnectTokenMapper }
						}, {
							CursorProvider = reactModule.createElement(selectionCursorProvider, {}, {
								LocalizationProvider = reactModule.createElement(localizationProvider, {
									localization = var1.new(localizationService.RobloxLocaleId)
								}, {
									FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var2 }, {
										FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, p1.children)
									})
								})
							})
						})
					})
				})
			})
		})
	})
end