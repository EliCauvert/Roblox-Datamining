local Parent = script:FindFirstAncestor("TenFootUiTesting").Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local UIBloxModule = require(Parent.UIBlox)
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local AppFeaturePolicies = require(Parent.UniversalAppPolicy).AppFeaturePolicies
local TModule = require(Parent.t)
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Constants = UIBloxModule.App.Style.Constants
local FoundationModule = require(Parent.Foundation)
local MockContentProvider = UIBloxModule.UnitTestHelpers.MockContentProvider
local StrictInterfaceResult = TModule.strictInterface({
	includeStoreProvider = TModule.optional(TModule.boolean),
	store = TModule.optional(TModule.table),
	topLevelReducer = TModule.optional(TModule.callback),
	initialStoreState = TModule.optional(TModule.table),
	includeStyleProvider = TModule.optional(TModule.boolean),
	includeFoundationProvider = TModule.optional(TModule.boolean),
	includeLocalizationProvider = TModule.optional(TModule.boolean),
	includeNavigationProvider = TModule.optional(TModule.boolean),
	includeAppPolicyProvider = TModule.optional(TModule.boolean),
	includeFocusControllerProvider = TModule.optional(TModule.boolean),
	middlewareList = TModule.optional(TModule.table),
	appStyle = TModule.optional(TModule.table),
	appPolicy = TModule.optional(TModule.table),
	policyFactory = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	focusController = TModule.optional(TModule.table),
	captureFocusOnMount = TModule.optional(TModule.boolean),
	includeContentProvider = TModule.optional(TModule.boolean),
	localization = TModule.optional(TModule.table),
	navigation = TModule.optional(TModule.table)
})

local function getDefaultArgs()
	-- upvalues: Constants (copy)
	return {
		includeStoreProvider = false,
		store = nil,
		topLevelReducer = nil,
		initialStoreState = nil,
		includeStyleProvider = true,
		includeFoundationProvider = false,
		includeLocalizationProvider = true,
		includeNavigationProvider = false,
		includeAppPolicyProvider = true,
		includeFocusControllerProvider = false,
		focusController = nil,
		captureFocusOnMount = false,
		includeContentProvider = false,
		middlewareList = nil,
		policyFactory = nil,
		appPolicy = nil,
		appStyle = {
			themeName = Constants.ThemeName.Dark,
			fontName = Constants.FontName.Gotham
		},
		localization = {},
		navigation = {
			isFocused = function(): boolean
				return false
			end,
			addListener = function()
				return { remove = function() end }
			end,
			getParam = function()
				return nil
			end,
			navigate = function() end,
			state = { routeName = "DummyRoute" }
		}
	}
end

assert(StrictInterfaceResult((getDefaultArgs())))

local function staticReducer(p1)
	return p1
end

return function(Config, p1)
	-- upvalues: getDefaultArgs (copy), StrictInterfaceResult (copy), DashModule (copy), RoduxModule (copy), staticReducer (copy), ReactModule (copy), RoactRoduxModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), AppStyleProvider (copy), FoundationModule (copy), Constants (copy), RoactNavigationModule (copy), UIBloxModule (copy), MockContentProvider (copy)
	assert(Config, "Expected a map of components, received none")
	local DefaultArgs = getDefaultArgs()
	
	if p1 then
		assert(StrictInterfaceResult(p1))
		DefaultArgs = DashModule.join(DefaultArgs, p1)
	end
	if DefaultArgs.includeStoreProvider then
		local list = { RoduxModule.thunkMiddleware }
		
		if DefaultArgs.middlewareList then
			DashModule.append(list, DefaultArgs.middlewareList)
		end
		local TopLevelReducer = DefaultArgs.topLevelReducer or staticReducer
		Config = {
			StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
				store = if DefaultArgs.store then DefaultArgs.store elseif DefaultArgs.initialStoreState then RoduxModule.Store.new(TopLevelReducer, DefaultArgs.initialStoreState, list) else RoduxModule.Store.new(TopLevelReducer, nil, list)
			}, Config)
		}
	end
	if DefaultArgs.includeAppPolicyProvider then
		Config = {
			PolicyProvider = ReactModule.createElement(RoactAppPolicy.Provider, {
				policy = {
					AppFeaturePolicies,
					DefaultArgs.policyFactory or function()
						return {}
					end
				},
				policyData = DefaultArgs.appPolicy
			}, Config)
		}
	end
	if DefaultArgs.includeStyleProvider then
		Config = {
			StyleProvider = ReactModule.createElement(AppStyleProvider, { style = DefaultArgs.appStyle }, Config)
		}
	end
	if DefaultArgs.includeFoundationProvider or DefaultArgs.includeStyleProvider then
		Config = {
			FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, {
				theme = if DefaultArgs.appStyle.themeName == Constants.ThemeName.Dark then FoundationModule.Enums.Theme.Dark else FoundationModule.Enums.Theme.Light,
				device = FoundationModule.Enums.Device.Desktop
			}, Config)
		}
	end
	if DefaultArgs.includeNavigationProvider then
		Config = {
			NavigationProvider = ReactModule.createElement(RoactNavigationModule.Provider, { value = DefaultArgs.navigation }, Config)
		}
	end
	local Folder = ReactModule.createElement("Folder", {}, Config)
	
	if DefaultArgs.includeContentProvider then
		Folder = ReactModule.createElement(UIBloxModule.App.Context.ContentProvider.Provider, { value = MockContentProvider.new() }, Folder)
	end
	return Folder
end