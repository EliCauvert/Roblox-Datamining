local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local parent = script.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local toastNotificationWrapperModule = require(parent.ToastNotificationWrapper)
local react = dependenciesModule.React
local reactRoblox = dependenciesModule.ReactRoblox
local _ = require(parent.type)
local styleProviderWithDefaultTheme = require(parent_1.Style).StyleProviderWithDefaultTheme
local foundationModule = require(parent_1.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local localization = require(parent_1.RobloxAppLocales).Localization
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local reactFocusNavigationModule = require(parent_1.ReactFocusNavigation)
local var1 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local provider = require(parent_1.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local inGameToastNotificationActionEventReceiverModule = require(script.Parent.InGameToastNotificationActionEventReceiver)
local securityAlertEventReceiverModule = require(script.Parent.receivers.SecurityAlertEventReceiver)
local clientToastNotificationsEnabledEngineFeature = game:GetEngineFeature("ClientToastNotificationsEnabled")
local getFFlagEnableSecurityAlertToastCallback = require(parent_1.SharedFlags).GetFFlagEnableSecurityAlertToastCallback

return function(p1)
	-- upvalues: coreGuiService (ref), clientToastNotificationsEnabledEngineFeature (ref), react (ref), foundationProvider (ref), foundationModule (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), localization (ref), localizationService (ref), reactFocusNavigationModule (ref), var1 (ref), provider (ref), inGameToastNotificationActionEventReceiverModule (ref), getFFlagEnableSecurityAlertToastCallback (ref), securityAlertEventReceiverModule (ref), toastNotificationWrapperModule (ref), reactRoblox (ref)
	local toastNotification = Instance.new("Folder")
	toastNotification.Name = "ToastNotification"
	toastNotification.Parent = coreGuiService
	reactRoblox.createRoot(toastNotification):render(if clientToastNotificationsEnabledEngineFeature then react.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
		StyleProvider = react.createElement(styleProviderWithDefaultTheme, { withUiModeSupport = false, withDarkTheme = true }, {
			LocalizationProvider = react.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, {
				FocusNavigationProvider = react.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
					FocusNavigationRegistryProvider = react.createElement(provider, nil, {
						react.createElement(inGameToastNotificationActionEventReceiverModule),
						SecurityAlertEventReceiver = if getFFlagEnableSecurityAlertToastCallback() then react.createElement(securityAlertEventReceiverModule) else nil,
						ToastNotificationWrapper = react.createElement(toastNotificationWrapperModule, { displayOrder = 13, renderLocation = p1.renderLocation })
					})
				})
			})
		})
	}) else react.createElement(styleProviderWithDefaultTheme, { withUiModeSupport = false, withDarkTheme = true }, {
		LocalizationProvider = react.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			ToastNotificationWrapper = react.createElement(toastNotificationWrapperModule, { displayOrder = 13, renderLocation = p1.renderLocation }),
			InGameToastNotificationActionEventReceiver = react.createElement(inGameToastNotificationActionEventReceiverModule)
		})
	}))
end