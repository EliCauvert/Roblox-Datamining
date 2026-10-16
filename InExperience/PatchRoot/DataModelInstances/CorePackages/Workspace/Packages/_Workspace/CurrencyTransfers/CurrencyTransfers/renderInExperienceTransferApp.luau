local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoduxModule = require(Parent.Rodux)
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
local InExperienceTransferAppModule = require(CurrencyTransfers.Components.InExperienceTransferApp)
local NetworkContext = require(Parent.EconomyCommonCoreScriptHooks).NetworkContext
local Style = { themeName = "dark", fontName = "gotham" }

local function _() --[[ Line: 31 | Named "createFocusNavigationService" ]]
	-- upvalues: ReactFocusNavigationModule (copy)
	return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
end

local function createNetworkImpl() --[[ Line: 35 ]]
	-- upvalues: HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 37 ]]
			-- upvalues: HttpRequestModule (upval)
			return (HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3))
		end,
		maxRetryCount = game:DefineFastInt("InExperienceTransferMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("InExperienceTransferMaxHttpRequestWaitTime", 1)
	})
end

return function() --[[ Line: 46 | Named "renderInExperienceTransferApp" ]]
	-- upvalues: CoreGui (copy), createNetworkImpl (copy), ReactFocusNavigationModule (copy), RoduxModule (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), AppStyleProvider (copy), Style (copy), NetworkContext (copy), RoactRoduxModule (copy), DesignTokenProvider (copy), SelectionCursorProvider (copy), CursorProvider (copy), Provider (copy), InExperienceTransferAppModule (copy), ReactRobloxModule (copy)
	local InExperienceTransferApp = Instance.new("Folder")
	InExperienceTransferApp.Name = "InExperienceTransferApp"
	InExperienceTransferApp.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(InExperienceTransferApp)
	Root:render((ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		StyleProvider = ReactModule.createElement(AppStyleProvider, { style = Style }, {
			NetworkProvider = ReactModule.createElement(NetworkContext.Provider, { value = createNetworkImpl() }, {
				StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
					store = RoduxModule.Store.new(function(p1) --[[ Line: 55 ]]
						return p1 or {}
					end)
				}, {
					DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, {
						CursorProvider = ReactModule.createElement(SelectionCursorProvider, {}, {
							NewCursorProvider = ReactModule.createElement(CursorProvider, {}, {
								FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, {
									value = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
								}, {
									FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, {
										InExperienceTransferApp = ReactModule.createElement(InExperienceTransferAppModule)
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