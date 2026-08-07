local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactRobloxModule = require(parent.ReactRoblox)
local roduxModule = require(parent.Rodux)
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
local inExperienceTransferAppModule = require(currencyTransfers.Components.InExperienceTransferApp)
local networkContext = require(parent.EconomyCommonCoreScriptHooks).NetworkContext
local t = { themeName = "dark", fontName = "gotham" }

local function _() --[[ line: 31 | named "createFocusNavigationService" ]]
	-- upvalues: reactFocusNavigationModule (ref)
	return reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
end

local function createNetworkImpl() --[[ line: 35 ]]
	-- upvalues: httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p0, p1, p2) --[[ line: 37 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		maxRetryCount = game:DefineFastInt("InExperienceTransferMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("InExperienceTransferMaxHttpRequestWaitTime", 1)
	})
end

return function() --[[ line: 46 | named "renderInExperienceTransferApp" ]]
	-- upvalues: coreGuiService (ref), createNetworkImpl (ref), reactFocusNavigationModule (ref), roduxModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), appStyleProvider (ref), t (ref), networkContext (ref), roactRoduxModule (ref), designTokenProvider (ref), selectionCursorProvider (ref), cursorProvider (ref), provider (ref), inExperienceTransferAppModule (ref), reactRobloxModule (ref)
	local inExperienceTransferApp = Instance.new("Folder")
	inExperienceTransferApp.Name = "InExperienceTransferApp"
	inExperienceTransferApp.Parent = coreGuiService
	local var14 = reactRobloxModule.createRoot(inExperienceTransferApp)
	var14:render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		StyleProvider = reactModule.createElement(appStyleProvider, { style = t }, {
			NetworkProvider = reactModule.createElement(networkContext.Provider, { value = createNetworkImpl() }, {
				StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, {
					store = roduxModule.Store.new(function(p3) --[[ line: 55 ]]
						return p3 or {}
					end)
				}, {
					DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
						CursorProvider = reactModule.createElement(selectionCursorProvider, {}, {
							NewCursorProvider = reactModule.createElement(cursorProvider, {}, {
								FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, {
									value = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
								}, {
									FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
										InExperienceTransferApp = reactModule.createElement(inExperienceTransferAppModule)
									})
								})
							})
						})
					})
				})
			})
		})
	}))
	
	return var14
end