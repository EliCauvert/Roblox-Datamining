local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local parent = cancelSubscriptionApp.Parent
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
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local cursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local cancelSubscriptionReducerModule = require(cancelSubscriptionApp.Store.Reducers.CancelSubscriptionReducer)
local cancelSubscriptionAppModule = require(cancelSubscriptionApp.CancelSubscriptionApp)
local networkContext = require(parent.EconomyCommonCoreScriptHooks).NetworkContext
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local t = { themeName = "dark", fontName = "gotham" }

local function _() --[[ line: 35 | named "createFocusNavigationService" ]]
	-- upvalues: reactFocusNavigationModule (ref)
	return reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
end

local function createNetworkImpl() --[[ line: 39 ]]
	-- upvalues: httpRequestModule (ref), fFlagLuaAppDefaultHttpRetry (ref)
	return httpRequestModule.config({
		requestFunction = function(p0, p1, p2) --[[ line: 41 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("RenderCancelSubscriptionAppHttpRetryCount", 4) else nil
	})
end

local _ = function() --[[ line: 51 | named "createStore" ]]
	-- upvalues: roduxModule (ref), cancelSubscriptionReducerModule (ref)
	return roduxModule.Store.new(cancelSubscriptionReducerModule, nil, { roduxModule.makeThunkMiddleware() })
end

return function() --[[ line: 57 | named "renderCancelSubscriptionApp" ]]
	-- upvalues: coreGuiService (ref), roduxModule (ref), cancelSubscriptionReducerModule (ref), createNetworkImpl (ref), reactFocusNavigationModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), appStyleProvider (ref), t (ref), networkContext (ref), roactRoduxModule (ref), designTokenProvider (ref), selectionCursorProvider (ref), cursorProvider (ref), provider (ref), cancelSubscriptionAppModule (ref), foundationModule (ref), reactRobloxModule (ref)
	local cancelSubscriptionApp = Instance.new("Folder")
	cancelSubscriptionApp.Name = "CancelSubscriptionApp"
	cancelSubscriptionApp.Parent = coreGuiService
	local var16 = reactRobloxModule.createRoot(cancelSubscriptionApp)
	var16:render(reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
		LocalizationProvider = reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			StyleProvider = reactModule.createElement(appStyleProvider, { style = t }, {
				NetworkProvider = reactModule.createElement(networkContext.Provider, { value = createNetworkImpl() }, {
					StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, {
						store = roduxModule.Store.new(cancelSubscriptionReducerModule, nil, { roduxModule.makeThunkMiddleware() })
					}, {
						DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
							CursorProvider = reactModule.createElement(selectionCursorProvider, {}, {
								NewCursorProvider = reactModule.createElement(cursorProvider, {}, {
									FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, {
										value = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
									}, {
										FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
											CancelSubscriptionApp = reactModule.createElement(cancelSubscriptionAppModule)
										})
									})
								})
							})
						})
					})
				})
			})
		})
	}))
	
	return var16
end