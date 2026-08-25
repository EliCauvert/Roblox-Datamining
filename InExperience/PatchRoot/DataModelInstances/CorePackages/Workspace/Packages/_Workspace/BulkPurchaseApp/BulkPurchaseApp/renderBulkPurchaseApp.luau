local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
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
local bulkPurchaseAppModule = require(bulkPurchaseApp.BulkPurchaseApp)
local bulkPurchaseReducerModule = require(bulkPurchaseApp.Store.Reducers.BulkPurchaseReducer)
local networkContext = require(parent.EconomyCommonCoreScriptHooks).NetworkContext
local t = { themeName = "dark", fontName = "gotham" }

local function _()
	-- upvalues: reactFocusNavigationModule (ref)
	return reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
end

local function createNetworkImpl()
	-- upvalues: httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p0, p1, p2)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		maxRetryCount = game:DefineFastInt("BulkPurchaseMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("BulkPurchaseMaxHttpRequestWaitTime", 1)
	})
end

local _ = function()
	-- upvalues: roduxModule (ref), bulkPurchaseReducerModule (ref)
	return roduxModule.Store.new(bulkPurchaseReducerModule, nil, { roduxModule.makeThunkMiddleware() })
end

return function()
	-- upvalues: coreGuiService (ref), roduxModule (ref), bulkPurchaseReducerModule (ref), createNetworkImpl (ref), reactFocusNavigationModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), appStyleProvider (ref), t (ref), networkContext (ref), roactRoduxModule (ref), designTokenProvider (ref), selectionCursorProvider (ref), cursorProvider (ref), provider (ref), bulkPurchaseAppModule (ref), reactRobloxModule (ref)
	local bulkPurchaseApp = Instance.new("Folder")
	bulkPurchaseApp.Name = "BulkPurchaseApp"
	bulkPurchaseApp.Parent = coreGuiService
	local var15 = reactRobloxModule.createRoot(bulkPurchaseApp)
	var15:render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		StyleProvider = reactModule.createElement(appStyleProvider, { style = t }, {
			NetworkProvider = reactModule.createElement(networkContext.Provider, { value = createNetworkImpl() }, {
				StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, {
					store = roduxModule.Store.new(bulkPurchaseReducerModule, nil, { roduxModule.makeThunkMiddleware() })
				}, {
					DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
						CursorProvider = reactModule.createElement(selectionCursorProvider, {}, {
							NewCursorProvider = reactModule.createElement(cursorProvider, {}, {
								FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, {
									value = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
								}, {
									FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
										BulkPurchaseApp = reactModule.createElement(bulkPurchaseAppModule)
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