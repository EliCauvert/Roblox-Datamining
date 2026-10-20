local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
Default:logEventOnce("start_up_page_require_begin")
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local AppPrefetch = require(CorePackages.Workspace.Packages.RoactServiceTags).AppPrefetch
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local LoadingBarModule = require(Modules.LuaApp.Components.LoadingBar)
local ConstantsModule = require(Modules.LuaApp.Constants)
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local LaunchLuobuAppModule = require(Modules.Luobu.Thunks.LaunchLuobuApp)
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local AppStartupSequenceTag = require(CorePackages.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag
local AccountSwitcherConstants = require(CorePackages.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local CryoModule = require(CorePackages.Packages.Cryo)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableLuaAccountSwitch = SharedFlagsModule.FFlagEnableLuaAccountSwitch
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3eAuth = SharedFlagsModule.FFlagSignalsNavP3eAuth
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3eAuth then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local FFlagApplyLaunchContextForNewAccountSwitches = SharedFlagsModule.FFlagApplyLaunchContextForNewAccountSwitches
local FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = SharedFlagsModule.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local StartupPage = ReactModule.PureComponent:extend("StartupPage")

function StartupPage.didMount(p1)
	-- upvalues: LoginStatusModule (copy)
	local Networking = p1.props.networking
	local Analytics = p1.props.analytics
	local AppPolicy = p1.props.appPolicy
	local LoggingProtocol = p1.props.loggingProtocol
	local PrefetchProtocol = p1.props.prefetchProtocol
	
	if p1.props.authStatus == LoginStatusModule.UNKNOWN then
		p1.props.launchApp(Networking, p1.props.omniRecommendationsRequest, Analytics, AppPolicy, LoggingProtocol, p1.props.appStartupSequence, PrefetchProtocol)
	end
	p1.props.loggingProtocol:logEventOnce("startup_page_did_mount")
end

function StartupPage:render()
	-- upvalues: ReactModule (copy), ConstantsModule (copy), LoadingBarModule (copy)
	return ReactModule.createElement("Frame", {
		[ReactModule.Tag] = "app-screen.startup",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = ConstantsModule.Color.GRAY4,
		ZIndex = 1
	}, { LoadingBar = ReactModule.createElement(LoadingBarModule) })
end

local v1 = if FFlagSignalsNavP3eAuth then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	local v2 = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage)
	
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, { currentPageName = v2 and v2.name }))
end else RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagSignalsNavP3eAuth (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	local Name = nil
	
	if not FFlagSignalsNavP3eAuth then
		if FFlagUseNavigationSelectors then
			Name = Selectors.selectCurrentPageName(p1)
		else
			local HistoryEntry = p1.Navigation.history[#p1.Navigation.history]
			Name = HistoryEntry[#HistoryEntry].name
		end
	end
	return {
		authStatus = p1.AuthenticationStatus.status,
		currentPageName = if FFlagSignalsNavP3eAuth then nil else Name
	}
end, function(Callback)
	-- upvalues: FlagSettingsModule (copy), LaunchLuobuAppModule (copy), LaunchContextModule (copy), FFlagEnableLuaAccountSwitch (copy), FFlagApplyLaunchContextForNewAccountSwitches (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AppStorageUtilitiesModule (copy), AccountSwitcherConstants (copy), LaunchAppModule (copy)
	return {
		launchApp = function(p1, p2, p3, p4, p5, p6, p7)
			-- upvalues: FlagSettingsModule (upval), Callback (copy), LaunchLuobuAppModule (upval), LaunchContextModule (upval), FFlagEnableLuaAccountSwitch (upval), FFlagApplyLaunchContextForNewAccountSwitches (upval), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AppStorageUtilitiesModule (upval), AccountSwitcherConstants (upval), LaunchAppModule (upval)
			if FlagSettingsModule.LuaAuthEnabledForLuobu() and p4.useLuobuAuthentication() then
				Callback(LaunchLuobuAppModule(p1, p3, p4, LaunchContextModule.Startup))
				
				return
			end
			local Startup = LaunchContextModule.Startup
			
			if FFlagEnableLuaAccountSwitch and (FFlagApplyLaunchContextForNewAccountSwitches or FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues) then
				local AccountSwitchStatus = AppStorageUtilitiesModule.getAccountSwitchStatus()
				
				if AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus then
					Startup = LaunchContextModule.Login
				elseif AccountSwitchStatus == AccountSwitcherConstants.AccountSwitcherSwitchedFromSignupStatus then
					Startup = LaunchContextModule.SignUp
				end
			end
			Callback(LaunchAppModule(p1, p2, p3, p4, Startup, p5, p6, p7))
		end
	}
end)(StartupPage)
local v2 = RoactAppPolicy.connect(function(AppPolicy, _)
	return { appPolicy = AppPolicy }
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = RoactAnalyticsModule,
	loggingProtocol = AppLogging,
	appStartupSequence = AppStartupSequenceTag,
	prefetchProtocol = AppPrefetch
})(v1)))
Default:logEventOnce("start_up_page_require_end")

return v2