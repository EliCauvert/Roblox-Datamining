local Parent = script:FindFirstAncestor("TenFootUiTesting").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local AppNotificationService = require(Parent.RoactServiceTags).AppNotificationService
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local RoactServicesModule = require(Parent.RoactServices)
local MockProvidersModule = require(script.Parent.mockProviders)
local TenFootUiContext = require(Parent.TenFootUiCommon).TenFootUiContext
local _ = require(Parent.TenFootUiCommon)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SwitchTab = require(Parent.RobloxAppEnums).SwitchTab
local Constants = UIBloxModule.App.Style.Constants
local Images = UIBloxModule.App.ImageSet.Images
local RoactNavigationModule = require(Parent.RoactNavigation)
local NavigationRoduxModule = require(Parent.NavigationRodux)
local CreateMockNavigationObjectFunction = require(Parent.Navigation).TestUtils.createMockNavigationObject
local Jest = require(Parent.Dev.JestGlobals).jest
local Signal = require(Parent.AppCommonLib).Signal
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local MockCrossPlayState = {
	AuthenticationStatus = {
		status = require(Parent.RobloxAppEnums).LoginStatus.LOGGED_IN
	},
	Startup = { Preloading = false },
	CrossPlaySettings = {
		LuaError = nil,
		HttpError = nil,
		SystemError = nil,
		Status = { isEnabled = true, isSystemPrivilegeEnabled = true },
		SystemPrivileges = {},
		NetworkStatus = {}
	}
}
local config = {
	tabs = {
		{
			titleLocalizationKey = "CommonUI.Features.Label.Home",
			actionType = nil,
			page = SwitchTab.HomeTab,
			iconImage = Images["icons/menu/home_on"]
		},
		{
			titleLocalizationKey = "CommonUI.Features.Label.Discover",
			page = SwitchTab.GamesTab,
			iconImage = Images["icons/menu/games_on"],
			actionType = Enum.AppShellActionType.TapGamePageTab
		},
		{
			titleLocalizationKey = "CommonUI.Features.Label.Avatar",
			page = SwitchTab.AvatarExperienceTab,
			iconComponent = function()
				-- upvalues: ReactModule (copy)
				return ReactModule.createElement("Frame")
			end,
			actionType = Enum.AppShellActionType.TapAvatarTab
		}
	},
	options = {
		{
			titleLocalizationKey = "Feature.Catalog.Label.Search",
			icon = "icons/common/search",
			actionType = nil,
			page = AppPage.SearchPage
		},
		{
			titleLocalizationKey = "Feature.Home.Robux",
			icon = "icons/common/goldrobux",
			actionType = nil,
			page = AppPage.PurchaseRobux
		}
	}
}

local function _(p1)
	-- upvalues: RoactNavigationModule (copy)
	return RoactNavigationModule.createNavigator(RoactNavigationModule.RobloxSwitchView, RoactNavigationModule.StackRouter(p1), {})
end

local function makeTenFootUiContextMocks(GlobalNavConfig, MockNotificationService)
	-- upvalues: Signal (copy), Jest (copy), AppNotificationService (copy), RoactNavigationModule (copy)
	local LuaAppEvents = {
		ReloadPage = Signal.new(),
		ReportMutedError = Signal.new()
	}
	LuaAppEvents.ReloadPage.fire = Jest.fn()
	LuaAppEvents.ReportMutedError.fire = Jest.fn()
	local Proxy = newproxy(true)
	local config = {
		[AppNotificationService] = MockNotificationService,
		[Proxy] = { EventStream = {} }
	}
	
	return {
		LuaAppEvents = LuaAppEvents,
		RoactAnalytics = Proxy,
		buttonClick = Jest.fn(),
		globalNavConfig = GlobalNavConfig,
		useRoactService = Jest.fn().mockImplementation(function(p1)
			-- upvalues: config (copy)
			return config[p1]
		end),
		RootNavigator = RoactNavigationModule.createNavigator(RoactNavigationModule.RobloxSwitchView, RoactNavigationModule.StackRouter({
			{
				Foo = function()
					return nil
				end
			}
		}), {})
	}
end

local _ = function()
	-- upvalues: Jest (copy)
	return { ActionTaken = Jest.fn() }
end

local function makeMockLoggingService()
	-- upvalues: Jest (copy)
	return {
		logEventWithTimestamp = Jest.fn(),
		logEvent = Jest.fn(),
		logEventOnce = Jest.fn(),
		getTimestamp = Jest.fn(),
		logRobloxTelemetryEvent = Jest.fn(),
		logRobloxTelemetryCounter = Jest.fn(),
		logEphemeralCounterEvent = Jest.fn(),
		logEphemeralStatEvent = Jest.fn()
	}
end

local function makeMockGlobalNavConfig(p1)
	-- upvalues: config (copy)
	return p1 or config
end

local function makeMockNavigation(NavigationState)
	-- upvalues: AppPage (copy), SwitchTab (copy), CryoModule (copy), NavigationRoduxModule (copy), Jest (copy)
	local config = {
		state = CryoModule.Dictionary.join({
			index = 1,
			routes = {
				{ key = "Landing", routeName = AppPage.Landing },
				{ key = "Startup", routeName = AppPage.Startup },
				{ key = "Home", routeName = SwitchTab.HomeTab },
				{ key = "Games", routeName = SwitchTab.GamesTab },
				{
					key = "AvatarExperienceRoot",
					routeName = SwitchTab.AvatarExperienceTab
				},
				{ key = "SearchPage", routeName = AppPage.SearchPage },
				{ key = "PurchaseRobux", routeName = AppPage.PurchaseRobux }
			},
			routeName = NavigationRoduxModule.Constants.TempRnSwitchNavigatorName
		}, NavigationState or {}),
		isFocused = Jest.fn().mockReturnValue(false),
		addListener = Jest.fn().mockImplementation(function()
			-- upvalues: Jest (upval)
			return { remove = Jest.fn() }
		end),
		dispatch = Jest.fn(),
		getParam = Jest.fn()
	}
	config.navigate = Jest.fn().mockImplementation(function(RouteName)
		-- upvalues: CryoModule (upval), config (copy)
		local Where = CryoModule.List.findWhere(config.state.routes, function(p1): boolean
			-- upvalues: RouteName (copy)
			return p1.routeName == RouteName
		end)
		
		if Where == nil then
			error("No navigated route [" .. RouteName .. "] has been mocked")
			
			return
		else
			config.state = CryoModule.Dictionary.join(config.state, { index = Where })
		end
	end)
	config.getChildNavigation = Jest.fn()
	config.router = { getScreenOptions = Jest.fn() }
	
	return config
end

local Module = {}
Module.__index = Module

function Module.new(Locale)
	-- upvalues: Signal (copy), Module (copy)
	local config = { locale = Locale, changed = Signal.new() }
	setmetatable(config, Module)
	
	return config
end

function Module:SetLocale(Locale)
	if self.locale ~= Locale then
		self.locale = Locale
		self.changed:fire()
	end
end

function Module:GetLocale()
	return self.locale
end

function Module:Format(Text, _): string
	return "Localized:" .. Text
end

function makeMockLocalization()
	-- upvalues: Module (copy)
	return Module.new("en-us")
end

return {
	makeMockGlobalNavConfig = makeMockGlobalNavConfig,
	makeMockProviders = function(p1)
		-- upvalues: config (copy), Jest (copy), makeMockLoggingService (copy), makeMockNavigation (copy), makeTenFootUiContextMocks (copy), MockProvidersModule (copy), Constants (copy), ReactModule (copy), DesignTokenProvider (copy), LocalizationProvider (copy), TenFootUiContext (copy), RoactServicesModule (copy), AppLogging (copy)
		local P15 = p1 or {}
		assert(P15, "Config must not be nil")
		local MockLocalization = makeMockLocalization()
		local GlobalNavConfig = P15.globalNavConfig or config
		local MockNotificationService = { ActionTaken = Jest.fn() }
		local MockLoggingService = makeMockLoggingService()
		local MockNavigation = makeMockNavigation(P15.navigationState)
		local TenFootUiContextMocks = makeTenFootUiContextMocks(GlobalNavConfig, MockNotificationService)
		
		return {
			function(p2)
				-- upvalues: MockProvidersModule (upval), P15 (ref), MockNavigation (copy), Constants (upval)
				return MockProvidersModule(p2.children, {
					includeStoreProvider = true,
					includeStyleProvider = true,
					includeNavigationProvider = true,
					includeAppPolicyProvider = true,
					store = P15.store,
					initialStoreState = P15.initialStoreState or {},
					navigation = MockNavigation,
					appStyle = {
						deviceType = "Console",
						themeName = Constants.ThemeName.Dark,
						fontName = Constants.FontName.Gotham
					},
					policyFactory = P15.policyFactory,
					appPolicy = P15.appPolicy
				})
			end,
			function(p2)
				-- upvalues: ReactModule (upval), DesignTokenProvider (upval), P15 (ref)
				return ReactModule.createElement(DesignTokenProvider, {
					tokenMappers = P15.tokenMappers or {},
					uiModeInfo = { deviceType = "Console", uiMode = "TenFoot" }
				}, p2.children)
			end,
			function(p2)
				-- upvalues: ReactModule (upval), LocalizationProvider (upval), MockLocalization (copy)
				return ReactModule.createElement(LocalizationProvider, { localization = MockLocalization }, p2.children)
			end,
			function(p2)
				-- upvalues: ReactModule (upval), TenFootUiContext (upval), P15 (ref), TenFootUiContextMocks (copy)
				return ReactModule.createElement(TenFootUiContext.Provider, { value = P15.tenFootUiContext or TenFootUiContextMocks }, p2.children)
			end,
			function(p2)
				-- upvalues: ReactModule (upval), RoactServicesModule (upval), AppLogging (upval), MockLoggingService (copy)
				return ReactModule.createElement(RoactServicesModule.RoactServices.ServiceProvider, { services = { [AppLogging] = MockLoggingService } }, p2.children)
			end
		}, {
			globalNavConfig = GlobalNavConfig,
			mockNavigation = MockNavigation,
			mockTenFootUiContext = TenFootUiContextMocks,
			mockNotificationService = MockNotificationService,
			mockLogging = MockLoggingService
		}
	end,
	makeMockDescriptor = function(Key, State, ScreenKind)
		-- upvalues: ReactModule (copy), CreateMockNavigationObjectFunction (copy)
		local Navigation = nil
		local ScreenProps = nil
		local TestComponent = ReactModule.Component:extend("TestComponent")
		
		function TestComponent.render(p1)
			-- upvalues: Navigation (ref), ScreenProps (ref)
			Navigation = p1.props.navigation
			ScreenProps = p1.props.screenProps
			
			return nil
		end
		
		return {
			getComponent = function()
				-- upvalues: TestComponent (copy)
				return TestComponent
			end,
			key = Key,
			options = { screenKind = ScreenKind },
			navigation = CreateMockNavigationObjectFunction(State),
			state = State
		}, Navigation, ScreenProps
	end,
	makeMockLocalization = makeMockLocalization,
	makeTenFootUiContextMocks = makeTenFootUiContextMocks,
	mockCrossPlayState = MockCrossPlayState
}