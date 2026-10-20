local Parent = script.Parent.Parent
local LocalizationService = game:GetService("LocalizationService")
local IsTenFootInterfaceFunction = require(Parent.AppCommonLib).isTenFootInterface
local Localization = nil
Localization = if game:DefineFastFlag("SwitchCSRootProviderTranslationsPackage", false) then require(Parent.InExperienceLocales).Localization else require(Parent.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local DeviceType = require(Parent.RobloxAppEnums).DeviceType
local GamepadDisconnectTokenMapper = require(Parent.InputUi).Gamepad.GamepadDisconnectTokenMapper
local FeedbackManagerInjectionContextProvider = require(Parent.InteractionFeedback).FeedbackManagerInjectionContextProvider
local AppInteractionFeedbackProvider = require(Parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local config = {
	themeName = "dark",
	fontName = "gotham",
	deviceType = if IsTenFootInterfaceFunction() then DeviceType.Console else DeviceType.Desktop
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), RoactRoduxModule (copy), RoduxModule (copy), UIBloxModule (copy), DesignTokenProvider (copy), GamepadDisconnectTokenMapper (copy), SelectionCursorProvider (copy), LocalizationProvider (copy), Localization (ref), LocalizationService (copy), ReactFocusNavigationModule (copy), NewResult (copy), Provider (copy), FoundationModule (copy), DeviceType (copy), AppInteractionFeedbackProvider (copy), FeedbackManagerInjectionContextProvider (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1.styleOverride or {})
	
	return (ReactModule.createElement(AppInteractionFeedbackProvider, {}, {
		tree = ReactModule.createElement(FeedbackManagerInjectionContextProvider, nil, {
			tree = ReactModule.createElement(FoundationModule.FoundationProvider, {
				colorMode = if JoinResult.themeName == "dark" then FoundationModule.Enums.ColorMode.Dark else FoundationModule.Enums.ColorMode.Light,
				device = if JoinResult.deviceType == DeviceType.Console then FoundationModule.Enums.Device.Console else FoundationModule.Enums.Device.Desktop
			}, {
				tree = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
					store = RoduxModule.Store.new(function(p2)
						return p2
					end, {}, {})
				}, {
					AppStyleProvider = ReactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, { style = JoinResult }, {
						DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, {
							tokenMappers = { GamepadDisconnect = GamepadDisconnectTokenMapper }
						}, {
							CursorProvider = ReactModule.createElement(SelectionCursorProvider, {}, {
								LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
									localization = Localization.new(LocalizationService.RobloxLocaleId)
								}, {
									FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
										FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, p1.children)
									})
								})
							})
						})
					})
				})
			})
		})
	}))
end