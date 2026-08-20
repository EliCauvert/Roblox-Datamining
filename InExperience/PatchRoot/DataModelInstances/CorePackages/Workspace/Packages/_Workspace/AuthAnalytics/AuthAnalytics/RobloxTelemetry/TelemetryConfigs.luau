local loggingProtocolModule = require(script:FindFirstAncestor("AuthAnalytics").Parent.LoggingProtocol)
local authPageMountThrottlingHundredthsPercent = game:DefineFastInt("AuthPageMountThrottlingHundredthsPercent", 0)
local validCookieForNoCachedUserThrottlingHundredthsPercent = game:DefineFastInt("ValidCookieForNoCachedUserThrottlingHundredthsPercent", 0)
local authButtonClickedThrottlingHundredthsPercent = game:DefineFastInt("AuthButtonClickedThrottlingHundredthsPercent", 0)
local silentPasskeyUpgradeThrottlingHundredthsPercent = game:DefineFastInt("SilentPasskeyUpgradeThrottlingHundredthsPercent", 0)
local deepLinkNavigationLockThrottlingHundredthsPercent = game:DefineFastInt("DeepLinkNavigationLockThrottlingHundredthsPercent", 0)
local unauthorizedErrorThrottlingHundredthsPercent = game:DefineFastInt("UnauthorizedErrorThrottlingHundredthsPercent", 0)
local iosAuthServiceLoginThrottlingHundredthsPercent = game:DefineFastInt("IosAuthServiceLoginThrottlingHundredthsPercent", 0)
local iosAuthServiceHealthCounterThrottlingHundredthsPercent = game:DefineFastInt("IosAuthServiceHealthCounterThrottlingHundredthsPercent", 0)
local luaLogoutThrottlingHundredthsPercent = game:DefineFastInt("LuaLogoutThrottlingHundredthsPercent", 0)
local keystoreTelemetryThrottlingHundredthsPercent = game:DefineFastInt("KeystoreTelemetryThrottlingHundredthsPercent", 0)
local var11 = if game:DefineFastFlag("FixIosAuthServiceCredentialSheetBackends", false) then { loggingProtocolModule.TelemetryBackends.Counter } else {
	loggingProtocolModule.TelemetryBackends.Counter,
	loggingProtocolModule.TelemetryBackends.EventIngest
}
local list = { loggingProtocolModule.TelemetryBackends.EventIngest }

return {
	LandingPageMountTelemetryConfig = {
		eventName = "luaLandingPageMount",
		description = "Report when landing page is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authPageMountThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 7 }
	},
	LoginPageMountTelemetryConfig = {
		eventName = "luaLoginPageMount",
		description = "Report when login page is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authPageMountThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 14 }
	},
	SignupPageMountTelemetryConfig = {
		eventName = "luaSignupPageMount",
		description = "Report when signup page is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authPageMountThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 14 }
	},
	AddAuthMethodPageMountTelemetryConfig = {
		eventName = "luaAddAuthMethodPageMount",
		description = "Report when add auth method page is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authPageMountThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 14 }
	},
	ConsoleSSOAttemptedTelemetryConfig = {
		eventName = "luaConsoleSSOAttempted",
		description = "Report when a console SSO attempt is made.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authPageMountThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 17 }
	},
	SingleSignOnErrorMountTelemetryConfig = {
		eventName = "luaSingleSignOnErrorMount",
		description = "Report when the single sign on error is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authPageMountThrottlingHundredthsPercent,
		lastUpdated = { 26, 1, 28 }
	},
	ValidCookieForNoCachedUserTelemetryConfig = {
		eventName = "luaValidCookieForNoCachedUser",
		description = "Report when a valid cookie is found for a user that is not cached.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = validCookieForNoCachedUserThrottlingHundredthsPercent,
		lastUpdated = { 26, 5, 7 }
	},
	NoCookieForCachedUserTelemetryConfig = {
		eventName = "luaNoCookieForCachedUser",
		description = "Report when a user with a cached user does not have a valid cookie.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = validCookieForNoCachedUserThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 11 }
	},
	LaunchAppThunkInitiatedConfig = {
		eventName = "luaLaunchAppThunkInitiated",
		description = "Report when the launch app thunk is initiated.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = validCookieForNoCachedUserThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 14 }
	},
	LandingLoginButtonClickedConfig = {
		eventName = "luaLandingLoginButtonClicked",
		description = "Report when the landing login button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authButtonClickedThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 14 }
	},
	LandingSignupButtonClickedConfig = {
		eventName = "luaLandingSignupButtonClicked",
		description = "Report when the landing signup button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authButtonClickedThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 14 }
	},
	LogoutButtonClickedConfig = {
		eventName = "luaLogoutButtonClicked",
		description = "Report when the logout button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authButtonClickedThrottlingHundredthsPercent,
		lastUpdated = { 25, 4, 14 }
	},
	SilentPasskeyUpgradeAvailableConfig = {
		eventName = "luaSilentPasskeyUpgradeAvailable",
		description = "Report when a device is eligible for a silent passkey upgrade.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = silentPasskeyUpgradeThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 22 }
	},
	SilentPasskeyUpgradeAttemptedConfig = {
		eventName = "luaSilentPasskeyUpgradeAttempted",
		description = "Report when a silent passkey upgrade is attempted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = silentPasskeyUpgradeThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 22 }
	},
	SilentPasskeyUpgradeSuccessConfig = {
		eventName = "luaSilentPasskeyUpgradeSuccess",
		description = "Report when a silent passkey upgrade attempt succeeds.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = silentPasskeyUpgradeThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 22 }
	},
	SilentPasskeyUpgradeFailureConfig = {
		eventName = "luaSilentPasskeyUpgradeFailure",
		description = "Report when a silent passkey upgrade attempt fails.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = silentPasskeyUpgradeThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 22 }
	},
	SilentPasskeyUpgradeNoPasskeyConfig = {
		eventName = "luaSilentPasskeyUpgradeNoPasskey",
		description = "Report when a silent passkey upgrade proceeds because the user does not have a passkey.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = silentPasskeyUpgradeThrottlingHundredthsPercent,
		lastUpdated = { 26, 1, 12 }
	},
	DeepLinkPendingDueToNavigationLockConfig = {
		eventName = "luaDeepLinkPendingDueToNavigationLock",
		description = "Report when a deeplink is queued because navigation is locked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = deepLinkNavigationLockThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 24 }
	},
	DeepLinkProcessedAfterNavigationUnlockConfig = {
		eventName = "luaDeepLinkProcessedAfterNavigationUnlock",
		description = "Report when a queued deeplink is processed after navigation unlocks.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = deepLinkNavigationLockThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 24 }
	},
	SingleSignOnErrorRetryButtonClickedConfig = {
		eventName = "luaSingleSignOnErrorRetryButtonClicked",
		description = "Report when the SSO error screen retry button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = authButtonClickedThrottlingHundredthsPercent,
		lastUpdated = { 26, 1, 28 }
	},
	LuaLogoutTelemetryConfig = {
		eventName = "LuaLogout",
		description = "Counting logouts by reason.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { "RobloxTelemetryCounter" },
		throttlingPercentage = luaLogoutThrottlingHundredthsPercent,
		lastUpdated = { 26, 1, 21 }
	},
	UnauthorizedErrorTelemetryConfig = {
		eventName = "luaUnauthorizedError",
		description = "Report when a unauthorized error is encountered.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = unauthorizedErrorThrottlingHundredthsPercent,
		lastUpdated = { 26, 1, 21 }
	},
	IosAuthServiceLoginPasswordSaveAttemptedConfig = {
		eventName = "iosAuthServiceLoginPasswordSaveAttempted",
		description = "Report when save password to iOS Keychain is attempted after login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	IosAuthServiceLoginPasswordSaveSuccessConfig = {
		eventName = "iosAuthServiceLoginPasswordSaveSuccess",
		description = "Report when save password to iOS Keychain succeeds after login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	IosAuthServiceLoginPasswordSaveFailureConfig = {
		eventName = "iosAuthServiceLoginPasswordSaveFailure",
		description = "Report when save password to iOS Keychain fails after login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	IosAuthServiceLoginPasswordSaveSkippedConfig = {
		eventName = "iosAuthServiceLoginPasswordSaveSkipped",
		description = "Report when save password to iOS Keychain is skipped after login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	IosAuthServiceLoginCredentialSheetShownConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetShown",
		description = "Report when the iOS credential sheet is shown during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = var11,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	IosAuthServiceLoginCredentialSheetPasswordSelectedConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetPasswordSelected",
		description = "Report when a user selects a password from the iOS credential sheet during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = var11,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	IosAuthServiceLoginCredentialSheetPasskeySelectedConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetPasskeySelected",
		description = "Report when a user selects a passkey from the iOS credential sheet during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = var11,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	IosAuthServiceLoginCredentialSheetErrorConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetError",
		description = "Report when the iOS credential sheet returns an error during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = var11,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	IosAuthServiceLoginCredentialSheetDismissedConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetDismissed",
		description = "Report when the iOS credential sheet is dismissed without selection during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = var11,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 2, 11 }
	},
	KeystoreGetCredentialsTelemetryConfig = {
		eventName = "keystoreGetCredentials",
		description = "Counter for keystore get-credentials operations by result.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = keystoreTelemetryThrottlingHundredthsPercent,
		lastUpdated = { 26, 4, 21 }
	},
	KeystoreAutoLoginTelemetryConfig = {
		eventName = "keystoreAutoLogin",
		description = "Counter for keystore auto-login outcomes by result.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = keystoreTelemetryThrottlingHundredthsPercent,
		lastUpdated = { 26, 4, 21 }
	},
	KeystoreSaveCredentialsTelemetryConfig = {
		eventName = "keystoreSaveCredentials",
		description = "Counter for keystore save-credentials operations by result.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = keystoreTelemetryThrottlingHundredthsPercent,
		lastUpdated = { 26, 4, 21 }
	},
	KeystoreDeleteCredentialsTelemetryConfig = {
		eventName = "keystoreDeleteCredentials",
		description = "Counter for keystore delete-credentials operations by reason.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = keystoreTelemetryThrottlingHundredthsPercent,
		lastUpdated = { 26, 4, 21 }
	},
	KeystoreRedirectTelemetryConfig = {
		eventName = "keystoreRedirect",
		description = "Counter for keystore redirect operations by destination.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = keystoreTelemetryThrottlingHundredthsPercent,
		lastUpdated = { 26, 4, 21 }
	},
	IosAuthServiceLoginCredentialSheetLoginSuccessConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetLoginSuccess",
		description = "Report when a login attempt using a credential selected from the iOS credential sheet succeeds.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = var11,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 23 }
	},
	IosAuthServiceLoginCredentialSheetLoginFailureConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetLoginFailure",
		description = "Report when a login attempt using a credential selected from the iOS credential sheet fails.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = var11,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 23 }
	},
	IosAuthServiceLoginCredentialSheetUnavailableConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetUnavailable",
		description = "Report when the iOS credential sheet could not be shown during login because no supported credential types (password or passkey) were available.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = var11,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	},
	IosAuthServiceLoginCredentialSheetShownEventConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetShown",
		description = "EventStream twin: the iOS credential sheet was shown during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = list,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 8, 18 }
	},
	IosAuthServiceLoginCredentialSheetPasswordSelectedEventConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetPasswordSelected",
		description = "EventStream twin: a user selected a password from the iOS credential sheet during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = list,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 8, 18 }
	},
	IosAuthServiceLoginCredentialSheetPasskeySelectedEventConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetPasskeySelected",
		description = "EventStream twin: a user selected a passkey from the iOS credential sheet during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = list,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 8, 18 }
	},
	IosAuthServiceLoginCredentialSheetErrorEventConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetError",
		description = "EventStream twin: the iOS credential sheet returned an error during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = list,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 8, 18 }
	},
	IosAuthServiceLoginCredentialSheetDismissedEventConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetDismissed",
		description = "EventStream twin: the iOS credential sheet was dismissed without selection during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = list,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 8, 18 }
	},
	IosAuthServiceLoginCredentialSheetLoginSuccessEventConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetLoginSuccess",
		description = "EventStream twin: a login using a credential selected from the iOS credential sheet succeeded.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = list,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 8, 18 }
	},
	IosAuthServiceLoginCredentialSheetLoginFailureEventConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetLoginFailure",
		description = "EventStream twin: a login using a credential selected from the iOS credential sheet failed.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = list,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 8, 18 }
	},
	IosAuthServiceLoginCredentialSheetUnavailableEventConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetUnavailable",
		description = "EventStream twin: the iOS credential sheet could not be shown during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = list,
		throttlingPercentage = iosAuthServiceLoginThrottlingHundredthsPercent,
		lastUpdated = { 26, 8, 18 }
	},
	IosAuthServiceLoginSuccessConfig = {
		eventName = "iosAuthServiceLoginSuccess",
		description = "iOS Auth Service health: a lua-observed login succeeded.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceHealthCounterThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	},
	IosAuthServiceLoginFailureConfig = {
		eventName = "iosAuthServiceLoginFailure",
		description = "iOS Auth Service health: a lua-observed login failed.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceHealthCounterThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	},
	IosAuthServiceLoginTwoStepRequiredConfig = {
		eventName = "iosAuthServiceLoginTwoStepRequired",
		description = "iOS Auth Service health: a lua-observed login required two-step verification (2SV/OTP) and is not yet complete.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceHealthCounterThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	},
	IosAuthServiceSignupSuccessConfig = {
		eventName = "iosAuthServiceSignupSuccess",
		description = "iOS Auth Service health: a lua-observed signup succeeded.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceHealthCounterThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	},
	IosAuthServiceSignupFailureConfig = {
		eventName = "iosAuthServiceSignupFailure",
		description = "iOS Auth Service health: a lua-observed signup failed.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceHealthCounterThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	},
	IosAuthServicePasswordSaveSuccessConfig = {
		eventName = "iosAuthServicePasswordSaveSuccess",
		description = "iOS Auth Service health: a lua-observed password save succeeded.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceHealthCounterThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	},
	IosAuthServicePasswordSaveFailureConfig = {
		eventName = "iosAuthServicePasswordSaveFailure",
		description = "iOS Auth Service health: a lua-observed password save failed.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = iosAuthServiceHealthCounterThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	}
}