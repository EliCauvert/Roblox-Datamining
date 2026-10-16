local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
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
local UIBloxModule = require(Parent.UIBlox)
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local CursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local UniversalAppPolicy = UniversalAppPolicyModule.UniversalAppPolicy
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local BulkPurchaseAppModule = require(BulkPurchaseApp.BulkPurchaseApp)
local BulkPurchaseReducerModule = require(BulkPurchaseApp.Store.Reducers.BulkPurchaseReducer)
local NetworkContext = require(Parent.EconomyCommonCoreScriptHooks).NetworkContext
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local Style = { themeName = "dark", fontName = "gotham" }

local function _() --[[ Line: 37 | Named "createFocusNavigationService" ]]
	-- upvalues: ReactFocusNavigationModule (copy)
	return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
end

local function createNetworkImpl() --[[ Line: 41 ]]
	-- upvalues: HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 43 ]]
			-- upvalues: HttpRequestModule (upval)
			return (HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3))
		end,
		maxRetryCount = game:DefineFastInt("BulkPurchaseMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("BulkPurchaseMaxHttpRequestWaitTime", 1)
	})
end

local _ = function() --[[ Line: 52 | Named "createStore" ]]
	-- upvalues: RoduxModule (copy), BulkPurchaseReducerModule (copy)
	return RoduxModule.Store.new(BulkPurchaseReducerModule, nil, { RoduxModule.makeThunkMiddleware() })
end

return function() --[[ Line: 58 | Named "renderBulkPurchaseApp" ]]
	-- upvalues: CoreGui (copy), RoduxModule (copy), BulkPurchaseReducerModule (copy), createNetworkImpl (copy), ReactFocusNavigationModule (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), AppStyleProvider (copy), Style (copy), NetworkContext (copy), RoactRoduxModule (copy), DesignTokenProvider (copy), SelectionCursorProvider (copy), CursorProvider (copy), Provider (copy), FFlagAXAddPlusUpsellToBulkPurchaseModule (copy), UniversalAppPolicy (copy), AppFeaturePolicies (copy), BulkPurchaseAppModule (copy), ReactRobloxModule (copy)
	local BulkPurchaseApp = Instance.new("Folder")
	BulkPurchaseApp.Name = "BulkPurchaseApp"
	BulkPurchaseApp.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(BulkPurchaseApp)
	Root:render((ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		StyleProvider = ReactModule.createElement(AppStyleProvider, { style = Style }, {
			NetworkProvider = ReactModule.createElement(NetworkContext.Provider, { value = createNetworkImpl() }, {
				StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
					store = RoduxModule.Store.new(BulkPurchaseReducerModule, nil, { RoduxModule.makeThunkMiddleware() })
				}, {
					DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, {
						CursorProvider = ReactModule.createElement(SelectionCursorProvider, {}, {
							NewCursorProvider = ReactModule.createElement(CursorProvider, {}, {
								FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, {
									value = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
								}, {
									FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, if FFlagAXAddPlusUpsellToBulkPurchaseModule then {
										PolicyProvider = ReactModule.createElement(UniversalAppPolicy.Provider, { policy = { AppFeaturePolicies } }, {
											BulkPurchaseApp = ReactModule.createElement(BulkPurchaseAppModule)
										})
									} else {
										BulkPurchaseApp = ReactModule.createElement(BulkPurchaseAppModule)
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