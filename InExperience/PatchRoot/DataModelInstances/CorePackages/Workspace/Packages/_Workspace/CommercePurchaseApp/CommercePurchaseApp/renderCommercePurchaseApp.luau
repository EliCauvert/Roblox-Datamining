local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local parent = commercePurchaseApp.Parent
local roduxModule = require(parent.Rodux)
local reactRobloxModule = require(parent.ReactRoblox)
local roactRoduxModule = require(parent.RoactRodux)
local reactModule = require(parent.React)
local httpRequestModule = require(parent.HttpRequest)
local designTokenProvider = require(parent.Style).DesignTokenProvider
local appStyleProvider = require(parent.Style).AppStyleProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.InExperienceLocales).Localization
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local UIBloxModule = require(parent.UIBlox)
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local cursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local commercePurchaseAppModule = require(commercePurchaseApp.CommercePurchaseApp)
local commercePurchaseReducerModule = require(commercePurchaseApp.Store.Reducers.CommercePurchaseReducer)
local networkContext = require(parent.EconomyCommonCoreScriptHooks).NetworkContext
local t = { themeName = "dark", fontName = "gotham" }

local function _() --[[ line: 32 | named "createFocusNavigationService" ]]
	-- upvalues: reactFocusNavigationModule (ref)
	return reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
end

local function createNetworkImpl() --[[ line: 36 ]]
	-- upvalues: httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p0, p1, p2) --[[ line: 38 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		maxRetryCount = game:DefineFastInt("CommercePurchaseMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("CommercePurchaseMaxHttpRequestWaitTime", 1)
	})
end

local _ = function() --[[ line: 47 | named "createStore" ]]
	-- upvalues: roduxModule (ref), commercePurchaseReducerModule (ref)
	return roduxModule.Store.new(commercePurchaseReducerModule, nil, { roduxModule.makeThunkMiddleware() })
end

return function() --[[ line: 53 | named "renderCommercePurchaseApp" ]]
	-- upvalues: coreGuiService (ref), roduxModule (ref), commercePurchaseReducerModule (ref), createNetworkImpl (ref), reactFocusNavigationModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), appStyleProvider (ref), t (ref), networkContext (ref), roactRoduxModule (ref), designTokenProvider (ref), selectionCursorProvider (ref), cursorProvider (ref), provider (ref), commercePurchaseAppModule (ref), reactRobloxModule (ref)
	local commercePurchaseApp = Instance.new("Folder")
	commercePurchaseApp.Name = "CommercePurchaseApp"
	commercePurchaseApp.Parent = coreGuiService
	local var15 = reactRobloxModule.createRoot(commercePurchaseApp)
	var15:render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		reactModule.createElement(appStyleProvider, { style = t }, {
			NetworkProvider = reactModule.createElement(networkContext.Provider, { value = createNetworkImpl() }, {
				StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, {
					store = roduxModule.Store.new(commercePurchaseReducerModule, nil, { roduxModule.makeThunkMiddleware() })
				}, {
					DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
						CursorProvider = reactModule.createElement(selectionCursorProvider, {}, {
							NewCursorProvider = reactModule.createElement(cursorProvider, {}, {
								FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, {
									value = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
								}, {
									FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
										CommercePurchaseApp = reactModule.createElement(commercePurchaseAppModule)
									})
								})
							})
						})
					})
				})
			})
		})
	}))
	
	return var15
end