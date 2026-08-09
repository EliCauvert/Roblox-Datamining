local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Common.renderWithCoreScriptsStyleProvider)
local reactModule = require(corePackagesService.Packages.React)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local callProtocolModule = require(corePackagesService.Workspace.Packages.CallProtocol)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local apolloProvider = require(corePackagesService.Packages.ApolloClient).ApolloProvider
local apolloClientModule = require(robloxGui.Modules.ApolloClient)
local initCallModule = require(script.initCall)
local reducerModule = require(script.Reducer)
local contactListAppModule = require(script.Components.ContactListApp)
local contextModule = require(script.Context)
local analyticsModule = require(script.Analytics)
local t = {}
t.__index = t

function t.new() --[[ line: 34 ]]
	-- upvalues: t (ref), analyticsModule (ref), initCallModule (ref), callProtocolModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), roduxModule (ref), reducerModule (ref), roactRoduxModule (ref), renderWithCoreScriptsStyleProviderModule (ref), apolloProvider (ref), apolloClientModule (ref), roactModule (ref), contextModule (ref), contactListAppModule (ref), coreGuiService (ref)
	local tbl = setmetatable({}, t)
	local t_1 = {
		fireAnalyticsEvent = analyticsModule.Analytics().fireAnalyticsEvent
	}
	initCallModule(callProtocolModule.CallProtocol.default)
	
	local var19 = function(p0) --[[ line: 46 ]]
		-- upvalues: reactModule (copy), localizationProvider (copy), localization (copy), localizationService (copy)
		return reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, { App = p0 })
	end
	
	tbl.store = roduxModule.Store.new(reducerModule, nil, { roduxModule.thunkMiddleware })
	tbl.root = reactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		DisplayOrder = -1,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Content = reactModule.createElement(roactRoduxModule.StoreProvider, { store = tbl.store }, {
			ThemeProvider = renderWithCoreScriptsStyleProviderModule({
				ApolloProvider = reactModule.createElement(apolloProvider, { client = apolloClientModule }, {
					ContextProvider = roactModule.createElement(contextModule.Provider, { value = t_1 }, {
						ContactListApp = var19(reactModule.createElement(contactListAppModule))
					})
				})
			})
		})
	})
	tbl.element = roactModule.mount(tbl.root, coreGuiService, "ContactList")
	
	return tbl
end

return t.new()