local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local Parent = CancelSubscriptionApp.Parent
local RoduxModule = require(Parent.Rodux)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoactRoduxModule = require(Parent.RoactRodux)
local ReactModule = require(Parent.React)
local HttpRequestModule = require(Parent.HttpRequest)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local AppStyleProvider = require(Parent.Style).AppStyleProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.InExperienceLocales).Localization
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local FoundationModule = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local CursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local CancelSubscriptionReducerModule = require(CancelSubscriptionApp.Store.Reducers.CancelSubscriptionReducer)
local CancelSubscriptionAppModule = require(CancelSubscriptionApp.CancelSubscriptionApp)
local NetworkContext = require(Parent.EconomyCommonCoreScriptHooks).NetworkContext
local FFlagLuaAppDefaultHttpRetry = require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local Style = { themeName = "dark", fontName = "gotham" }

local function _()
	-- upvalues: ReactFocusNavigationModule (copy)
	return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
end

local function createNetworkImpl()
	-- upvalues: HttpRequestModule (copy), FFlagLuaAppDefaultHttpRetry (copy)
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: HttpRequestModule (upval)
			return (HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3))
		end,
		maxRetryCount = if FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("RenderCancelSubscriptionAppHttpRetryCount", 4) else nil
	})
end

local _ = function()
	-- upvalues: RoduxModule (copy), CancelSubscriptionReducerModule (copy)
	return RoduxModule.Store.new(CancelSubscriptionReducerModule, nil, { RoduxModule.makeThunkMiddleware() })
end

return function()
	-- upvalues: CoreGui (copy), RoduxModule (copy), CancelSubscriptionReducerModule (copy), createNetworkImpl (copy), ReactFocusNavigationModule (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), AppStyleProvider (copy), Style (copy), NetworkContext (copy), RoactRoduxModule (copy), DesignTokenProvider (copy), SelectionCursorProvider (copy), CursorProvider (copy), Provider (copy), CancelSubscriptionAppModule (copy), FoundationModule (copy), ReactRobloxModule (copy)
	local CancelSubscriptionApp = Instance.new("Folder")
	CancelSubscriptionApp.Name = "CancelSubscriptionApp"
	CancelSubscriptionApp.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(CancelSubscriptionApp)
	Root:render((ReactModule.createElement(FoundationModule.FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
		LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			StyleProvider = ReactModule.createElement(AppStyleProvider, { style = Style }, {
				NetworkProvider = ReactModule.createElement(NetworkContext.Provider, { value = createNetworkImpl() }, {
					StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
						store = RoduxModule.Store.new(CancelSubscriptionReducerModule, nil, { RoduxModule.makeThunkMiddleware() })
					}, {
						DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, {
							CursorProvider = ReactModule.createElement(SelectionCursorProvider, {}, {
								NewCursorProvider = ReactModule.createElement(CursorProvider, {}, {
									FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, {
										value = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
									}, {
										FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, {
											CancelSubscriptionApp = ReactModule.createElement(CancelSubscriptionAppModule)
										})
									})
								})
							})
						})
					})
				})
			})
		})
	})))
	
	return Root
end