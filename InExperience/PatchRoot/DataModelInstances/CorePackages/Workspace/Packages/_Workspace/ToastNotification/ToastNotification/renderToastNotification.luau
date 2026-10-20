local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ToastNotificationWrapperModule = require(Parent.ToastNotificationWrapper)
local React = DependenciesModule.React
local ReactRoblox = DependenciesModule.ReactRoblox
local _ = require(Parent.type)
local StyleProviderWithDefaultTheme = require(Parent1.Style).StyleProviderWithDefaultTheme
local FoundationModule = require(Parent1.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Localization = require(Parent1.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local ReactFocusNavigationModule = require(Parent1.ReactFocusNavigation)
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local Provider = require(Parent1.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local InGameToastNotificationActionEventReceiverModule = require(script.Parent.InGameToastNotificationActionEventReceiver)
local SecurityAlertEventReceiverModule = require(script.Parent.receivers.SecurityAlertEventReceiver)
local ClientToastNotificationsEnabledEngineFeature = game:GetEngineFeature("ClientToastNotificationsEnabled")
local GetFFlagEnableSecurityAlertToastCallbackFunction = require(Parent1.SharedFlags).GetFFlagEnableSecurityAlertToastCallback

return function(p1)
	-- upvalues: CoreGui (copy), ClientToastNotificationsEnabledEngineFeature (copy), React (copy), FoundationProvider (copy), FoundationModule (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), ReactFocusNavigationModule (copy), NewResult (copy), Provider (copy), InGameToastNotificationActionEventReceiverModule (copy), GetFFlagEnableSecurityAlertToastCallbackFunction (copy), SecurityAlertEventReceiverModule (copy), ToastNotificationWrapperModule (copy), ReactRoblox (copy)
	local ToastNotification = Instance.new("Folder")
	ToastNotification.Name = "ToastNotification"
	ToastNotification.Parent = CoreGui
	ReactRoblox.createRoot(ToastNotification):render(if ClientToastNotificationsEnabledEngineFeature then React.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
		StyleProvider = React.createElement(StyleProviderWithDefaultTheme, { withUiModeSupport = false, withDarkTheme = true }, {
			LocalizationProvider = React.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				FocusNavigationProvider = React.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
					FocusNavigationRegistryProvider = React.createElement(Provider, nil, {
						React.createElement(InGameToastNotificationActionEventReceiverModule),
						SecurityAlertEventReceiver = if GetFFlagEnableSecurityAlertToastCallbackFunction() then React.createElement(SecurityAlertEventReceiverModule) else nil,
						ToastNotificationWrapper = React.createElement(ToastNotificationWrapperModule, { displayOrder = 13, renderLocation = p1.renderLocation })
					})
				})
			})
		})
	}) else React.createElement(StyleProviderWithDefaultTheme, { withUiModeSupport = false, withDarkTheme = true }, {
		LocalizationProvider = React.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			ToastNotificationWrapper = React.createElement(ToastNotificationWrapperModule, { displayOrder = 13, renderLocation = p1.renderLocation }),
			InGameToastNotificationActionEventReceiver = React.createElement(InGameToastNotificationActionEventReceiverModule)
		})
	}))
end