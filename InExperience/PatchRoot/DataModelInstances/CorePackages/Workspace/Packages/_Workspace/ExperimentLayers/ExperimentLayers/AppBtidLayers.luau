game:DefineFastString("LuaAppSignupLayer", "PlayerApp.Signup")
game:DefineFastString("ConsoleSignUpLayer", "Consoles.Signup")
game:DefineFastString("AccountSwitcherLayer", "Accounts.AccountSwitcher")
game:DefineFastString("LuaAppLandingLayer", "PlayerApp.Landing")
game:DefineFastString("LuaAppIosPasswordSavingLayer", "PlayerApp.PasswordSaving.iOS")
game:DefineFastString("LuaAppAuthenticationStylingLayer", "PlayerApp.Authentication.Styling")
game:DefineFastString("AccountRecoveryUILayer", "AccountSecurity.SelfRecovery.RecoveryUI")
game:DefineFastString("ConsumerPlatformsIOSUIRefactor", "ConsumerPlatforms.IOSUIRefactor")

return {
	LoginLayer = "PlayerApp.Login",
	WidgetLayer = "ConsumerPlatforms.Widgets",
	LockScreenWidgetLayer = "ConsumerPlatforms.Widgets.LockScreen",
	DefaultThemeLayer = "ConsumerPlatforms.Themes",
	AndroidWidgetLayer = "ConsumerPlatforms.AndroidWidgets",
	DeferredDeeplinkResolutionLayer = "Ads.OffPlatform.DeferredDeeplinkResolution",
	SignupLayer = game:GetFastString("LuaAppSignupLayer"),
	LandingLayer = game:GetFastString("LuaAppLandingLayer"),
	AccountSwitcherLayer = game:GetFastString("AccountSwitcherLayer"),
	ConsoleSignUpLayer = game:GetFastString("ConsoleSignUpLayer"),
	IosPasswordSavingLayer = game:GetFastString("LuaAppIosPasswordSavingLayer"),
	AuthenticationStylingLayer = game:GetFastString("LuaAppAuthenticationStylingLayer"),
	AccountRecoveryUILayer = game:GetFastString("AccountRecoveryUILayer"),
	ConsumerPlatformsIOSUIRefactor = game:GetFastString("ConsumerPlatformsIOSUIRefactor")
}