local Parent = script:FindFirstAncestor("AuthTestHelpers").Parent
local TModule = require(Parent.t)
local ReactModule = require(Parent.React)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local UIBloxModule = require(Parent.UIBlox)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local AppStyleProvider = require(Parent.Style).AppStyleProvider
local Provider = require(Parent.RoactAppExperiment).Provider
local FocusControllerProvider = require(Parent.UnitTestHelpers).FocusControllerProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local MockIXPService = require(Parent.RoactAppExperiment).MockIXPService
local Constants = require(Parent.Style).Constants
local CryoModule = require(Parent.Cryo)
local FetchingStatus = require(Parent.Http).Reducers.FetchingStatus
local MockHttpResponse = require(Parent.UnitTestHelpers).mockHttpResponse
local StatusCodes = require(Parent.Http).StatusCodes
local PromiseModule = require(Parent.Promise)
local FoundationModule = require(Parent.Foundation)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local AppFeaturePolicies = require(Parent.UniversalAppPolicy).AppFeaturePolicies
local Analytics = require(Parent.Analytics).Analytics
local StrictInterfaceResult = TModule.strictInterface({
	includeTopBarSearchSignalProvider = TModule.optional(TModule.boolean),
	includeIXPServiceProvider = TModule.optional(TModule.boolean),
	includeABTestServiceProvider = TModule.optional(TModule.boolean),
	browserTrackerABTests = TModule.optional(TModule.table),
	userABTests = TModule.optional(TModule.table),
	browserTrackerLayers = TModule.optional(TModule.table),
	userLayers = TModule.optional(TModule.table),
	includeStoreProvider = TModule.optional(TModule.boolean),
	store = TModule.optional(TModule.table),
	initialStoreState = TModule.optional(TModule.table),
	includeAppGridProvider = TModule.optional(TModule.boolean),
	includeStyleProvider = TModule.optional(TModule.boolean),
	includeDesignTokenProvider = TModule.optional(TModule.boolean),
	tokenMappers = TModule.optional(TModule.table),
	includeThemeProvider = TModule.optional(TModule.boolean),
	includeAppPolicyProvider = TModule.optional(TModule.boolean),
	includeLocalizationProvider = TModule.optional(TModule.boolean),
	includeNavigationProvider = TModule.optional(TModule.boolean),
	includeFocusControllerProvider = TModule.optional(TModule.boolean),
	includeApolloProvider = TModule.optional(TModule.boolean),
	includeCursorProvider = TModule.optional(TModule.boolean),
	includeRootRNAppContainer = TModule.optional(TModule.boolean),
	middlewareList = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	captureFocusOnMount = TModule.optional(TModule.boolean),
	includeContentProvider = TModule.optional(TModule.boolean),
	includeFoundationProvider = TModule.optional(TModule.boolean),
	foundationOverlayGui = TModule.optional(TModule.any),
	theme = TModule.optional(TModule.table),
	appPolicy = TModule.optional(TModule.table),
	themeName = TModule.optional(TModule.string),
	appStyle = TModule.optional(TModule.table),
	appGridConfig = TModule.optional(TModule.table),
	localization = TModule.optional(TModule.table),
	navigation = TModule.optional(TModule.table),
	extraServices = TModule.optional(TModule.map(TModule.table, TModule.any)),
	apolloClient = TModule.optional(TModule.table)
})

local function v27()
	-- upvalues: Constants (copy), Localization (copy)
	return {
		includeTopBarSearchSignalProvider = false,
		includeABTestServiceProvider = false,
		includeIXPServiceProvider = true,
		browserTrackerABTests = {},
		userABTests = {},
		browserTrackerLayers = {},
		userLayers = {},
		includeStoreProvider = false,
		store = {},
		initialStoreState = nil,
		includeStyleProvider = true,
		includeAppGridProvider = false,
		includeDesignTokenProvider = false,
		tokenMappers = {},
		includeThemeProvider = true,
		includeAppPolicyProvider = false,
		includeLocalizationProvider = true,
		includeNavigationProvider = true,
		includeFocusControllerProvider = false,
		includeApolloProvider = false,
		includeCursorProvider = false,
		includeRootRNAppContainer = false,
		apolloClient = nil,
		focusController = nil,
		captureFocusOnMount = false,
		includeContentProvider = true,
		includeFoundationProvider = false,
		foundationOverlayGui = nil,
		middlewareList = nil,
		appPolicy = {},
		appStyle = {
			deviceType = "Desktop",
			themeName = Constants.ThemeName.Dark,
			fontName = Constants.FontName.Gotham
		},
		appGridConfig = nil,
		localization = Localization.new("en-us"),
		navigation = {
			isFocused = function(): boolean
				return false
			end,
			addListener = function()
				return { remove = function() end }
			end,
			getParam = function(_, p1)
				return p1
			end,
			navigate = function() end,
			state = { routeName = "DummyRoute" }
		},
		extraServices = nil
	}
end

local function _(p1)
	-- upvalues: PromiseModule (copy), MockHttpResponse (copy), StatusCodes (copy)
	assert(p1 ~= nil, "Expected responseBody not to be nil")
	
	return function(p2, _)
		-- upvalues: PromiseModule (upval), MockHttpResponse (upval), p1 (copy), StatusCodes (upval)
		return PromiseModule.resolve(MockHttpResponse.new(p2, p1, 0, StatusCodes.OK))
	end
end

return function(p1, p2)
	-- upvalues: v27 (copy), StrictInterfaceResult (copy), CryoModule (copy), RoactNetworking (copy), PromiseModule (copy), MockHttpResponse (copy), StatusCodes (copy), RoactAnalytics (copy), Analytics (copy), ReactModule (copy), DesignTokenProvider (copy), RoduxModule (copy), FetchingStatus (copy), RoactRoduxModule (copy), AppStyleProvider (copy), UIBloxModule (copy), Provider (copy), MockIXPService (copy), FocusControllerProvider (copy), LocalizationProvider (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), FoundationModule (copy), RoactServices (copy)
	local JoinResult = v27()
	
	if p2 then
		assert(StrictInterfaceResult(p2))
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	local Store = JoinResult.store
	local t = {}
	local Services = {}
	local t1 = {}
	assert(t1 ~= nil, "Expected responseBody not to be nil")
	
	Services[RoactNetworking] = function(p3, _)
		-- upvalues: PromiseModule (upval), MockHttpResponse (upval), t1 (copy), StatusCodes (upval)
		return PromiseModule.resolve(MockHttpResponse.new(p3, t1, 0, StatusCodes.OK))
	end
	
	Services[RoactAnalytics] = Analytics.mock()
	t.services = Services
	
	if JoinResult.extraServices ~= nil then
		for i, extraService in pairs(JoinResult.extraServices) do
			assert(type(i) == "table", "Expected key to be a table")
			t.services[i] = extraService
		end
	end
	local Config = {
		DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = JoinResult.tokenMappers }, p1)
	}
	local list = { RoduxModule.thunkMiddleware }
	local CombineReducersResult = RoduxModule.combineReducers({
		FetchingStatus = FetchingStatus,
		ScreenSize = function(p3, p4)
			local P7 = p3 or Vector2.new(0, 0)
			assert(P7, "")
			
			return if p4.type == "SetScreenSize" then p4.screenSize else P7
		end,
		CountryCodeList = function(p3, p4)
			local P9 = p3 or {}
			
			return if p4.type == "SetCountryCodeList" then p4.countryCodeList else P9
		end
	})
	
	local function v37(p3, p4)
		-- upvalues: CombineReducersResult (copy)
		return CombineReducersResult(p3, p4)
	end
	
	if JoinResult.initialStoreState then
		Store = RoduxModule.Store.new(v37, JoinResult.initialStoreState, list)
	elseif Store then
		if getmetatable(Store) == nil then
			Store = RoduxModule.Store.new(v37, Store, list)
		end
	else
		Store = RoduxModule.Store.new(v37, nil, list)
	end
	if JoinResult.includeStoreProvider then
		Config = {
			StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, Config)
		}
	end
	if JoinResult.includeStyleProvider then
		Config = {
			StyleProvider = ReactModule.createElement(AppStyleProvider, { style = JoinResult.appStyle }, Config)
		}
	end
	if JoinResult.includeCursorProvider then
		assert(JoinResult.includeStyleProvider, "includeStyleProvider must be set to `true` in order to include CursorProvider")
		Config = {
			CursorProvider = ReactModule.createElement(UIBloxModule.App.SelectionCursor.CursorProvider, {}, Config)
		}
	end
	if JoinResult.includeIXPServiceProvider then
		Config = {
			IXPServiceProvider = ReactModule.createElement(Provider, {
				value = MockIXPService.new(JoinResult.browserTrackerLayers, JoinResult.userLayers, true)
			}, Config)
		}
	end
	if JoinResult.includeFocusControllerProvider then
		Config = {
			FocusControllerProvider = ReactModule.createElement(FocusControllerProvider, {
				captureFocusOnMount = JoinResult.captureFocusOnMount,
				focusController = JoinResult.focusController
			}, Config)
		}
	end
	if JoinResult.includeThemeProvider then
		Config = {
			ThemeProvider = ReactModule.createElement(UIBloxModule.Style.Provider, {}, Config)
		}
	end
	if JoinResult.includeLocalizationProvider then
		Config = {
			LocalizationProvider = ReactModule.createElement(LocalizationProvider, { localization = JoinResult.localization }, Config)
		}
	end
	if JoinResult.includeAppPolicyProvider then
		Config = {
			AppPolicyProvider = ReactModule.createElement(RoactAppPolicy.Provider, {
				policy = { AppFeaturePolicies },
				policyData = JoinResult.appPolicy
			}, Config)
		}
	end
	if JoinResult.includeFoundationProvider or JoinResult.includeStyleProvider then
		Config = {
			FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, {
				device = "Phone",
				theme = "Dark",
				overlayGui = JoinResult.foundationOverlayGui
			}, Config)
		}
	end
	return (ReactModule.createElement(RoactServices.ServiceProvider, t, Config))
end