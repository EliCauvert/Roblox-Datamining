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

local function _()
	-- upvalues: reactFocusNavigationModule (ref)
	return reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
end

local function createNetworkImpl()
	-- upvalues: httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("CommercePurchaseMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("CommercePurchaseMaxHttpRequestWaitTime", 1)
	})
end

local _ = function()
	-- upvalues: roduxModule (ref), commercePurchaseReducerModule (ref)
	return roduxModule.Store.new(commercePurchaseReducerModule, nil, { roduxModule.makeThunkMiddleware() })
end

return function()
	-- upvalues: coreGuiService (ref), roduxModule (ref), commercePurchaseReducerModule (ref), createNetworkImpl (ref), reactFocusNavigationModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), appStyleProvider (ref), t (ref), networkContext (ref), roactRoduxModule (ref), designTokenProvider (ref), selectionCursorProvider (ref), cursorProvider (ref), provider (ref), commercePurchaseAppModule (ref), reactRobloxModule (ref)
	local commercePurchaseApp = Instance.new("Folder")
	commercePurchaseApp.Name = "CommercePurchaseApp"
	commercePurchaseApp.Parent = coreGuiService
	local var1 = reactRobloxModule.createRoot(commercePurchaseApp)
	var1:render(reactModule.createElement(localizationProvider, {
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
	
	return var1
end